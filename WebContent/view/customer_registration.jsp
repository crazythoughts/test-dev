<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
    <%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<c:choose>
	<c:when test="${sessionScope.loggedIn !=true }">
		<c:redirect url="../index.jsp"/>
	</c:when>
</c:choose>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<link rel="stylesheet" type="text/css" href="/KJJCSoft/view/css/style.css">
<link href="/KJJCSoft/view/fonts/font-awesome/css/font-awesome.css" type="text/css" rel="stylesheet">
<title>Customer Registration</title>
</head>
<body>
<c:set var="now" value="<%=new java.util.Date()%>"/>
<div class="container">
<div style="background : white; width : 100 %" >
		<div style="width : 15%;">
			KJJCSoft
		</div>
		<div style="width :85%;">
			<a href="/KJJCSoft/view/home.jsp"><img alt="User profile picture" src="/KJJCSoft/upload/${sessionScope.Userinfo.getEmployeePhotoPath()}" class="home-img"></a>
		</div>
	</div>
	<div class="sidebar f-left clearfix">
		<c:choose>
			<c:when test="${sessionScope.AdminLogin==true}">
				<ul>
					<li>Dashboard
						<ul>
							<li><a href="/KJJCSoft/view/home.jsp">Main</a></li>
							<li>Manage Profile</li>
							<li>Manage User</li>
						</ul>
					</li>
					<li>Employee</li>
					<li>Customer
						<ul>
						<li><a href="/KJJCSoft/view/customer_registration.jsp">Manage Customer</a></li>
						<li><a href="/KJJCSoft/com/kjjcsoft/controllers/FrontController">All Customers</a></li>
						</ul>
					</li>
					<li>Accounts
						<ul>
							<li>Manage Accounts</li>
							<li>Saving Accounts</li>
							<li>Loan Accounts</li>
						</ul>
					</li>
					<li>Transactions
						<ul>
							<li>Collector</li>
							<li>Office</li>
						</ul>
					</li>
					<li>Reports</li>
				</ul>
			</c:when>
			<c:otherwise>
				<ul>
					<li>Dashboard
						<ul>
							<li><a href="/KJJCSoft/view/home.jsp">Main</a></li>
						</ul>
					</li>
					<li>Employee</li>
					<li>Customer
						<ul>
						<li><a href="/KJJCSoft/view/customer_registration.jsp">Manage Customer</a></li>
						<li><a href="/KJJCSoft/com/kjjcsoft/controllers/FrontController">All Customers</a></li>
						</ul>
					</li>
					<li>Accounts
						<ul>
							<li>Manage Accounts</li>
							<li>Saving Accounts</li>
							<li>Loan Accounts</li>
						</ul>
					</li>
					<li>Transactions
						<ul>
							<li>Collector</li>
							<li>Office</li>
						</ul>
					</li>
					<li>Reports</li>
				</ul>
			</c:otherwise>
		</c:choose>
		<form action="/KJJCSoft/com/kjjcsoft/controllers/Logout" method="post">
			<div class="submit">
			<input type="Submit" value="Logout" />
			</div>
		</form>
	</div>
		<div class="main-contain clearfix ">
			<div class="main-contain-header clearfix">
			<div class="to-right">
			<ul class="stats">
                    <li class="green">
                        <i class="icon-briefcase"></i>
                        <div class="details">
                            <span class="big">Account Status</span>
                            <span>
                                <c:choose>
                                	<c:when test="${sessionScope.AdminLogin==true}">
                                		Admin
                                	</c:when>
                                	<c:otherwise>User</c:otherwise>
                                </c:choose>
                                </span>
                        </div>
                    </li>
                    <li class="orange">
                        <i class="icon-calendar"></i>
                        <div class="details">
                            <span class="big"><fmt:formatDate type="date" value="${now}" dateStyle="long"/></span>
                            <span><fmt:formatDate type="date" value="${now}" dateStyle="long" pattern="EEEE"/></span>
                        </div>
                    </li>
                </ul>
			</div>
                <h1 class="page-def"> Customer Registration</h1>
		</div>
		<ul class="nav-show">
			<li class="main-page">Dashboard<span class="divider">></span></li>
			<li class="">Customer<span class="divider">></span></li>
			<li class="path-active">Customer Registration
		</ul>
			<h3>Customer Registration</h3>
			<form action="/KJJCSoft/com/kjjcsoft/controllers/CustomerRegistration" method="post" enctype="multipart/form-data">
				<label for="fullname">Fullname:</label>
				<input type="text" placeholder="Fullname" name="fullname"/>
				<c:out value="${requestScope.errorfn}"/>
				<c:remove var="errorfn" scope="request"/>
				<br>
				<label for="upload_photo">Upload Photo:</label>
				<input type="file" name="upload_photo"/>
				<c:out value="${requestScope.errorp}"/>
				<c:remove var="errorp" scope="request"/>
				<br>
				<label for="age">Age</label>
				<input type="text" name="age">
				<c:out value="${requestScope.errora}"/>
				<c:remove var="errora" scope="request"/>
				<br>
				<label for="dob">Date of birth</label>
				<input type="text" name="dob"/>
				<c:out value="${requestScope.errordob }"/>
				<c:remove var="errordob" scope="request"/>
				<br>
				<label for="sex">Sex :</label>
				<input type="radio" name="sex" value="Male" checked/>Male
				<input type="radio" name="sex" value="Female"/>Female
				<c:out value="${requestScope.errorg }"/>
				<c:remove var="errorg" scope="request"/>
				<br>
				<label for="nationality">Nationality</label>
				<input type="text" name="nationality" placeholder="nationality"/>
				<c:out value="${requestScope.errorn }"/>
				<c:remove var="errorn" scope="request"/>
				<br>
				<label for="citizenship_no">Citizenship number:</label>
				<input type="text" name="citizenship_no" placeholder=""/>
				<c:out value="${requestScope.errorcs }"/>
				<c:remove var="errorcs" scope="request"/>
				<br>
				<label for="marital_status">Marital Status:</label>
				<input type="radio" name="marital_status" value="Single" checked/>Single
				<input type="radio" name="marital_status" value="Married"/>Married
				<c:out value="${requestScope.errorms }"/>
				<c:remove var="errorms" scope="request"/>
				<br>
				<label for="spouse_name">Spouse Name:</label>
				<input type="text" name="spouse_name" placeholder="Spouse Name"/>
				<c:out value="${requestScope.errorsn }"/>
				<c:remove var="errorsn" scope="request"/>
				<br>
				<label for="occupation">Occupation</label>
				<input type="text" name="occupation" placeholder="Occupation"/>
				<c:out value="${requestScope.erroro }"/>
				<c:remove var="erroro" scope="request"/>
				<br>
				<label for="cellnumber_first">Mobile 1:</label>
				<input type="text" name="cellnumber_first" placeholder="eg. 98XXXXXXXX" />
				<c:out value="${requestScope.errorcn}"/>
				<c:remove var="errorcn" scope="request"/>
				<br>
				<label for="cellnumber_second">Mobile 2:</label>
				<input type="text" name="cellnumber_second" placeholder="eg. 98XXXXXXXX"/>
				<br>
				<label for="landline">Landline</label>
				<input type="text" name="landline" placeholder="01XXXXXXXX"/>
				<br>
				<label for="customer_email">Email</label>
				<input type="text" name="customer_email"/>
				<br>
				<fieldset>
					<legend>Permanent Address</legend>
					<label for="perm_dist">District</label>
					<input type="text" name="perm_dist" placeholder="District"/>
					<c:out value="${requestScope.errorpd }"/>
					<c:remove var="errorpd" scope="request"/>
					<label for="perm_vdc_mp">VDC/Municipality</label>
					<input type="text" name="perm_vdc_mp" placeholder="VDC/Municipality"/>
					<c:out value="${requestScope.errorpvm }"/>
					<c:remove var="errorpvm" scope="request"/>
					<label for="perm_other">Other Information</label>
					<input type="text" name="perm_other" placeholder=""/>
				</fieldset>
				<fieldset>
					<legend>Temporary Address</legend>
					<label for="temp_dist">District</label>
					<input type="text" name="temp_dist" placeholder="District"/>
					<label for="temp_vdc_mp">VDC/Municipality</label>
					<input type="text" name="temp_vdc_mp" placeholder="VDC/Municipality"/>
					<label for="temp_other">Other Information</label>
					<input type="text" name="temp_other" placeholder=""/>
				</fieldset>
				<label for="fathers_name">Father's Name:</label>
				<input type="text" name="fathers_name" placeholder="Father's Name"/>
				<c:out value="${requestScope.errorf }"/>
				<c:remove var="errorf" scope="request"/>
				<br>
				<label for="grandfathers_name">Grandfather's Name</label>
				<input type="text" name="grandfathers_name" placeholder="Grandfather's Name"/>
				<c:out value="${requestScope.errorgfn }"/>
				<c:remove var="errorgfn" scope="request"/>
				<br>
				<label for="father_in_law_name">Father-in-Law's Name</label>
				<input type="text" name="father_in_law_name" placeholder="Father-in-Law"/>
				<c:out value="${requestScope.errorfln }"/>
				<c:remove var="errorfln" scope="request"/>
				<fieldset>
					<legend>Nominee</legend>
					<label for="nominee_name">Nominee's Name</label>
					<input type="text" name="nominee_name" placeholder="Nominee Name"/>
					<c:out value="${requestScope.errornn}"/>
					<c:remove var="errornn" scope="request"/>
					<br>
					<label for ="nominee_relation">Relation</label>
					<input type="text" name="nominee_relation"/>
					<c:out value="${requestScope.errornr }"/>
					<c:remove var="errornr" scope="request"/>
					<br>
					<label for="nominee_cell_first">Mobile 1:</label>
					<input type="text" name="nominee_cell_first" placeholder="98XXXXXXXX"/>
					<c:out value="${requestScope.errorncn }"/>
					<c:remove var="errorncn" scope="request"/>
					<br>
					<label for="nominee_cell_second">Mobile 2:</label>
					<input type="text" name="nominee_cell_second" placeholder="98XXXXXXXX"/>
					<br>
					<label for="nominee_landline">Landline</label>
					<input type="text" name="nominee_landline" placeholder="01XXXXXXXX"/>
					<br>
					<label for="nominee_email">Email:</label>
					<input type="text" name="nominee_email" placeholder="Email"/>
					<fieldset>
						<legend>Permanent Address</legend>
						<label for="n_perm_dist">District</label>
						<input type="text" name="n_perm_dist" placeholder="District"/>
						<c:out value="${requestScope.errornpd }"/>
						<c:remove var="errornpd" scope="request"/>
						<label for="n_perm_vdc_mp">VDC/Municipality</label>
						<input type="text" name="n_perm_vdc_mp" placeholder="VDC/Municipality"/>
						<c:out value="${requestScope.errornpvm }"/>
						<c:remove var="errornpvm" scope="request"/>
						<label for="n_perm_other">Other Information</label>
						<input type="text" name="n_perm_other" placeholder=""/>
					</fieldset>
					<fieldset>
						<legend>Temporary Address</legend>
						<label for="n_temp_dist">District</label>
						<input type="text" name="n_temp_dist" placeholder="District"/>
						<label for="n_temp_vdc_mp">VDC/Municipality</label>
						<input type="text" name="n_temp_vdc_mp" placeholder="VDC/Municipality"/>
						<label for="n_temp_other">Other Information</label>
						<input type="text" name="n_temp_other" placeholder=""/>
					</fieldset>
				</fieldset>
				<fieldset>
					<legend>For Under Age</legend>
					<label for="guardian_name">Guardian Name</label>
					<input type="text" name="guardian_name" placeholder="Guardian Name"/>
					<c:out value="${requestScope.errorgn }"/>
					<c:remove var="errorgn" scope="request"/>
					<br>
					<label for="guardian_relation">Relation</label>
					<input type="text" name="guardian_relation" placeholder="Relation"/>
					<c:out value="${requestScope.errorgr }"/>
					<c:remove var="errorgr" scope="request"/>
					<br>
					<label for="guardian_cell_first">Mobile 1:</label>
					<input type="text" name="guardian_cell_first" placeholder="98XXXXXXXX"/>
					<c:out value="${requestScope.errorgcn }"/>
					<c:remove var="errorgcn" scope="request"/>
					<br>
					<label for="guardian_cell_second">Mobile 2:</label>
					<input type="type" name="guardian_cell_second" placeholder="98XXXXXXXX"/>
					<br>
					<label for="guardian_landline">Landline</label>
					<input type="text" name="guardian_landline" placeholder="01XXXXXXXX"/>
					<br>
					<label for="guardian_email">Email</label>
					<input type="text" name="guardian_email" placeholder="example@example.com"/>
					<fieldset>
						<legend>Permanent Address</legend>
						<label for="g_perm_dist">District</label>
						<input type="text" name="g_perm_dist" placeholder="District"/>
						<c:out value="${requestScope.errorgpd }"/>
						<c:remove var="errorgpd" scope="request"/>
						<label for="g_perm_vdc_mp">VDC/Municipality</label>
						<input type="text" name="g_perm_vdc_mp" placeholder="VDC/Municipality"/>
						<c:out value="${requestScope.errorgpvm }"/>
						<c:remove var="errorgpvm" scope="request"/>
						<label for="g_perm_other">Other Information</label>
						<input type="text" name="g_perm_other" placeholder=""/>
					</fieldset>
					<fieldset>
						<legend>Temporary Address</legend>
						<label for="g_temp_dist">District</label>
						<input type="text" name="g_temp_dist" placeholder="District"/>
						<label for="g_temp_vdc_mp">VDC/Municipality</label>
						<input type="text" name="g_temp_vdc_mp" placeholder="VDC/Municipality"/>
						<label for="g_temp_other">Other Information</label>
						<input type="text" name="g_temp_other" placeholder=""/>
					</fieldset>
				</fieldset>
				<label for="upload_fingerprints">Upload Finger Prints:</label>
				<input type="file" name="upload_fingerprints"/>
				<c:out value="${requestScope.errorfp }"/>
				<c:remove var="errorfp" scope="request"/>
				<br>
				<label for="creation_date">Account Creation Date</label>
				<input type="text" name="creation_date" placeholder="YYYY/mm/dd"/>
				<br>
				<label for="reffered_by">Reffered By:</label>
				<input type="text" name="reffered_by" placeholder="John Doe"/>
				<label for="approved_by">Approved By:</label>
				<input type="text" name="approved_by" placeholder="John Doe"/>
				<c:out value="${requestScope.errorapb }"/>
				<c:remove var="errorapb" scope="request"/>
				<br>
				<c:out value="${requestScope.errorMsg}"/>
				<c:remove var="errorMsg" scope="request"/>
				<input type="submit" value="Save"/>
			</form>
		<jsp:include page="footer.jsp"/>
	</div>
</div>
</body>
</html>