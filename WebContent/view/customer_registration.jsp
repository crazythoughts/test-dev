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
		<jsp:include page="header.jsp"/>
	<div class="sidebar f-left clearfix">
		<c:choose>
			<c:when test="${sessionScope.AdminLogin==true}">
				<ul>
					<li>Dashboard
						<ul>
							<li><a href="/KJJCSoft/view/home.jsp">Main</a></li>
							<li><a href="/KJJCSoft/com/kjjcsoft/controllers/AccountInformation">My Account</a></li>
							<li><a href="/KJJCSoft/com/kjjcsoft/controllers/users">Users</a></li>
						</ul>
					</li>
					<li>Employee</li>
					<li>Customer
						<ul>
						<li><a href="/KJJCSoft/com/kjjcsoft/controllers/registration">Manage Customer</a></li>
						<li><a href="/KJJCSoft/com/kjjcsoft/controllers/customers">All Customers</a></li>
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
					<li>Reports
						<ul>
							<li>EMI</li>
							<li>Account Statement</li>
						</ul>
					</li>
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
						<li><a href="/KJJCSoft/com/kjjcsoft/controllers/registration">Manage Customer</a></li>
						<li><a href="/KJJCSoft/com/kjjcsoft/controllers/customers">All Customers</a></li>
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
					<li>Reports
						<ul>
							<li>EMI</li>
							<li>Account Statement</li>
						</ul>
					</li>
				</ul>
			</c:otherwise>
		</c:choose>
		<form action="/KJJCSoft/com/kjjcsoft/controllers/Logout" method="post">
			<div class="submit">
			<input type="Submit" value="Logout" />
			</div>
		</form>
	</div>


	<div class="main-contain clearfix">
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
                <h1 class="page-def">Register</h1>
		</div>
		<ul class="nav-show">
			<li class="main-page">Home<span class="divider">></span></li>
			<li class="">Customers<span class="divider">></span></li>
			<li class="">Manage<span class="divider">></span></li>
			<li class="active">Register</li>
		</ul>

		<div class="main-contain-content clearfix">
		<div class="all-content">
			<form action="/KJJCSoft/com/kjjcsoft/controllers/registration" method="post">
				<div class="registration-one clearfix">
					<div class="info-personal f-left">
						<label for="fullname">Full Name</label>
						<input type="text" name="fullname" value="${param.fullname}"/>
						<c:out value="${requestScope.errorfn}"/>
						<c:remove var="errorfn" scope="request"/>
						<br>
						<label for="age">Age</label>
						<input type="text" name="age" value = "${param.age}">
						<c:out value="${requestScope.errora}"/>
						<c:remove var="errora" scope="request"/>
						<br>
						<label for="dob">Date of birth</label>
						<input type="text" name="dob" value = "${param.dob}"/>
						<c:out value="${requestScope.errordob }"/>
						<c:remove var="errordob" scope="request"/>
						<div class="form-radio">
							<label for="gender">Gender</label>
							<input type="radio" name="gender" value="Male" checked/><span>Male</span>
							<input type="radio" name="gender" value="Female"/><span>Female</span>
							<c:out value="${requestScope.errorg }"/>
							<c:remove var="errorg" scope="request"/>
						</div>
						<label for="nationality">Nationality</label>
						<input type="text" name="nationality" value ="${param.nationality}"/>
						<c:out value="${requestScope.errorn }"/>
						<c:remove var="errorn" scope="request"/>
						<br>
						<label for="citizenship_no">Citizenship no.</label>
						<input type="text" name="citizenship_no" value="${param.citizenship_no}" />
						<c:out value="${requestScope.errorcs }"/>
						<c:remove var="errorcs" scope="request"/>
					</div>
					<div class="info-status f-right">
						<div class="form-radio">
							<label for="marital_status">Marital Status</label>
							<input type="radio" name="marital_status" value="Single" checked/><span>Single</span>
							<input type="radio" name="marital_status" value="Married"/><span>Married</span>
							<c:out value="${requestScope.errorms }"/>
							<c:remove var="errorms" scope="request"/>
						</div>
						<label for="spouse_name">Spouse Name</label>
						<input type="text" name="spouse_name" value="${param.spouse_name}"/>
						<c:out value="${requestScope.errorsn }"/>
						<c:remove var="errorsn" scope="request"/>
						<br>
						<label for="occupation">Occupation</label>
						<input type="text" name="occupation" value="${param.occupation}"/>
						<c:out value="${requestScope.erroro }"/>
						<c:remove var="erroro" scope="request"/>
						<br>
						<label for="cellnumber_first">Mobile</label>
						<input type="text" name="cellnumber_first" value="${param.cellnumber_first}" />
						<c:out value="${requestScope.errorcn}"/>
						<c:remove var="errorcn" scope="request"/>
						<br>
						<label for="cellnumber_second">Mobile</label>
						<input type="text" name="cellnumber_second" value="${param.cellnumber_second}" />
						<c:out value="${requestScope.errorcs}"/>
						<c:remove var="errorcs" scope="request"/>
						<br>
						<label for="landline">Phone</label>
						<input type="text" name="landline" value="${param.landline}" />
						<c:out value="${requestScope.errorll}"/>
						<c:remove var="errorll" scope="request"/>
						<br>
						<label for="customer_email">Email</label>
						<input type="text" name="customer_email" value="${param.customer_email}"/>
						<c:out value="${requestScope.erroreid}"/>
						<c:remove var="erroreid" scope="request"/>
					</div>
				</div>	
				<fieldset>
					<legend>Permanent Address</legend>
					<label for="perm_dist">District</label>
					<input type="text" name="perm_dist" value="${param.perm_dist}" />
					<c:out value="${requestScope.errorpd }"/>
					<c:remove var="errorpd" scope="request"/>
					<label for="perm_vdc_mp">VDC/Municipality</label>
					<input type="text" name="perm_vdc_mp" value="${param.perm_vdc_mp}"/>
					<c:out value="${requestScope.errorpvm }"/>
					<c:remove var="errorpvm" scope="request"/>
					<label for="perm_other">Other Information</label>
					<input type="text" name="perm_other" value="${param.perm_other }"/>
					<c:out value="${requestScope.errorpe}"/>
					<c:remove var="errorpe" scope="request"/>
				</fieldset>
				<fieldset>
					<legend>Temporary Address</legend>
					<label for="temp_dist">District</label>
					<input type="text" name="temp_dist" value="${param.temp_dist}"/>
					<c:out value="${requestScope.errortd}"/>
					<c:remove var="errortd" scope="request"/>
					<label for="temp_vdc_mp">VDC/Municipality</label>
					<input type="text" name="temp_vdc_mp" value="${param.temp_vdc_mp}"/>
					<c:out value="${requestScope.errortvm}"/>
					<c:remove var="errortvm" scope="request"/>
					<label for="temp_other">Other Information</label>
					<input type="text" name="temp_other" value="${param.temp_other}"/>
					<c:out value="${requestScope.errorte}"/>
					<c:remove var="errorte" scope="request"/>
				</fieldset>
				<div class="registration-one clearfix">
					<div class="info-personal f-left">
						<label for="fathers_name">Father's Name:</label>
						<input type="text" name="fathers_name"  value="${param.fathers_name}"/>
						<c:out value="${requestScope.errorf }"/>
						<c:remove var="errorf" scope="request"/>
						<br>
						<label for="grandfathers_name">Grandfather's Name</label>
						<input type="text" name="grandfathers_name" value="${param.grandfathers_name}" />
						<c:out value="${requestScope.errorgfn }"/>
						<c:remove var="errorgfn" scope="request"/>
					</div>
					<div class="info-status f-right">					
						<label for="father_in_law_name">Father-in-Law's</label>
						<input type="text" name="father_in_law_name" value="${param.father_in_law_name}"/>
						<c:out value="${requestScope.errorfln }"/>
						<c:remove var="errorfln" scope="request"/>
					</div>
				</div>
				<fieldset>
					<legend>Nominee</legend>
					<label for="nominee_name">Nominee's Name</label>
					<input type="text" name="nominee_name" value="${param.nominee_name}"/>
					<c:out value="${requestScope.errornn}"/>
					<c:remove var="errornn" scope="request"/>
					<br>
					<label for ="nominee_relation">Relation</label>
					<input type="text" name="nominee_relation" value="${param.nominee_relation}"/>
					<c:out value="${requestScope.errornr }"/>
					<c:remove var="errornr" scope="request"/>
					<br>
					<label for="nominee_cell_first">Mobile 1:</label>
					<input type="text" name="nominee_cell_first" value="${param.nominee_cell_first}"/>
					<c:out value="${requestScope.errorncf }"/>
					<c:remove var="errorncn" scope="request"/>
					<br>
					<label for="nominee_cell_second">Mobile 2:</label>
					<input type="text" name="nominee_cell_second" value="${param.nominee_cell_seconnd}" />
					<c:out value="${requestScope.errorncs }"/>
					<c:remove var="errorncs" scope="request"/>
					<br>
					<label for="nominee_landline">Landline</label>
					<input type="text" name="nominee_landline" value="${param.nominee_landline}" />
					<c:out value="${requestScope.errornll }"/>
					<c:remove var="errornll" scope="request"/>
					<br>
					<label for="nominee_email">Email:</label>
					<input type="text" name="nominee_email" value="${param.nominee_email}"/>
					<c:out value="${requestScope.errorneid }"/>
					<c:remove var="errorneid" scope="request"/>					
					<fieldset>
						<legend>Permanent Address</legend>
						<label for="n_perm_dist">District</label>
						<input type="text" name="n_perm_dist" value="${param.n_perm_dist}"/>
						<c:out value="${requestScope.errornpd }"/>
						<c:remove var="errornpd" scope="request"/>
						<label for="n_perm_vdc_mp">VDC/Municipality</label>
						<input type="text" name="n_perm_vdc_mp" value="${param.n_perm_vdc_mp}"/>
						<c:out value="${requestScope.errornpvm }"/>
						<c:remove var="errornpvm" scope="request"/>
						<label for="n_perm_other">Other Information</label>
						<input type="text" name="n_perm_other" value="${param.n_perm_other}"/>
						<c:out value="${requestScope.errornpe }"/>
						<c:remove var="errornpe" scope="request"/>
					</fieldset>
					<fieldset>
						<legend>Temporary Address</legend>
						<label for="n_temp_dist">District</label>
						<input type="text" name="n_temp_dist" value="${param.n_temp_dist}" />
						<c:out value="${requestScope.errorntd }"/>
						<c:remove var="errorntd" scope="request"/>
						<label for="n_temp_vdc_mp">VDC/Municipality</label>
						<input type="text" name="n_temp_vdc_mp" value="${param.n_temp_vdc_mp}"/>
						<c:out value="${requestScope.errorntvm }"/>
						<c:remove var="errorntvm" scope="request"/>
						<label for="n_temp_other">Other Information</label>
						<input type="text" name="n_temp_other" value="${param.n_temp_other}"/>
						<c:out value="${requestScope.errornte}"/>
						<c:remove var="errornte" scope="request"/>
					</fieldset>
				</fieldset>
				<fieldset>
					<legend>For Under Age</legend>
					<label for="guardian_name">Guardian Name</label>
					<input type="text" name="guardian_name" value="${param.guardian_name}"/>
					<c:out value="${requestScope.errorgn }"/>
					<c:remove var="errorgn" scope="request"/>
					<br>
					<label for="guardian_relation">Relation</label>
					<input type="text" name="guardian_relation" value="${param.guardian_relation}" />
					<c:out value="${requestScope.errorgr }"/>
					<c:remove var="errorgr" scope="request"/>
					<br>
					<label for="guardian_cell_first">Mobile 1:</label>
					<input type="text" name="guardian_cell_first" value="${param.guardian_cell_first}" />
					<c:out value="${requestScope.errorgcf }"/>
					<c:remove var="errorgcf" scope="request"/>
					<br>
					<label for="guardian_cell_second">Mobile 2:</label>
					<input type="text" name="guardian_cell_second" value="${param.guardian_cell_second}"/>
					<c:out value="${requestScope.errorgcs }"/>
					<c:remove var="errorgcs" scope="request"/>
					<br>
					<label for="guardian_landline">Landline</label>
					<input type="text" name="guardian_landline" value="${param.guardian_landline}"/>
					<c:out value="${requestScope.errorgll }"/>
					<c:remove var="errorgll" scope="request"/>
					<br>
					<label for="guardian_email">Email</label>
					<input type="text" name="guardian_email" value="${param.guardian_email}" />
					<c:out value="${requestScope.errorgeid }"/>
					<c:remove var="errorgeid" scope="request"/>
					<fieldset>
						<legend>Permanent Address</legend>
						<label for="g_perm_dist">District</label>
						<input type="text" name="g_perm_dist" value="${param.g_perm_dist}" />
						<c:out value="${requestScope.errorgpd }"/>
						<c:remove var="errorgpd" scope="request"/>
						<label for="g_perm_vdc_mp">VDC/Municipality</label>
						<input type="text" name="g_perm_vdc_mp" value="${param.g_perm_vdc_mp}" />
						<c:out value="${requestScope.errorgpvm }"/>
						<c:remove var="errorgpvm" scope="request"/>
						<label for="g_perm_other">Other Information</label>
						<input type="text" name="g_perm_other" value="${param.g_perm_other}"/>
						<c:out value="${requestScope.errorgpe }"/>
					<c:remove var="errorgpe" scope="request"/>
					</fieldset>
					<fieldset>
						<legend>Temporary Address</legend>
						<label for="g_temp_dist">District</label>
						<input type="text" name="g_temp_dist" value="${param.g_temp_dist}"/>
						<c:out value="${requestScope.errorgtd}"/>
					<c:remove var="errorgtd" scope="request"/>
						<label for="g_temp_vdc_mp">VDC/Municipality</label>
						<input type="text" name="g_temp_vdc_mp" value="${param.g_temp_vdc_mp}"/>
						<c:out value="${requestScope.errorgtvm }"/>
						<c:remove var="errorgtvm" scope="request"/>
						<label for="g_temp_other">Other Information</label>
						<input type="text" name="g_temp_other" value="${param.g_temp_other }"/>
						<c:out value="${requestScope.errorgte }"/>
						<c:remove var="errorgte" scope="request"/>
					</fieldset>
				</fieldset>
				<label for="creation_date">Account Creation Date</label>
				<input type="text" name="creation_date" value="${param.creation_date}" />
				<c:out value="${requestScope.errorcd }"/>
				<c:remove var="errorcd" scope="request"/>
				<br>
				<label for="reffered_by">Reffered By:</label>
				<input type="text" name="reffered_by" value="${param.reffered_by}"/>
				<c:out value="${requestScope.errorrb }"/>
				<c:remove var="errorrb" scope="request"/>
				<label for="approved_by">Approved By:</label>
				<input type="text" name="approved_by" value="${param.approved_by}"/>
				<c:out value="${requestScope.errorapb }"/>
				<c:remove var="errorapb" scope="request"/>
				<br>
				<input type="submit" value="Save" name="normField"/>
			</form>
			</div>
		</div>
		<jsp:include page="footer.jsp"/>
	</div>
</div>
</body>
</html>