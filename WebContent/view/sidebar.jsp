<%@ taglib prefix="c" 
           uri="http://java.sun.com/jsp/jstl/core"  %>
<div>
	<c:choose>
		<c:when test="${sessionScope.AdminLogin==true}">
			<ul>
				<li>Manage Profile</li>
				<li>Manage User</li>
				<li>Employee Registration</li>
				<li><a href="customer_list.jsp">Customer</a></li>
				<li>Accounts</li>
				<li>Transactions</li>
				<li>Reports</li>
				<li>Customer Search</li>
			</ul>
		</c:when>
		<c:otherwise>
			<ul>
				<li>Manage Profile</li>
				<li><a href="customer_list.jsp">Customer</a></li>
				<li>Accounts</li>
				<li>Transactions</li>
				<li>Reports</li>
				<li>Customer Search</li>
			</ul>
		</c:otherwise>
	</c:choose>
	<form action="../com/kjjcsoft/controllers/Logout" method="post">
<input type="Submit" value="Logout"/>
</form>
</div>