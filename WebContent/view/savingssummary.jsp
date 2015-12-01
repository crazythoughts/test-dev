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
		<h1 class="page-def">Summary</h1>
	</div>
	<ul class="nav-show">
		<li class="main-page">Home<span class="divider">></span></li>
		<li class="">Accounts<span class="divider">></span></li>
		<li class="">Savings<span class="divider">></span></li>
		<li class="active">Summary</li>
	</ul>
	<div class="main-contain-content clearfix">
		<ul class="saving-accounts-navigation">
			<li><a href="/KJJCSoft/com/kjjcsoft/controllers/savingdetails">Summary</a></li>
			<li><a href="/KJJCSoft/com/kjjcsoft/controllers/dailysaving">Daily Savings</a></li>
			<li><a href="/KJJCSoft/com/kjjcsoft/controllers/monthlysaving">Monthly Savings</a></li>
			<li><a href="/KJJCSoft/com/kjjcsoft/controllers/fixeddeposit">Fixed Deposits</a></li>
			<li><a href="/KJJCSoft/com/kjjcsoft/controllers/cfixeddeposit">Continuous Fixed Deposit</a></li>
		</ul>
		<div class="all-content">
			<div class="account-stats">
				<p>Overview Data</p>
				<div class="account-stats-display">
					<div>
						<c:out value="${requestScope.summaryData[0]}" />
						Total daily saving accounts opened.
					</div>
					<div>
						<c:out value="${requestScope.summaryData[1]}" />
						Active daily saving accounts.
					</div>
					<div>
						<c:out value="${requestScope.summaryData[2]}" />
						Inactive daily saving accounts.
					</div>
					<div>
						<c:out value="${requestScope.summaryData[3]}" />
						Total monthly saving accounts opened.
					</div>
					<div>
						<c:out value="${requestScope.summaryData[4]}" />
						Active monthly saving accounts.
					</div>
					<div>
						<c:out value="${requestScope.summaryData[5]}" />
						Inactive monthly saving accounts.
					</div>
					<div>
						<c:out value="${requestScope.summaryData[6]}" />
						Total fixed deposit accounts opened.
					</div>
					<div>
						<c:out value="${requestScope.summaryData[7]}" />
						Active fixed deposit accounts.
					</div>
					<div>
						<c:out value="${requestScope.summaryData[8]}" />
						Inactive fixed deposit accounts.
					</div>
					<div>
						<c:out value="${requestScope.summaryData[9]}" />
						Total continuous fixed deposit accounts opened.
					</div>
					<div>
						<c:out value="${requestScope.summaryData[10]}" />
						Active continuous fixed deposit.
					</div>
					<div>
						<c:out value="${requestScope.summaryData[11]}" />
						Inactive continuous fixed deposit.
					</div>
					<div>
						<c:out value="${requestScope.summaryData[12]}" />
						Total accounts opened.
					</div>
					<div>
						<c:out value="${requestScope.summaryData[13]}" />
						Active accounts.
					</div>
					<div>
						<c:out value="${requestScope.summaryData[14]}" />
						Inactive accounts.
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