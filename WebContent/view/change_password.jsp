<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
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
                <h1 class="page-def">Change Password</h1>
		</div>
		<ul class="nav-show">
			<li class="main-page">Home<span class="divider">></span></li>
			<li class="">My Account<span class="divider">></span></li>
			<li class="active">Change Password</li>
		</ul>
		<div class="main-contain-content clearfix">
			<c:if test="${successMsg != null}">
				<div class="alert-info">
					<c:out value="${successMsg}"/>
				</div>
			</c:if>
			<c:remove var="successMsg" scope="request"/>
		<ul class="list-my-account">
			<li><a href="/KJJCSoft/com/kjjcsoft/controllers/AccountInformation">Summary</a></li>
			<li class="summary-active change"><a href="/KJJCSoft/com/kjjcsoft/controllers/ChangePassword">Change Password</a></li>
		</ul>
		<div class="all-content">
		<div class="form-wrapper form-password-change">
			<form method="post" action="/KJJCSoft/com/kjjcsoft/controllers/ChangePassword">
				<div>  
				<label for="old_password">Old Password</label>
				<input type="password" name="old_password" value=""/>			
				<c:out value="${requestScope.errorOld}"/>
				<c:remove var="errorOld" scope="request"/>
				</div>
				<div>
				<label for="new_password">New Password</label>
				<input type="password" name="new_password"/>
				<div class="login-error">
					<c:out value="${requestScope.errorNewPwd}"/>
					<c:remove var="errorNewPwd" scope="request"/>
				</div>
				</div>
				<div>
				<label for="repeat_password">Repeat New Password</label>
				<input type="password" name="repeat_password"/>
				<div class="login-error">
					<c:out value="${requestScope.errorRepPwd}"/>
					<c:remove var="errorRepPwd" scope="request"/>
				</div >
				</div>
				<div>
				<input type="submit" value="Change"/>
				</div>
			</form>
		</div>
		</div>
	</div>
	<jsp:include page="footer.jsp"/>
</div>
</div>

</body>
</html>