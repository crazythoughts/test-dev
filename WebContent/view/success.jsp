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
<c:choose>
	<c:when test="${sessionScope.AdminLogin==true}">
		<title>Administrator Logged in</title>
	</c:when>
	<c:otherwise>
		<title>User Logged in</title>
	</c:otherwise>
</c:choose>
</head>
<body>
<div class="container">
<div>
	<div>
		<!-- for logo of the organisation -->
	</div>
	<div>
		<!-- showing location you are in right now -->
		Dashboard >
	</div>
</div>
	<jsp:include page="sidebar.jsp" />
	<div class="main-contain clearfix">
		<c:choose>
			<c:when test="${sessionScope.AdminLogin==true }">
				<h3 id="sucessfulLogger">Administrator Logged In.</h3>
			</c:when>
			<c:otherwise>
				<h3 id="sucessfulLogger">User Logged In.</h3>
			</c:otherwise>
		</c:choose>
		<br> Name:
		<c:out value="${sessionScope.Userinfo.getName()}"></c:out>
		<br>User Status: <br>User Type:
		<c:out value="${sessionScope.Userinfo.getRole()}"></c:out>
	</div>
	<jsp:include page="footer.jsp"/>
</div>
</body>
</html>