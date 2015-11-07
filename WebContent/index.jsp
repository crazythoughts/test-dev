<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<link rel="stylesheet" href="<%=request.getContextPath()%>/view/css/style.css" type="text/css" />
<title>Login Page</title>
</head>
<body class="loginpage01 clearfix">
<section id="loginpage">
<div class="soft-logo">KJJC Soft</div>
<div class="login">
	<div class="login-title">LOGIN</div>
	<form class="kform" action="/KJJCSoft/com/kjjcsoft/controllers/UserLogin" method="post">
	<div>
		<!-- <label for="username"> Username </label> --> <input type="text"
			placeholder="Username" name="username" class="username_input"
			required "/> 
	</div>
	<div>
			<!-- <label for="password"> Password </label>  --><input
			type="password" name="password"
			class="password_input" required /> 
	</div>
	<div class="submit">
			<input type="submit" name="login"
			value="Login" />
	</div>
	</form>
	<c:choose>
		<c:when test="${requestScope.error == true }">
				Username or password error.
				<c:remove var="error" scope="request" />
		</c:when>
		<c:otherwise>
		</c:otherwise>
	</c:choose>
</div>
</section>
</body>
</html>