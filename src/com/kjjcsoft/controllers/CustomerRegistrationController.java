package com.kjjcsoft.controllers;

import java.io.File;
import java.io.IOException;
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
import com.kjjcsoft.model.Customer;
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
		CustomerBean customerDetail= new CustomerBean();
		RetrivedUserBean ses_usr=new RetrivedUserBean();
		ses_usr=(RetrivedUserBean)request.getSession().getAttribute("Userinfo");
		Customer newCustomer= new Customer();
		String photoUpPath;
		String fingerPrintUpPath;
		Date dt= new Date();
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
						case "account_type":
							if (fieldValue.equals("")) {
								response.sendRedirect("../../../view/customer_registration.jsp");
								return;
							} else {
								customer.setAccountType(fieldValue);
							}
							break;
						case "fullname":
							if (fieldValue.equals("")) {
								response.sendRedirect("../../../view/customer_registration.jsp");
								return;
							} else{
								customer.setCustomerName(fieldValue);
							}
							break;
						case "age":
							if (fieldValue.equals("")) {
								response.sendRedirect("../../../view/customer_registration.jsp");
								return;
							} else {
								customer.setCustomerAge(Integer.parseInt(fieldValue));
							}
							break;
						case "dob":
							if (fieldValue.equals("")) {
								response.sendRedirect("../../../view/customer_registration.jsp");
								return;
							} else {
								customer.setDob(sdf.parse(fieldValue));
							}
							break;
						case "sex":
							if (fieldValue.equals("")) {
								response.sendRedirect("../../../view/customer_registration.jsp");
								return;
							} else {
								customer.setGender(fieldValue);
							}
							break;
						case "nationality":
							if (fieldValue.equals("")) {
								response.sendRedirect("../../../view/customer_registration.jsp");
								return;
							} else {
								customer.setNationality(fieldValue);
							}
							break;
						case "citizenship_no":
							if (fieldValue.equals("")) {
								response.sendRedirect("../../../view/customer_registration.jsp");
								return;
							} else {
								customer.setCitizenShipNo(fieldValue);
							}
							break;
						case "marital_status":
							if (fieldValue.equals("")) {
								response.sendRedirect("../../../view/customer_registration.jsp");
								return;
							} else {
								customer.setMaritalStatus(fieldValue);
							}
							break;
						case "spouse_name":
							if (customer.getMaritalStatus().equals("Married")) {
								if (fieldValue.equals("")) {
									response.sendRedirect("../../../view/customer_registration.jsp");
									return;
								}else{
									customer.setSpouseName(fieldValue);
								}
							}else{
								customer.setSpouseName("");
							}
							break;
						case "occupation":
							if (fieldValue.equals("")) {
								response.sendRedirect("../../../view/customer_registration.jsp");
								return;
							} else {
								customer.setOccupation(fieldValue);
							}
							break;
						case "cellnumber_first":
							if (fieldValue.equals("")) {
								response.sendRedirect("../../../view/customer_registration.jsp");
								return;
							} else {
								customer.setCellNumberFirst(fieldValue);
							}
							break;
						case "cellnumber_second":
							if (fieldValue.equals("")) {
								customer.setCellNumberSecond("");
							} else {
								customer.setCellNumberSecond(fieldValue);
							}
							break;
						case "landline":
							if (fieldValue.equals("")) {
								customer.setLandLine("");
							} else {
								customer.setLandLine(fieldValue);
							}
							break;
						case "customer_email":
							if (fieldValue.equals("")) {
								customer.setEmailId("");
							} else {
								customer.setEmailId(fieldValue);
							}
							break;
						case "perm_dist":
							if (fieldValue.equals("")) {
								response.sendRedirect("../../../view/customer_registration.jsp");
								return;
							} else {
								customer.setPermDistrict(fieldValue);
							}
							break;
						case "perm_vdc_mp":
							if (fieldValue.equals("")) {
								response.sendRedirect("../../../view/customer_registration.jsp");
								return;
							} else {
								customer.setPermVdcMunicipality(fieldValue);
							}
							break;
						case "perm_other":
							if (fieldValue.equals("")) {
								customer.setPermExtrainfo("");
							} else {
								customer.setPermExtrainfo(fieldValue);
							}
							break;
						case "temp_dist":
							if (fieldValue.equals("")) {
								customer.setTempDistrict("");
							} else {
								customer.setTempDistrict(fieldValue);
							}
							break;
						case "temp_vdc_mp":
							if (fieldValue.equals("")) {
								customer.setTempVdcMunicipality("");
							} else {
								customer.setTempVdcMunicipality(fieldValue);
							}
							break;
						case "temp_other":
							if (fieldValue.equals("")) {
								customer.setTempExtrainfo("");
							} else {
								customer.setTempExtrainfo(fieldValue);
							}
							break;
						case "fathers_name":
							if (fieldValue.equals("")) {
								response.sendRedirect("../../../view/customer_registration.jsp");
								return;
							} else {
								customer.setFathersName(fieldValue);
							}
							break;
						case "grandfathers_name":
							if (customer.getGender().equals("Male")) {
								if (fieldValue.equals("")) {
									response.sendRedirect("../../../view/customer_registration.jsp");
									return;
								} else {
									customer.setGrandFathersName(fieldValue);
								}
							} else {
								if (fieldValue.equals("")) {
									customer.setGrandFathersName("");
								} else{
									customer.setGrandFathersName(fieldValue);
								}
							}
							break;
						case "father_in_law_name":
							if(customer.getGender().equals("Female") && customer.getMaritalStatus().equals("Married")){
								if (customer.getGrandFathersName().equals("") && fieldValue.equals("")) {
									response.sendRedirect("../../../view/customer_registration.jsp");
									return;
								} else {
									customer.setFatherInLawsName(fieldValue);
								}
							} else {
								if (fieldValue.equals("")) {
									customer.setFatherInLawsName("");
								} else {
									customer.setFatherInLawsName(fieldValue);
								}
							}
							break;
						case "nominee_name":
							if (fieldValue.equals("")) {
								response.sendRedirect("../../../view/customer_registration.jsp");
								return;
							} else {
								customer.setNomineesName(fieldValue);
							}
							break;
						case "nominee_cell_first":
							if (fieldValue.equals("")) {
								response.sendRedirect("../../../view/customer_registration.jsp");
								return;
							} else {
								customer.setnCellNumberFirst(fieldValue);
							}
							break;
						case "nominee_cell_second":
							if (fieldValue.equals("")) {
								customer.setnCellNumberSecond("");
							} else {
								customer.setnCellNumberSecond(fieldValue);
							}
							break;
						case "nominee_landline":
							if (fieldValue.equals("")) {
								customer.setnLandLine("");
							} else {
								customer.setnLandLine(fieldValue);
							}
							break;
						case "nominee_email":
							if (fieldValue.equals("")) {
								customer.setnEmailId("");
							} else {
								customer.setnEmailId(fieldValue);
							}
							break;
						case "n_perm_dist":
							if (fieldValue.equals("")) {
								response.sendRedirect("../../../view/customer_registration.jsp");
								return;
							} else {
								customer.setnPermDistrict(fieldValue);
							}
							break;
						case "n_perm_vdc_mp":
							if (fieldValue.equals("")) {
								response.sendRedirect("../../../view/customer_registration.jsp");
								return;
							} else {
								customer.setnPermVdcMunicipality(fieldValue);
							}
							break;
						case "n_perm_other":
							if (fieldValue.equals("")) {
								customer.setnPermExtraInfo("");
							} else {
								customer.setnPermExtraInfo(fieldValue);
							}
							break;
						case "n_temp_dist":
							if (fieldValue.equals("")) {
								customer.setnTempDistrict("");
							} else {
								customer.setnTempDistrict(fieldValue);
							}
							break;
						case "n_temp_vdc_mp":
							if (fieldValue.equals("")) {
								customer.setnTempVdcMunicipality("");
							} else {
								customer.setnTempVdcMunicipality(fieldValue);
							}
							break;
						case "n_temp_other":
							if (fieldValue.equals("")) {
								customer.setnTempExtraInfo("");
							} else {
								customer.setnTempExtraInfo(fieldValue);
							}
							break;
						case "guardian_name":
							if (customer.getCustomerAge()<16) {
								if (fieldValue.equals("")) {
									response.sendRedirect("../../../view/customer_registration.jsp");
									return;
								} else {
									customer.setGuardianName(fieldValue);
								}
							} else {
								customer.setGuardianName("");
							}
							break;
						case "guardian_relation":
							if (customer.getCustomerAge()<16) {
								if (fieldValue.equals("")) {
									response.sendRedirect("../../../view/customer_registration.jsp");
									return;
								} else {
									customer.setgRelation(fieldValue);
								}
							} else {
								customer.setgRelation("");
							}
							break;
						case "guardian_cell_first":
							if (customer.getCustomerAge()<16) {
								if (fieldValue.equals("")) {
									response.sendRedirect("../../../view/customer_registration.jsp");
									return;
								} else {
									customer.setgCellNumberFirst(fieldValue);
								}
							} else {
								customer.setgCellNumberFirst("");
							}
							break;
						case "guardian_cell_second":
							if (customer.getCustomerAge()<16) {
								if (fieldValue.equals("")) {
									customer.setgCellNumberSecond("");
								} else {
									customer.setgCellNumberSecond(fieldValue);
								}
							} else {
								customer.setgCellNumberSecond("");
							}
							break;
						case "guardian_landline":
							if (customer.getCustomerAge()<16) {
								if (fieldValue.equals("")) {
									customer.setgLandLine("");
								} else {
									customer.setgLandLine(fieldValue);
								}
							} else {
								customer.setgLandLine("");
							}
							break;
						case "guardian_email":
							if (customer.getCustomerAge()<16) {
								if (fieldValue.equals("")) {
									customer.setgEmailId("");
								} else {
									customer.setgEmailId(fieldValue);
								}
							} else {
								customer.setgEmailId("");
							}
							break;
						case "g_perm_dist":
							if (customer.getCustomerAge()<16) {
								if (fieldValue.equals("")) {
									response.sendRedirect("../../../view/customer_registration.jsp");
									return;
								} else {
									customer.setgPermDistrict(fieldValue);
								}
							} else {
								customer.setgPermDistrict("");
							}
							break;
						case "g_perm_vdc_mp":
							if (customer.getCustomerAge()<16) {
								if (fieldValue.equals("")) {
									response.sendRedirect("../../../view/customer_registration.jsp");
									return;
								} else {
									customer.setgPermVdcMunicipality(fieldValue);
								}
							} else {
								customer.setgPermVdcMunicipality("");
							}
							break;
						case "g_perm_other":
							if (customer.getCustomerAge()<16) {
								if (fieldValue.equals("")) {
									response.sendRedirect("../../../view/customer_registration.jsp");
									return;
								} else {
									customer.setgPermExtraInfo(fieldValue);
								}
							} else {
								customer.setgPermExtraInfo("");
							}
							break;
						case "g_temp_dist":
							if (customer.getCustomerAge()<16) {
								if (fieldValue.equals("")) {
									customer.setgTempDistrict("");
								} else {
									customer.setgTempDistrict(fieldValue);
								}
							} else {
								customer.setgTempDistrict("");
							}
							break;
						case "g_temp_vdc_mp":
							if (customer.getCustomerAge()<16) {
								if (fieldValue.equals("")) {
									customer.setgTempVdcMunicipality("");
								} else {
									customer.setgTempVdcMunicipality(fieldValue);
								}
							} else {
								customer.setgTempVdcMunicipality("");
							}
							break;
						case "g_temp_other":
							if (customer.getCustomerAge()<16) {
								if (fieldValue.equals("")) {
									customer.setgTempExtraInfo("");
								} else {
									customer.setgTempExtraInfo(fieldValue);
								}
							} else {
								customer.setgTempExtraInfo("");
							}
							break;
						case "interest_rate":
							if (fieldValue.equals("")) {
								customer.setInterest(10);
							} else {
								customer.setInterest(Float.parseFloat(fieldValue));
							}
							break;
						case "starting_amount":
							if (fieldValue.equals("")) {
								customer.setStartingAmount(0);
							} else {
								customer.setStartingAmount(Double.parseDouble(fieldValue));
							}
							break;
						case "creation_date":
							if (fieldValue.equals("")) {
								customer.setjDate(dt);
							} else {
								customer.setjDate(sdf.parse(fieldValue));
							}
							break;
						case "reffered_by":
							if (fieldValue.equals("")) {
								customer.setRefferedBy("");
							} else {
								customer.setRefferedBy(fieldValue);
							}
							break;
						case "approved_by":
							if (fieldValue.equals("")) {
								response.sendRedirect("../../../view/customer_registration.jsp");
								return;
							} else {
								customer.setApprovedBy(fieldValue);
							}
							break;
						}
					}
					if (!item.isFormField()) {
						String fieldName=item.getFieldName();
						if (fieldName.equals("upload_photo")) {
							if(item.getName().equals("")){
								response.sendRedirect("../../../view/customer_registration.jsp");
								return;
							} else {
								String fileName=item.getName();
								String mimeType = getServletContext().getMimeType(fileName);
								if (mimeType.startsWith("image/")) {
									if (fileName.lastIndexOf("\\")>0) {
										customerFile = new File(photoUpPath+fileName.substring(fileName.lastIndexOf("\\")));
										customer.setPhotoPath(photoUpPath+fileName.substring(fileName.lastIndexOf("\\")));
									} else {
										customerFile = new File(photoUpPath+fileName.substring(fileName.lastIndexOf("\\")+1));
										customer.setPhotoPath(photoUpPath+fileName.substring(fileName.lastIndexOf("\\")+1));
									}
								} else {
									response.sendRedirect("../../../view/customer_registration.jsp");
									return;
								}
								item.write(customerFile);
							}
						}
						if (fieldName.equals("upload_fingerprints")) {
							if(item.getName().equals("")){
								response.sendRedirect("../../../view/customer_registration.jsp");
								return;
							} else {
								String fileName=item.getName();
								String mimeType = getServletContext().getMimeType(fileName);
								if (mimeType.startsWith("image/")) {
									if (fileName.lastIndexOf("\\")>0) {
										fingerprintFile = new File(fingerPrintUpPath+fileName.substring(fileName.lastIndexOf("\\")));
										customer.setFinderPrintPath(fingerPrintUpPath+fileName.substring(fileName.lastIndexOf("\\")));
									} else {
										fingerprintFile = new File(fingerPrintUpPath+fileName.substring(fileName.lastIndexOf("\\")+1));
										customer.setFinderPrintPath(fingerPrintUpPath+fileName.substring(fileName.lastIndexOf("\\")+1));
									}
								} else {
									response.sendRedirect("../../../view/customer_registration.jsp");
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
		customer.setEntryBy(ses_usr.getUser_id());
		if(newCustomer.registerCustomer(customer)){
			customerDetail=newCustomer.lastInsertion();
			if (customer.getAccountType().equals("ds")) {
				if (newCustomer.createAccount(customerDetail.getCustomerId(), customer.getInterest(), customer.getEntryBy())) {
					
				}
			}
		}
	}

}
