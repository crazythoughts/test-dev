<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
	<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Open Account</title>
</head>
<body>
	<form action="/KJJCSoft/com/kjjcsoft/controllers/AccountCreation" method="post">
		<label for="customer_id">Customer Id</label>
		<c:choose>
			<c:when test="${sessionScope.Id!=null }">
				<input type="text" name="customer_id" value="<c:out value="${sessionScope.Id }"/>"/>
				<c:remove var="Id" scope="session"/>
			</c:when>
			<c:otherwise>
				<input type="text" name="customer_id" value="<c:out value="${param.customer_id}"/>"/>
			</c:otherwise>
		</c:choose>
		<input type="submit" value="check" name="check"/>
		<label for="customer_name">Customer_name</label>
		<input type="text" name="customer_name" value="<c:out value="${requestScope.cName}"/>" /> 
		<label for="interest_rate">Interest Rate</label>
		<input type="text" name="interest_rate" placeholder="eg. 15.5" />
		<label for="approved_by">Approved By</label>
		<input type="text" name="approved_by" placeholder="John Doe" />
		<label for="starting_amount">Starting Amount</label>
		<input type="text" name="starting_amount" />
		<input type="submit" value="Create" name="create"/>
	</form>
</body>
</html>