/**
 * 
 */
package com.kjjcsoft.model;
import java.io.*;
import java.util.Iterator;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;

/**
 * @author Seekraw
 *
 */
public class ImagePlacer {
//	UPLOAD DIRECTORIES FOR THE UPLOADED FILES
	private static final String UPLOAD_DIRECTORY="customer_photos";
	private static final String UPLOAD_DIRECTORY_FINGER="customer_fp";
//	THRESH HOLD MEMORY DEFINED
	private static final int MEMORY_THRESHOLD=1024*1024*3;
//	MAXIMUM SIZE OF THE FILE THAT CAN BE UPLOADED
	private static final int MAX_FILE_SIZE= 1024*1024* 40;
//	MAXIMUM SIZE OF THE REQUEST THAT CAN COME IN
	private static final int MAX_REQUEST_SIZE= 1024*1024*50;
	
//	<==========fuction block for uploading the photos and finger prints of the customer during registration
	public String[] customerFileUp(HttpServletRequest request){
		File phFile, fpFile;
		String[] retPath= new String[2];
		if (!ServletFileUpload.isMultipartContent(request)) {
			retPath[0]="No files";
			return retPath;
		}
		DiskFileItemFactory factory= new DiskFileItemFactory();
		factory.setSizeThreshold(MEMORY_THRESHOLD);
//		directory to the temporary folder for storing file larger than threshhold memory
		factory.setRepository(new File(System.getProperty("user.dir")+File.separator+"tmp_upload"));
		ServletFileUpload upload= new ServletFileUpload(factory);
//		defining maximum size for the upload file
		upload.setFileSizeMax(MAX_FILE_SIZE);
//		size for the request(upload file + form data)
		upload.setSizeMax(MAX_REQUEST_SIZE);
		String photoUpPath= System.getProperty("user.dir")+File.separator+UPLOAD_DIRECTORY;
		String fingerUpPath=System.getProperty("user.dir")+File.separator+UPLOAD_DIRECTORY_FINGER;
		try{
			List formItems = upload.parseRequest(request);
			if (formItems!= null && formItems.size()>0) {
				Iterator i =formItems.iterator();
				while (i.hasNext()) {
					FileItem fi=(FileItem)i.next();
					if(!fi.isFormField()){
						String fieldName=fi.getFieldName();
						if (fieldName.equals("upload_photo")) {
							String fileName=fi.getName();
							if (fileName.lastIndexOf("\\")>0) {
								phFile=new File(photoUpPath+fileName.substring(fileName.lastIndexOf("\\")));
								retPath[0]=photoUpPath+fileName.substring(fileName.lastIndexOf("\\"));
							}
							else{
								phFile=new File(photoUpPath+fileName.substring(fileName.lastIndexOf("\\")+1));
								retPath[0]=photoUpPath+fileName.substring(fileName.lastIndexOf("\\")+1);
							}
							fi.write(phFile);
						}
						if (fieldName.equals("upload_fingerprints")) {
							String fileName=fi.getName();
							if (fileName.lastIndexOf("\\")>0) {
								fpFile=new File(fingerUpPath+fileName.substring(fileName.lastIndexOf("\\")));
								retPath[1]=fingerUpPath+fileName.substring(fileName.lastIndexOf("\\"));
							}else{
								fpFile=new File(fingerUpPath+fileName.substring(fileName.lastIndexOf("\\")+1));
								retPath[1]=fingerUpPath+fileName.substring(fileName.lastIndexOf("\\")+1);
							}
							fi.write(fpFile);
						}
					}					
				}
			}
		}catch(Exception ex){
			System.out.println(ex);
		}
		return retPath;
	}
}
