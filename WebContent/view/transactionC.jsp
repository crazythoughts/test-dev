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
		<h1 class="page-def">Transactions (Collector)</h1>
	</div>
	<ul class="nav-show">
		<li class="main-page">Home<span class="divider">></span></li>
		<li class="">Transactions<span class="divider">></span></li>
		<li class="active">Collector</li>
	</ul>
	<div class="main-contain-content clearfix">
		<div class="all-content">
			<div class="form-container">
				<form>
					Customer ID:
					<input type="text" name="customerId" size="20">
					<input type="button" name="check " value="Check">
					<br> Customer Account: <select name="accountType">
						<option value="1"></option>
						<option value="2"></option>
					</select> <br> Account ID:
					<input type="text" name="accountId" size="20">
					<br> Deposit Amount:
					<input type="text" name="depositAmount" size="20">
					<br> Withdrawal Amount:
					<input type="text" name="withdrawalAmount" size="20">
					<br> References:
					<input type="text" name="references" size="20">
					<br> Collector's ID:
					<input type="text" name="collectorId" size="20">
					<br>
					<input type="submit" name="save" value="Next">
				</form>
			</div>
		</div>
	</div>
	<jsp:include page="footer.jsp" />
</div>
</div>
</body>
</html>