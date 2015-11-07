<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<div class="sidebar f-left clearfix">
	<c:choose>
		<c:when test="${sessionScope.AdminLogin==true}">
			<ul>
				<li>Manage Profile</li>
				<li>Manage User</li>
				<li>Employee Registration</li>
				<li><a href="/KJJCSoft/view/customer_list.jsp">Customer</a></li>
				<li>Accounts</li>
				<li>Transactions</li>
				<li>Reports</li>
				<li>Customer Search</li>
			</ul>
		</c:when>
		<c:otherwise>
			<ul>
				<li>Manage Profile</li>
				<li><a href="/KJJCSoft/view/customer_list.jsp">Customer</a></li>
				<li>Accounts</li>
				<li>Transactions</li>
				<li>Reports</li>
				<li>Customer Search</li>
			</ul>
		</c:otherwise>
	</c:choose>
	<form action="/KJJCSoft/com/kjjcsoft/controllers/Logout" method="post">
		<div class="submit">
		<input type="Submit" value="Logout" />
		</div>
	</form>
</div>