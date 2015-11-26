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
		<h1 class="page-def">Edit</h1>
	</div>
	<ul class="nav-show">
		<li class="main-page">Home<span class="divider">></span></li>
		<li class="">Customers<span class="divider">></span></li>
		<li class="">Manage<span class="divider">></span></li>
		<li class="active">Edit</li>
	</ul>
	<div class="main-contain-content clearfix">
		<ul class="manage-customer-navigation">
			<li><a href="/KJJCSoft/com/kjjcsoft/controllers/overview">Overview</a></li>
			<li><a href="/KJJCSoft/com/kjjcsoft/controllers/registration">Add</a></li>
			<li><a href="/KJJCSoft/com/kjjcsoft/controllers/edit">Edit</a></li>
		</ul>
		<div class="all-content">
		<form>
			<div class="table-container">
				<table>
					<tr>
						<th>Id</th>
						<td><c:out value="$sessionScope.storedInfo.customerId"/></td>
					</tr>
					<tr>
						<th>Name</th>
						<td><c:out value="$sessionScope.storedInfo.customerName"/></td>
						<td><input type="checkbox" name="change" value="name"></td>
					</tr>
					<tr>
						<th>Age</th>
						<td><c:out value="$sessionScope.storedInfo.customerAge"/></td>
						<td>
							<input type="checkbox" name="change" value="age">
						</td>
					</tr>
					<tr>
						<th>Gender</th>
						<td><c:out value="${sessionScope.storedInfo.gender}"/></td>
						<td><input type="checkbox" name="change" value="gender"></td>
					</tr>
					<tr>
						<th>DOB</th>
						<td><c:out value="${sessionScope.storedInfo.dob}"/></td>
						<td><input type="checkbox" name="change" value="dob"></td>
					</tr>
					<tr>
						<th>Nationality</th>
						<td><c:out value="${sessionScope.storedInfo.nationality}"/>
						<td><input type="checkbox" name="change" value="nationality"></td>
					</tr>
					<tr>
						<th>Citizenship No</th>
						<td><c:out value="${sessionScope.storedInfo.citizenShipNo}"/></td>
						<td><input type="checkbox" name="change" value="citizenshipno"></td>
					</tr>
					<tr>
						<th>P. District</th>
						<td><c:out value="${sessionScope.storedInfo.permDistrict}"/></td>
						<td><input type="checkbox" name="change" value="pdistrict"></td>
					</tr>
					<tr>
						<th>P. VDC/Municipality</th>
						<td><c:out value="${sessionScope.storedInfo.permVdcMunicipality}"/></td>
						<td><input type="checkbox" name="change" value="pvdcm"/></td>
					</tr>
					<tr>
						<th>P. Extra</th>
						<td><c:out value="${sessionScope.storedInfo.permExtrainfo}"/></td>
						<td><input type="checkbox" name="change" value="pextra"/></td>
					</tr>
					<tr>
						<th>T. District</th>
						<td><c:out value="${sessionScope.storedInfo.tempDistrict}"/></td>
						<td><input type="checkbox" name="change" value="tdistrict"/></td>
					</tr>
					<tr>
						<th>T. VDC/Municipality</th>
						<td><c:out value="${sessionScope.storeInfo.tempVdcMunicipality}"/></td>
						<td><input type="checkbox" name="change" value="tvdcm"/></td>
					</tr>
				</table>
			</div>
		</form>
		</div>
	</div>
	<jsp:include page="footer.jsp" />
</div>
</div>
</body>
</html>