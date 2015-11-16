<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<div class="sidebar f-left clearfix">
	<c:choose>
		<c:when test="${sessionScope.AdminLogin==true}">
			<ul>
				<li>Manage Profile</li>
				<li>Manage User</li>
				<li>Employee</li>
				<li>Customer
					<ul>
					<li><a href="/KJJCSoft/com/kjjcsoft/controllers/customer_registration.jsp">Manage Customer</a></li>
					<li><a href="/KJJCSoft/com/kjjcsoft/controllers/FrontController">All Customers</a></li>
					</ul>
				</li>
				<li>Accounts
					<ul>
						<li>Manage Accounts</li>
						<li>Saving Accounts</li>
						<li>Loan Accounts</li>
					</ul>
				</li>
				<li>Transactions
					<ul>
						<li>Collector</li>
						<li>Office</li>
					</ul>
				</li>
				<li>Reports</li>
			</ul>
		</c:when>
		<c:otherwise>
			<ul>
				<li>Manage Profile</li>
				<li><a href="/KJJCSoft/view/customer_list.jsp">Customer</a></li>
				<li>Accounts
					<ul>
						<li>Manage Accounts</li>
						<li>Saving Accounts</li>
						<li>Loan Accounts</li>
					</ul>
				</li>

				<li>Transactions
					<ul>
						<li>Collector</li>
						<li>Office</li>
					</ul></li>
				<li>Reports</li>
			</ul>
		</c:otherwise>
	</c:choose>
	<form action="/KJJCSoft/com/kjjcsoft/controllers/Logout" method="post">
		<div class="submit">
		<input type="Submit" value="Logout" />
		</div>
	</form>
</div>