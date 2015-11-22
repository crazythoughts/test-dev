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
<title>KJJCSoft</title>
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
                <h1 class="page-def">Add User</h1>
		</div>
		<ul class="nav-show">
			<li class="main-page">Home<span class="divider">></span></li>
			<li class="">Users<span class="divider">></span></li>
			<li class="active">Add</li>
		</ul>
		<div class="main-contain-content clearfix">
			<c:if test="${!empty requestScope.successAdd}">
				<div class="alert-info">
						<c:out value="${requestScope.successAdd}"/>
						<c:remove var="successAdd" scope="request"/>
					</div>
			</c:if>
		<div class="all-content">
			<div class="add-user-form">
				<form action="/KJJCSoft/com/kjjcsoft/controllers/adduser" method = "post">
					<label for="username">Username</label>
					<input type="text" name="username" value="${param.username}"/>
					<c:out value="${errorUname}"/>
					<c:remove var="errorUname" scope="request"/>
					<label for="password">Password</label>
					<input type="password" name="password" value="${param.password}"/>
					<c:out value="${errorPwd}"/>
					<c:remove var="errorPwd" scope="request"/>
					<label for="employee_id">Employee_id</label>
					<select name="employee_id">
						<c:forEach items="${Empid}" var="members">
							<c:choose>
								<c:when test="${param.employee_id == members}">
									<option value="${members}" selected><c:out value="${members}"/></option>
								</c:when>
								<c:otherwise>
									<option value="${members}"><c:out value="${members}"/></option>
								</c:otherwise>
							</c:choose>
						</c:forEach>
						<c:remove var="Empid" scope="request"/>
						<c:remove var="members" scope="page"/>
					</select>
					<input type="submit" value="Get info" name="check"/>
					<label for="employee_name">Employee Name</label>
					<c:choose>
						<c:when test="${empty requestScope.empInfo.getEmployeeName()}">
							<input type="text" name="employee_name" value=""/>
						</c:when>
						<c:otherwise>
							<input type="text" name="employee_name" value="${requestScope.empInfo.getEmployeeName()}"/>
						</c:otherwise>
					</c:choose>
					<c:if test="${!empty requestScope.empInfo.getEmployeePhoto()}">
						<img src="/KJJCSoft/upload/${requestScope.empInfo.getEmployeePhoto()}" width = "200px" height= "200px"/>
					</c:if>
					<c:remove var="empInfo" scope="request"/>
					<c:out value="${errorOpps}"/>
					<c:remove var="errorOpps" scope="request"/>
					<label for="user_role">Role</label>
					<select name="user_role">
						<option value="Administrator">Admin</option>
						<option value="User">User</option>
					</select>
					<input type="submit" value="Add" name="addUser"/>
				</form>
			</div>
		</div>
	</div>
	<jsp:include page="footer.jsp"/>
	</div>
</div>
</body>
</html>