<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Successful!</title>
</head>
<body>
	<jsp:include page="sidebar.jsp"/>
	<c:choose>
		<c:when test="${sessionScope.msAcNumber!=0 }">
		Monthly saving account created successfully!
		Account number : <c:out value="${sessionScope.msAcNumber }"/>
		<c:remove var="msAcNumber" scope="session"/>
		Please note down the account number!
		<c:choose>
			<c:when test="${sessionScope.accessedFromCustomer==true}">
				<a href="/KJJCSoft/view/customer_list.jsp"><input type="button" name="" value="Ok"></a>
				<c:remove var="accessedFromCustomer" scope="session"/>
			</c:when>
			<c:otherwise>
				<a href="/KJJCSoft/view/accounts.jsp"><input type="button" name="" value="Ok"></a>
			</c:otherwise>
		</c:choose>
		</c:when>
		<c:when test="${sessionScope.msAcNumber==0 }">
		<c:remove var="msAcNumber" scope="session"/>
		Something went wrong. The account for the customer was not created. Please try again from Accounts.
		<c:choose>
			<c:when test="${sessionScope.accessedFromCustomer==true}">
				<a href="/KJJCSoft/view/customer_list.jsp"><input type="button" name="" value="Ok"></a>
				<c:remove var="accessedFromCustomer" scope="session"/>
			</c:when>
			<c:otherwise>
				<a href="/KJJCSoft/view/accounts.jsp"><input type="button" name="" value="Ok"></a>
			</c:otherwise>
		</c:choose>
		</c:when>
	</c:choose>
</body>
</html>