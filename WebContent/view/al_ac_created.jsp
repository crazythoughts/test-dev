<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<c:choose>
	<c:when test="${sessionScope.alAcInfo.getAccountId()==0or sessionScope.alAcInfo.getAccountId()==null }">
	<title>Error!</title>
	</c:when>
	<c:otherwise>
		<title>Successful!</title>	
	</c:otherwise>
</c:choose>
</head>
<body>
<jsp:include page="sidebar.jsp"/>
<c:choose>
	<c:when test="${sessionScope.alAcInfo.getAccountId()!=0 and sessionScope.alAcInfo.getAccountId() != null}">
	Fixed Deposit Account created successfully!
	Account number : <c:out value="${sessionScope..getAccountId()}"/>
	Account holders ID : <c:out value="${sessionScope..getCustomerId()}"/>
	Account Holder's Name: <c:out value="${sessionScope.cName}"/>
	<c:remove var="cName" scope="session"/>
	Deposited Amount : 
	Interest Rate : <c:out value="${sessionScope..getInterestRate()}"/>
	<c:remove var="" scope="session"/>
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
	<c:when test="${sessionScope..getAccountId()==0 or sessionScope..getAccountId() == null }">
	<c:remove var="" scope="session"/>
		Something went wrong. The account for the customer was not created. Please try again from Accounts
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