<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Open Business Loan</title>
</head>
<body>
<jsp:include page="sidebar.jsp"/>
	<form action="/KJJCSoft/com/kjjcsoft/controllers/OpenBlAccountServlet" method="post">
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
		<input type="hidden" name="account_type" value="al"/>
		<input type="submit" value="check" name="check"/>
		<label for="customer_name">Customer Name</label> 
		<input type="text" name="customer_name" value="<c:out value="${requestScope.cName}"/>" /><c:out value="${requestScope.customerError}"/> 
		<label for="interest_rate">Interest Rate</label>
		<input type="text" name="interest_rate" placeholder="eg. 15.5" />
		<label for="approved_by">Approved By</label>
		<input type="text" name="approved_by" placeholder="John Doe" />
		<label for="starting_amount">Approved Amount</label>
		<input type="text" name="approved_amount" />
		<label for="date_of_investment">Date of investment</label>
		<input type ="text" name="date_of_investment">
		<label for="date_of_return">Date of return</label>
		<input type ="text" name="date_of_return">
		<input type="submit" value="Create" name="create"/>
	</form>

</body>
</html>