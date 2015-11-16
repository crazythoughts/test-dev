package com.kjjcsoft.controllers;

import java.io.File;
import java.io.IOException;
import java.util.Iterator;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;

import com.kjjcsoft.bean.CustomerBean;
import com.kjjcsoft.model.Customer;

import static com.kjjcsoft.controllers.DirectoryProvider.*;

/**
 * Servlet implementation class CustomerRegUploadController
 */
@WebServlet(description = "for uploading files during customer registration", urlPatterns = { "/customeruploads" })
public class CustomerRegUploadController extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private boolean filesUploaded = false;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public CustomerRegUploadController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		RequestDispatcher rd = getServletContext().getRequestDispatcher("/view/customer_credentials.jsp");
		RequestDispatcher rdr = getServletContext().getRequestDispatcher("/KJJCSoft/com/kjjcsoft/controllers/registerd");
		if (filesUploaded) {
			rdr.forward(request, response);
		} else {
			rd.forward(request, response);
		}
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		if (request.getParameter("upload-files")!=null) {
//			declaration part for the required propertise
			String relativeUploadPath=getServletConfig().getServletContext().getRealPath("/")+"upload/";
			String contentType=request.getContentType();
			CustomerBean forUpObj = new CustomerBean();
			Customer uploadFiles = new Customer();
			String photoUpPath;
			String fingerPrintUpPath;
			File customerFile=null, fingerprintFile=null;
			boolean isError = false;
			/*Starting to process the data from the form*/
			if (contentType.indexOf("multipart/form-data")>=0) {
				/*creating a factory for disk-based file items*/
				DiskFileItemFactory factory = new DiskFileItemFactory();
				/*Defining the threshhold size of the file that will be kept in memory*/
				factory.setSizeThreshold(MEMORY_THRESHOLD);
				/*defining directory to temporary store file which are larger than the threshhold memory*/
				factory.setRepository(new File(relativeUploadPath+TMP));
				/*creating a file upload handler*/
				ServletFileUpload upload= new ServletFileUpload(factory);
				/*defining the maximum size of the file that can be uploaded to the form*/
				upload.setFileSizeMax(MAX_FILE_SIZE);
				/*defining the maximum size of the request(form-data+upload file)*/
				upload.setFileSizeMax(MAX_REQUEST_SIZE);
				/*defining the path for the directory to upload the customer photo*/
				photoUpPath=relativeUploadPath+PHOTO_UPLOAD_DIRECTORY;
				/*defining the path for the directory to upload the finger print of the customers*/
				fingerPrintUpPath=relativeUploadPath+FINGER_PRINT_UPLOAD_DIRECTORY;
				try{
					//parse the request objects content to extract the file data
					List<FileItem> formItems = upload.parseRequest(request);
					Iterator<FileItem> itr = formItems.iterator();
					while (itr.hasNext()) {
						FileItem item = (FileItem) itr.next();
						if (!item.isFormField()) {
							String fieldName=item.getFieldName();
							if (fieldName.equals("upload_photo")) {
								if(item.getName().equals("")){
									isError = true;
									request.setAttribute("errorp", "*No files Selected");
									return;
								} else {
									String fileName=item.getName();
									String mimeType = getServletContext().getMimeType(fileName);
									if (mimeType.startsWith("image/")) {
										if (fileName.lastIndexOf("\\")>0) {
											customerFile = new File(photoUpPath+File.separator+fileName.substring(fileName.lastIndexOf("\\")+1));
											forUpObj.setPhotoPath(PHOTO_UPLOAD_DIRECTORY+fileName.substring(fileName.lastIndexOf("\\")+1));
										} else {
											customerFile = new File(photoUpPath+File.separator+fileName.substring(fileName.lastIndexOf("\\")+1));
											forUpObj.setPhotoPath(PHOTO_UPLOAD_DIRECTORY+fileName.substring(fileName.lastIndexOf("\\")+1));
										}
									} else {
										isError = true;
										request.setAttribute("errorp", "*Selected file is not an image file");
									}
									item.write(customerFile);
								}
							}
							if (fieldName.equals("upload_fingerprints")) {
								if(item.getName().equals("")){
									isError = true;
									request.setAttribute("errorfp", "*No files selected");
									return;
								} else {
									String fileName=item.getName();
									String mimeType = getServletContext().getMimeType(fileName);
									if (mimeType.startsWith("image/")) {
										if (fileName.lastIndexOf("\\")>0) {
											fingerprintFile = new File(fingerPrintUpPath+fileName.substring(fileName.lastIndexOf("\\")+1));
											forUpObj.setFingerPrintPath(FINGER_PRINT_UPLOAD_DIRECTORY+fileName.substring(fileName.lastIndexOf("\\")+1));
										} else {
											fingerprintFile = new File(fingerPrintUpPath+fileName.substring(fileName.lastIndexOf("\\")+1));
											forUpObj.setFingerPrintPath(FINGER_PRINT_UPLOAD_DIRECTORY+fileName.substring(fileName.lastIndexOf("\\")+1));
										}
									} else {
										isError = true;
										request.setAttribute("errorfp", "*Selected file is not an image file");
										return;
									}
									item.write(fingerprintFile);
								}
							}
						}
					}
				} catch(Exception ex){
					System.out.println(ex);
				}
			}
			forUpObj.setCustomerId((int)request.getAttribute("registeredCustomerId"));
			if (!isError) {
				filesUploaded = uploadFiles.uploadCredentials(forUpObj);
			} 
		}
		doGet(request, response);
	}

}
