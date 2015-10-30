package com.kjjcsoft.controllers;

import java.io.File;
import java.io.IOException;
import java.text.ParsePosition;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.Iterator;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;

import com.kjjcsoft.bean.CustomerBean;
import com.kjjcsoft.bean.RetrivedUserBean;
import static com.kjjcsoft.controllers.DirectoryProvider.*;

/**
 * Servlet implementation class CustomerRegistrationController
 */
@WebServlet(description = "for registering the customer to the database", urlPatterns = { "/CustomerRegistration" })
public class CustomerRegistrationController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public CustomerRegistrationController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
//		declaration part for the required propertise
		String realPath=getServletContext().getRealPath("");
		String contentType=request.getContentType();
		CustomerBean customer=new CustomerBean();
		String photoUpPath;
		String fingerPrintUpPath;
		File customerFile=null, fingerprintFile=null;
		SimpleDateFormat sdf= new SimpleDateFormat("YYYY/MM/dd");
		/*Starting to process the data from the form*/
		if (contentType.indexOf("multipart/form-data")>=0) {
			/*creating a factory for disk-based file items*/
			DiskFileItemFactory factory = new DiskFileItemFactory();
			/*Defining the threshhold size of the file that will be kept in memory*/
			factory.setSizeThreshold(MEMORY_THRESHOLD);
			/*defining directory to temporary store file which are larger than the threshhold memory*/
			factory.setRepository(new File(realPath+TMP));
			/*creating a file upload handler*/
			ServletFileUpload upload= new ServletFileUpload(factory);
			/*defining the maximum size of the file that can be uploaded to the form*/
			upload.setFileSizeMax(MAX_FILE_SIZE);
			/*defining the maximum size of the request(form-data+upload file)*/
			upload.setFileSizeMax(MAX_REQUEST_SIZE);
			/*defining the path for the directory to upload the customer photo*/
			photoUpPath=realPath+PHOTO_UPLOAD_DIRECTORY;
			/*defining the path for the directory to upload the finger print of the customers*/
			fingerPrintUpPath=realPath+FINGER_PRINT_UPLOAD_DIRECTORY;
			try{
				//parse the request objects content to extract the file data
				List<FileItem> formItems = upload.parseRequest(request);
				Iterator<FileItem> itr = formItems.iterator();
				while (itr.hasNext()) {
					FileItem item = (FileItem) itr.next();
					if (item.isFormField()) {
						String fieldName=item.getFieldName();
						String fieldValue=item.getString();
						switch (fieldName){
						case "fullname":
							if (fieldValue==null) {
								response.sendRedirect("../../../view/customer_registration.jsp");
							} else{
								customer.setCustomerName(fieldValue);
							}
							break;
						case "dob":
							if (fieldValue == null) {
								response.sendRedirect("../../../view/customer_registration.jsp");
							} else {
								customer.setDob(sdf.parse(fieldValue));
							}
							break;
						case "sex":
							if (fieldValue == null) {
								response.sendRedirect("../../../view/customer_registration.jsp");
							} else {
								customer.setGender(fieldValue);
							}
							break;
						case "marital_status":
							if (fieldValue == null) {
								response.sendRedirect("../../../view/customer_registration.jsp");
							} else {
								customer.setGender(fieldValue);
							}
							break;
						}
					}
					if (!item.isFormField()) {
						String fieldName=item.getFieldName();
						if (fieldName.equals("upload_photo")) {
							String fileName=item.getName();
							String mimeType = getServletContext().getMimeType(fileName);
							if (mimeType.startsWith("image/")) {
								if (fileName.lastIndexOf("\\")>0) {
									customerFile = new File(photoUpPath+fileName.substring(fileName.lastIndexOf("\\")));
								} else {
									customerFile = new File(photoUpPath+fileName.substring(fileName.lastIndexOf("\\")+1));
								}
							} else {
								response.sendRedirect("../../../view/customer_registration.jsp");
							}
							item.write(customerFile);
						}
						if (fieldName.equals("upload_fingerprints")) {
							String fileName=item.getName();
							String mimeType = getServletContext().getMimeType(fileName);
							if (mimeType.startsWith("image/")) {
								if (fileName.lastIndexOf("\\")>0) {
									customerFile = new File(fingerPrintUpPath+fileName.substring(fileName.lastIndexOf("\\")));
								} else {
									customerFile = new File(fingerPrintUpPath+fileName.substring(fileName.lastIndexOf("\\")+1));
								}
							} else {
								response.sendRedirect("../../../view/customer_registration.jsp");
							}
							item.write(fingerprintFile);
						}
					}
				}
			} catch(Exception ex){
				System.out.println(ex);
			}
		}
		
	}

}
