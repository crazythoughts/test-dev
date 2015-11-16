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
<link rel="stylesheet" href="/KJJCSoft/view/css/style.css" type="text/css"/>
<link href="/KJJCSoft/view/fonts/font-awesome/css/font-awesome.css" type="text/css" rel="stylesheet">
<title>Customer List</title>
</head>
<body>
<c:set var="now" value="<%=new java.util.Date()%>"/>
<div class="container">
<div style="background : white; width : 100 %" >
		<jsp:include page="header.jsp"/>
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
						<li><a href="/KJJCSoft/view/registration">Manage Customer</a></li>
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
                <h1 class="page-def">All Customers</h1>
		</div>
		<ul class="nav-show">
			<li class="main-page">Dashboard<span class="divider">></span></li>
			<li class="">Customer<span class="divider">></span></li>
			<li class="path-active">All Customers</li>
		</ul>
		<table class="customer-list">
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
		<c:remove var="customerAll" scope="request"/>
	<jsp:include page="footer.jsp"/>
	</div>
	</div>
</body>
</html>