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
                <h1 class="page-def">Search Results</h1>
		</div>
		<ul class="nav-show">
			<li class="main-page">Home<span class="divider">></span></li>
			<li class="">Users<span class="divider">></span></li>
			<li class="active">Search Results</li>
		</ul>
		<div class="main-contain-content clearfix">
			<c:if test="${!empty requestScope.errorMsg}">
				<div class="alert-info">
						<c:out value="${requestScope.errorMsg}"/>
						<c:remove var="errorMsg" scope="request"/>
				</div>
			</c:if>
		<div class="main-content-container-search">
			<div class="search-bar">
				<form action="/KJJCSoft/com/kjjcsoft/controllers/usersearch" method = "post">
					<input type="text" name="query_word"/>
					<input type="submit" value="Search" name="search"/>
				</form>
			</div>
			<a href="/KJJCSoft/com/kjjcsoft/controllers/adduser">Add</a>
		</div>
		</div>
		<div class="all-content">
		<div class="user-container">
		<p>Users</p>
			<div class="user-table-container">
			<table class="user-table">
				<tr>
					<th>S.N</th>
					<th>Username</th>
					<th>Employee Name</th>
					<th>Role</th>
					<th>Status</th>
					<th>Action</th>
				</tr>
				<tr>
				<c:choose>
					<c:when test="${!empty userlistresult}">
						<c:set var="counter" value="${0}" scope="page"/>
						<c:forEach items="${userlistresult}" var="members">
						<c:set var="counter" value="${counter+1}"/>
						<tr>
							<td><c:out value="${counter}"/></td>
							<td><c:out value="${members.user_name}"/></td>
							<td><c:out value="${members.name}"/></td>
							<td><c:out value="${members.role}"/></td>
							<td>
								<c:choose>
									<c:when test="${members.user_enabled == true}">
										Active
									</c:when>
									<c:otherwise>
										Inactive
									</c:otherwise>
								</c:choose>
							</td>
							<td>
								<form action="/KJJCSoft/com/kjjcsoft/controllers/users" method="post">
									<input type="hidden" name="userId" value="${members.user_id}"/>
									<c:choose>
										<c:when test="${members.user_enabled == true}">
											<input type="submit" value="Deactivate" name="deactivate">
										</c:when>
										<c:otherwise>
											<input type="submit" value="Activate" name="activate">
										</c:otherwise>
									</c:choose>
								</form>
							</td>
						</tr>
					</c:forEach>
				<c:remove var="userlistresult" scope="request"/>
				<c:remove var="counter" scope="page"/>
					</c:when>
					<c:otherwise>
						<tr>
							<td colspan="6">No results found.</td>
						</tr>
					</c:otherwise>
				</c:choose>
				</tr>
			</table>
			</div>
		</div>
	</div>
		<jsp:include page="footer.jsp"/>
</div>
</div>
</body>
</html>