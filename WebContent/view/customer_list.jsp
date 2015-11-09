<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
	<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<c:choose>
	<c:when test="${sessionScope.loggedIn !=true }">
		<c:redirect url="../index.jsp"/>
	</c:when>
</c:choose>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<link rel="stylesheet" href="/KJJCSoft/view/css/style.css" type="text/css"/>
<title>Customer List</title>
</head>
<body>
<jsp:include page="header.jsp"/>
	<jsp:include page="sidebar.jsp" />
	<div class="main-contain clearfix"> 
	<div class="customer-menu">
		<jsp:include page="customer_header.jsp" />
		<table>
			<tr>
				<th>Customer ID</th>
				<th>Name</th>
				<th>Age</th>
				<th>Gender</th>
				<th>CitizenShip No</th>
				<th>Address</th>
				<th>Cell Number</th>
				<th>Marital Status</th>
				<th>Occupation</th>
				<th>Father's Name</th>
				<th>Joined On</th>
				<th>Reffered By</th>
				<th>Entry By</th>
			</tr>
			<c:forEach items="${customerAll}" var="member">
				<tr>
					<td>${member.customerId}</td>
					<td>${member.customerName}</td>
					<td>${member.customerAge}</td>
					<td>${member.gender}</td>
					<td>${member.citizenShipNo}</td>
					<td>${member.permVdcMunicipality}</td>
					<td>${member.cellNumberFirst}</td>
					<td>${member.maritalStatus}</td>
					<td>${member.occupation}</td>
					<td>${member.fathersName}</td>
					<td>${member.jDate}</td>
					<td>${member.refferedBy}</td>
					<td>${member.entryBy}</td>
				</tr>
			</c:forEach>
		</table>
	</div>
	<jsp:include page="footer.jsp"/>
	</div>
</body>
</html>