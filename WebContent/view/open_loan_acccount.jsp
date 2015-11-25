<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<jsp:useBean id="now" class="java.util.Date" />
<jsp:include page="header.jsp" />
<jsp:include page="sidebar.jsp" />
<div class="main-contain clearfix">
	<form action="">
		<label for="customer_id">Customer Id</label>
		<input type="text" name="customer_id" value="<c:out value=""/>" />
		<label for="customer_name">Customer Name</label>
		<input type="text" name="customer_name" value="<c:out value="${sessionScope.customerName}"/>" />
		<label for="account_type">Account Type</label> <select name="account_type">
			<optgroup label="Loan Accounts">
				<option value="bl">Bussiness Loan</option>
				<option value="al">Agricultural Loan</option>
			</optgroup>
		</select>
		<fieldset>
			<label for="approved_by">Approved By</label>
			<input type="text" name="approved_by">
			<label for="approved_amount">Approved Amount</label>
			<input type="text" name="approved_amount" />
			<label for="interest_rate">Interest Rate</label>
			<input type="text" name="interest_rate">
		</fieldset>
		<fieldset>
			<label for="date_of_investment">Date of investment</label>
			<input type="text" name="date_of_investment">
			<label for="date_of_return">Date of return</label>
			<input type="text" name="date_of_return" />
		</fieldset>
		<input type="submit" value="Create" />
	</form>
	<jsp:include page="footer.jsp" />
</div>
</div>
</body>
</html>