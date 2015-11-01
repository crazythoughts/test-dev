<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<jsp:include page="header.jsp" />
<body>
	<jsp:include page="sidebar.jsp" />
	<div>
		<c:choose>
			<c:when test="${sessionScope.AdminLogin==true }">
				<h3>Administrator Logged In.</h3>
			</c:when>
			<c:otherwise>
				<h3>User Logged In.</h3>
			</c:otherwise>
		</c:choose>
		<br> Name:
		<c:out value="${sessionScope.Userinfo.getName()}"></c:out>
		<br>User Status: <br>User Type:
		<c:out value="${sessionScope.Userinfo.getRole()}"></c:out>
	</div>
	<jsp:include page="footer.jsp"/>
</body>
</html>