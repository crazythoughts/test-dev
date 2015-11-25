<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<jsp:useBean id="now" class="java.util.Date" />
<jsp:include page="header.jsp" />
<jsp:include page="sidebar.jsp" />
<div class="main-contain clearfix">
	<form action="/KJJCSoft/com/kjjcsoft/controllers/OpenFdsAccount" method="post">
		<label for="customer_id">Customer Id</label>
		<c:choose>
			<c:when test="${sessionScope.Id!=null }">
				<input type="text" name="customer_id" value="<c:out value="${sessionScope.Id }"/>"/>
			</c:when>
			<c:otherwise>
				<input type="text" name="customer_id" value="<c:out value="${param.customer_id}"/>"/>
			</c:otherwise>
		</c:choose>
		<input type="hidden" name="account_type" value="fds"/>
		<input type="submit" value="check" name="check"/>
		<label for="customer_name">Customer Name</label> 
		<input type="text" name="customer_name" value="<c:out value="${requestScope.cName}"/>" /><c:out value="${requestScope.customerError}"/> 
		<label for="interest_rate">Interest Rate</label>
		<input type="text" name="interest_rate" placeholder="eg. 15.5" />
		<label for="fd_amount">Fixed Deposit Amount</label>
		<input type="text" name="fd_amount" />
		<label for="maturity_period">Maturity Period</label>
		<input type="text" name="maturity_period" value=""/>
		<label for="approved_by">Approved By</label>
		<input type="text" name="approved_by" placeholder="John Doe" />
		<input type="submit" value="Create" name="create"/>
	</form>
	<jsp:include page="footer.jsp"/>
	</div>
	</div>
</body>
</html>