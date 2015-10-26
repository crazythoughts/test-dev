/**
 * 
 */
package com.kjjcsoft.model;
import java.io.*;

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
	private static final String UPLOAD_DIRECTORY_FINGER="customrer_fp";
//	THRESH HOLD MEMORY DEFINED
	private static final int MEMORY_THRESHOLD=1024*1024*3;
//	MAXIMUM SIZE OF THE FILE THAT CAN BE UPLOADED
	private static final int MAX_FILE_SIZE= 1024*1024* 40;
//	MAXIMUM SIZE OF THE REQUEST THAT CAN COME IN
	private static final int MAX_REQUEST_SIZE= 1024*1024*50;
	
	private String errorMsg; //error msg if the condition are not met during the process
	
//	<==========fuction block for uploading the photos and finger prints of the customer during registration
	public String customerFileUp(HttpServletRequest request){
		if (!ServletFileUpload.isMultipartContent(request)) {
			errorMsg="No files";
			return errorMsg;
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
	}
}
