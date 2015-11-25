<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<jsp:useBean id="now" class="java.util.Date" />
<jsp:include page="header.jsp" />
<jsp:include page="sidebar.jsp" />
<div class="main-contain clearfix">
	<c:choose>
		<c:when test="${sessionScope.msAcInfo.getAccountId()!=0 and sessionScope.msAcInfo.getAccountId() != null}">
	Monthly Savings Account created successfully!
	Account number : <c:out value="${sessionScope.msAcInfo.getAccountId()}" />
	Account holders ID : <c:out value="${sessionScope.msAcInfo.getCustomerId()}" />
	Account Holder's Name: <c:out value="${sessionScope.cName}" />
			<c:remove var="cName" scope="session" />
	Deposited Amount : 
	Interest Rate : <c:out value="${sessionScope.msAcInfo.getInterestRate()}" />
			<c:remove var="msAcInfo" scope="session" />
			<c:choose>
				<c:when test="${sessionScope.accessedFromCustomer==true}">
					<a href="/KJJCSoft/view/customer_list.jsp">
						<input type="button" name="" value="Ok">
					</a>
					<c:remove var="accessedFromCustomer" scope="session" />
				</c:when>
				<c:otherwise>
					<a href="/KJJCSoft/view/accounts.jsp">
						<input type="button" name="" value="Ok">
					</a>
				</c:otherwise>
			</c:choose>
		</c:when>
		<c:when test="${sessionScope.msAcInfo.getAccountId()==0 or sessionScope.msAcInfo.getAccountId() == null }">
			<c:remove var="msAcInfo" scope="session" />
		Something went wrong. The account for the customer was not created. Please try again from Accounts
		<c:choose>
				<c:when test="${sessionScope.accessedFromCustomer==true}">
					<a href="/KJJCSoft/view/customer_list.jsp">
						<input type="button" name="" value="Ok">
					</a>
					<c:remove var="accessedFromCustomer" scope="session" />
				</c:when>
				<c:otherwise>
					<a href="/KJJCSoft/view/accounts.jsp">
						<input type="button" name="" value="Ok">
					</a>
				</c:otherwise>
			</c:choose>
		</c:when>
	</c:choose>
	<jsp:include page="footer.jsp" />
</div>
</div>
</body>
</html>