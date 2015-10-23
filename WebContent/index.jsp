<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<link rel="stylesheet" href="" type="text/css" />
<title>Login Page</title>
</head>
<body>
	<form action="com/kjjcsoft/controllers/UserLogin" method="post">
		<label for="username"> Username </label> <input type="text"
			placeholder="Username" name="username" class="username_input"
			required /> <label for="password"> Password </label> <input
			type="password" placeholder="*********" name="password"
			class="password_input" required /> <input type="submit" name="login"
			value="Login" />
	</form>
	<c:choose>
		<c:when test="${sessionScope.error == true }">
				Username or password error.
				<c:remove var="error" scope="session" />
		</c:when>
		<c:otherwise>
		</c:otherwise>
	</c:choose>
</body>
</html>