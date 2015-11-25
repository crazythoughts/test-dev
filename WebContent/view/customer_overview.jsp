<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<jsp:useBean id="now" class="java.util.Date" />
<jsp:include page="header.jsp" />
<jsp:include page="sidebar.jsp" />
<div class="main-contain clearfix">
	<div class="main-contain-header clearfix">
		<div class="to-right">
			<ul class="stats">
				<li class="green"><i class="icon-briefcase"></i>
					<div class="details">
						<span class="big">Account Status</span>
						<span>
							<c:choose>
								<c:when test="${sessionScope.AdminLogin==true}">
                                		Admin
                                	</c:when>
								<c:otherwise>User</c:otherwise>
							</c:choose>
						</span>
					</div></li>
				<li class="orange"><i class="icon-calendar"></i>
					<div class="details">
						<span class="big">
							<fmt:formatDate type="date" value="${now}" dateStyle="long" />
						</span>
						<span>
							<fmt:formatDate type="date" value="${now}" dateStyle="long" pattern="EEEE" />
						</span>
					</div></li>
			</ul>
		</div>
		<h1 class="page-def">Overview</h1>
	</div>
	<ul class="nav-show">
		<li class="main-page">Home<span class="divider">></span></li>
		<li class="">Customer<span class="divider">></span></li>
		<li class="">Manage<span class="divider">></span></li>
		<li class="active">Overview</li>
	</ul>
	<div class="main-contain-content clearfix">
		<ul class="manage-customer-navigation">
			<li><a href="/KJJCSoft/com/kjjcsoft/controllers/overview">Overview</a></li>
			<li><a href="/KJJCSoft/com/kjjcsoft/controllers/registration">Add</a></li>
			<li><a href="/KJJCSoft/com/kjjcsoft/controllers/edit">Edit</a></li>
		</ul>
		<div class="all-content">
			<div class="customer-stats">
				<p>Overview Data</p>
				<div class="customer-stats-display">
					<div>
						<c:out value="${requestScope.overview[0]}" />
						Total number of customer registered.
					</div>
					<div>
						<c:out value="${requestScope.overview[1]}" />
						Active Customers.
					</div>
					<div>
						<c:out value="${requestScope.overview[2]}" />
						Inactive Customers.
					</div>
					<div>
						<c:out value="${requestScope.overview[3]}" />
						Adult Customers.
					</div>
					<div>
						<c:out value="${requestScope.overview[4]}" />
						Children Customers.
					</div>
					<div>
						<c:out value="${requestScope.overview[5]}" />
						Male Customers.
					</div>
					<div>
						<c:out value="${requestScope.overview[6]}" />
						Female Customers.
					</div>
				</div>
				<c:remove var="overview" scope="request" />
			</div>
		</div>
	</div>
	<jsp:include page="footer.jsp" />
</div>
</div>
</body>
</html>