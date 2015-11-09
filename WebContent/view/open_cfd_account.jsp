<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<link rel="stylesheet" href="/KJJCSoft/view/css/style.css" type="text/css"/>
<title>Continuous Fixed Deposit</title>
</head>
<body>
	<jsp:include page="sidebar.jsp"/>
	<form action="/KJJCSoft/com/kjjcsoft/controllers/OpenCfdAccount" method="post">
		<label for="customer_id">Customer Id</label>
		<c:choose>
			<c:when test="${sessionScope.Id!=null }">
				<input type="text" name="customer_id" value="<c:out value="${sessionScope.Id }"/>"/>
			</c:when>
			<c:otherwise>
				<input type="text" name="customer_id" value="<c:out value="${param.customer_id}"/>"/>
			</c:otherwise>
		</c:choose>
		<input type="hidden" name="account_type" value="cfd"/>
		<input type="submit" value="check" name="check"/>
		<label for="customer_name">Customer Name</label> 
		<input type="text" name="customer_name" value="<c:out value="${requestScope.cName}"/>" /><c:out value="${requestScope.customerError}"/> 
		<label for="interest_rate">Interest Rate</label>
		<input type="text" name="interest_rate" placeholder="eg. 15.5" />
		<label for="starting_amount">Starting Amount</label>
		<input type="text" name="starting_amount" />
		<label for="maturity_period">Maturity Period</label>
		<input type="text" name="maturity_period" value=""/>
		<label for="approved_by">Approved By</label>
		<input type="text" name="approved_by" placeholder="John Doe" />
		<input type="submit" value="Create" name="create"/>
	</form>
	<jsp:include page="footer.jsp"/>	
</body>
</html>