<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<link rel="stylesheet" href="/KJJCSoft/view/css/style.css" type="text/css"/>
<title>Customer Registered Successfully</title>
</head>
<body>
	<jsp:include page="sidebar.jsp"/>
	<div class="main-contain clearfix"/>
	<b>Customer registered successfully!</b>
	<br>
	<img src="<c:out value="../upload/${sessionScope.newCustomer.getPhotoPath()}"/>" height="50px" width="50px"/>
	Customer ID: <c:out value="${sessionScope.newCustomer.getCustomerId()}"/>
	Name : <c:out value="${sessionScope.newCustomer.getCustomerName()}"/>
	Age : <c:out value="${sessionScope.newCustomer.getCustomerAge()}"/>
	Sex : <c:out value="${sessionScope.newCustomer.getGender()}"/>
	Date of birth : <c:out value="${sessionScope.newCustomer.getDob()}"/>
	Nationality : <c:out value="${sessionScope.newCustomer.getNationality()}"/>
	Citizenship Number : <c:out value="${sessionScope.newCustomer.getCitizenShipNo()}"/>
	<fieldset>
		<legend>Permanent Address</legend>
		District : <c:out value="${sessionScope.newCustomer.getPermDistrict()}"/>
		Vdc/Municipality : <c:out value="${sessionScope.newCustomer.getPermVdcMunicipality()}"/>
		Other Information : <c:out value="${sessionScope.newCustomer.getPermExtrainfo()}"/>
	</fieldset>
	<fieldset>
		<legend>Temporary Address</legend>
		District : <c:out value="${sessionScope.newCustomer.getTempDistrict()}"/>
		Vdc/Municipality : <c:out value="${sessionScope.newCustomer.getTempVdcMunicipality()}"/>
		Other Information : <c:out value="${sessionScope.newCustomer.getTempExtrainfo()}"/>
	</fieldset>
	Mobile number : <c:out value="${sessionScope.newCustomer.getCellNumberFirst()}"/>
	Mobile number : <c:out value="${sessionScope.newCustomer.getCellNumberSecond()}"/>
	Landline : <c:out value="${sessionScope.newCustomer.getLandLine()}"/>
	Email : <c:out value="${sessionScope.newCustomer.getEmailId()}"/>
	Marital Status : <c:out value="${sessionScope.newCustomer.getMaritalStatus()}"/>
	Spouse Name : <c:out value="${sessionScope.newCustomer.getSpouseName()}"/>
	Occupation : <c:out value="${sessionScope.newCustomer.getOccupation()}"/>
	Father's Name : <c:out value="${sessionScope.newCustomer.getFathersName()}"/>
	Grandfather's Name: <c:out value="${sessionScope.newCustomer.getGrandFathersName()}"/>
	Father-in-law's Name : <c:out value="${sessionScope.newCustomer.getFatherInLawsName()}"/>
	<b>Nominee Information</b>
	Nominee's Name : <c:out value="${sessionScope.newCustomer.getNomineesName()}"/>
	Relation : <c:out value="${sessionScope.newCustomer.getNomineeRelation()}"/>
	<fieldset>
		<legend>Permanent Address</legend>
		District : <c:out value="${sessionScope.newCustomer.getnPermDistrict()}"/>
		Vdc/Municipality : <c:out value="${sessionScope.newCustomer.getnPermVdcMunicipality()}"/>
		Other Information : <c:out value="${sessionScope.newCustomer.getnPermExtraInfo()}"/>
	</fieldset>
	<fieldset>
		<legend>Temporary Address</legend>
		District : <c:out value="${sessionScope.newCustomer.getnTempDistrict()}"/>
		Vdc/Municipality : <c:out value="${sessionScope.newCustomer.getnTempVdcMunicipality()}"/>
		Other Information : <c:out value="${sessionScope.newCustomer.getnTempExtraInfo()}"/>
	</fieldset>
	Mobile number : <c:out value="${sessionScope.newCustomer.getnCellNumberFirst()}"/>
	Mobile number : <c:out value="${sessionScope.newCustomer.getnCellNumberSecond()}"/>
	Landline : <c:out value="${sessionScope.newCustomer.getnLandLine()}"/>
	Email : <c:out value="${sessionScope.newCustomer.getnEmailId()}"/>
	<b>Guardian Information for Underage</b>
	Name : <c:out value="${sessionScope.newCustomer.getGuardianName()}"/>
	Relation : <c:out value="${sessionScope.newCustomer.getgRelation()}"/>
	<fieldset>
		<legend>Permanent Address</legend>
		District : <c:out value="${sessionScope.newCustomer.getgPermDistrict()}"/>
		Vdc/Municipality : <c:out value="${sessionScope.newCustomer.getgPermVdcMunicipality()}"/>
		Other Information : <c:out value="${sessionScope.newCustomer.getgPermExtraInfo()}"/>
	</fieldset>
	<fieldset>
		<legend>Temporary Address</legend>
		District : <c:out value="${sessionScope.newCustomer.getgTempDistrict()}"/>
		Vdc/Municipality : <c:out value="${sessionScope.newCustomer.getgTempVdcMunicipality()}"/>
		Other Information : <c:out value="${sessionScope.newCustomer.getgTempExtraInfo()}"/>
	</fieldset>
	Mobile number : <c:out value="${sessionScope.newCustomer.getgCellNumberFirst()}"/>
	Mobile number : <c:out value="${sessionScope.newCustomer.getgCellNumberSecond()}"/>
	Landline : <c:out value="${sessionScope.newCustomer.getgLandLine()}"/>
	Email : <c:out value="${sessionScope.newCustomer.getgEmailId()}"/>
	Joined Date : <c:out value="${sessionScope.newCustomer.getjDate()}"/>
	Reffered By : <c:out value="${sessionScope.newCustomer.getRefferedBy()}"/>
	Approved By : <c:out value="${sessionScope.newCustomer.getApprovedBy()}"/>
	<c:out value="${sessionScope.newCustomer.getFinderPrintPath()}"/>
	Finger Prints : <img src="../upload/<c:out value="${sessionScope.newCustomer.getFinderPrintPath()}"/>" height="100px" width="100px"/>
	<c:remove var="newCustomer" scope="session"/>
	<b>Open Saving Account</b>
	<a href="/KJJCSoft/view/open_ds_account.jsp"><input type="button" value="Daily Savings"></a>
	<a href="/KJJCSoft/view/open_ms_account.jsp"><input type="button" value="Monthly Savings"></a>
	<a href="/KJJCSoft/view/open_fds_account.jsp"><input type="button" value="Fixed Deposit"></a>
	<a href="/KJJCSoft/view/open_cfd_account.jsp"><input type="button" value="Continious Fixed Deposit"></a>
	<b>Loan Account</b>
	<a href=""><input type="button" value="Bussiness Loan"></a>
	<a href=""><input type="button" value="Agricultural Loan"></a>
	<jsp:include page="footer.jsp"/>
	</div>
</body>
</html>