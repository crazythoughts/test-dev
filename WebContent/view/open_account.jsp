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
	<form action="">
		<label for="customer_id">Customer Id</label>
		 <input type="text"	name="customer_id" placeholder="eg. 1" value="<c:out value=""/>" />
		  <label for="customer_name">Customer_name</label>
		  <input type="text" name="customer_name" value="<c:out value="${sessionScope.customerName}"/>" /> 
		  <label for="account_type">Account Type</label>
		  <select name="account_type">
			<optgroup label="Saving Accounts">
				<option value="ds">Daily Savings</option>
				<option value="ms">Monthly Savings</option>
				<option value="fds">Fixed Deposit Savings</option>
				<option value="cfd">Cummulative Fixed Deposit</option>
			</optgroup>
			<optgroup label="Loan Accounts">
				<option value="bl">Bussiness Loan</option>
				<option value="al">Agricultural Loan</option>
			</optgroup>
		</select>
		 <label for="interest_rate">Interest Rate</label>
			<input type="text" name="interest_rate" placeholder="eg. 15.5" />
		  <label for="approved_by">Approved By</label>
		  <input type="text" name="approved_by" placeholder="John Doe" />
		   <label for="starting_amount">Starting Amount</label>
		   <input type="text" name="starting_amount" />
		   <label for="maturity_period">Maturity Period</label>
		    <input type="text" name="maturity_period" />
		    <input type="submit" value="Create" />
	</form>
</body>
</html>