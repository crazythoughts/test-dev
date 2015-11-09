<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
  <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<link rel="stylesheet" href="/KJJCSoft/view/css/style.css" type="text/css"/>
<title>Successful</title>
</head>
<body>
<jsp:include page="sidebar.jsp"/>
<c:choose>
	<c:when test="${sessionScope.fdsAcInfo.getAccountId()!=0}">
	Fixed Deposit Account created successfully!
	Account number : <c:out value="${sessionScope.fdsAcInfo.getAccountId()}"/>
	Account holders ID : <c:out value="${sessionScope.fdsAcInfo.getCustomerId()}"/>
	Account Holder's Name: <c:out value="${sessionScope.cName}"/>
	<c:remove var="cName" scope="session"/>
	Deposited Amount : <c:out value="${sessionScope.fdsAcInfo.getFixedDepositAmount()}"/>
	Interest Rate : <c:out value="${sessionScope.fdsAcInfo.getInterestRate()}"/>
	Maturity Time : <c:out value="${sessionScope.fdsAcInfo.getMaturityPeriod()}"/>
	<c:remove var="fdsAcInfo" scope="session"/>
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
	<c:when test="${sessionScope.fdsAcInfo.getAccountId()==0}">
	<c:remove var="fdsAcInfo" scope="session"/>
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
<jsp:include page="footer.jsp"/>
</body>
</html>