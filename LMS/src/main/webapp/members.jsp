<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.util.List, com.lms.beans.User"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Members - Library Management Portal</title>
<style>
.chart-grid {
	display: grid;
	grid-template-columns: 1fr 1fr;
	gap: 20px;
}
/* Additional styles */
</style>
</head>
<body>
	<jsp:include page="header.jsp"></jsp:include>
	<!-- Table -->
	<div id="allBooks" class="card mb-3 tab-content">
		<div class="card-header">
			<i class="fa fa-table"></i> Members Data
		</div>
		<div class="card-body">
			<div class="table-responsive">
				<table class="table table-bordered" id="dataTable" width="100%"
					cellspacing="0">
					<thead>
						<tr>
							<th>S No.</th>
							<th>Name</th>
							<th>ID</th>
							<th>Email</th>
							<th>Mobile</th>
							<th>Address</th>
							<th>Role</th>
						</tr>
					</thead>
					<tbody>
						<c:choose>
							<c:when test="${userList != null}">
								<%
								java.util.List<com.lms.beans.User> members = (java.util.List<com.lms.beans.User>) request.getAttribute("userList");
								for (com.lms.beans.User m : members) {
								%>
								<tr>
									<td><%=m.getId()%></td>
									<td><%=m.getName()%></td>
									<td><%=m.getIdNumber()%></td>
									<td><%=m.getEmail()%></td>
									<td><%=m.getMobile()%></td>
									<td><%=m.getAddress()%></td>
									<td><button class= "btn btn-outline-primary disabled"><%=m.getRole()%></button></td>
								</tr>
								<%
								}
								%>
							</c:when>
							<c:otherwise>
								<tr>
									<td>No Users Found</td>
								</tr>
							</c:otherwise>
						</c:choose>
					</tbody>
				</table>
			</div>
		</div>
	</div>
</body>
</html>