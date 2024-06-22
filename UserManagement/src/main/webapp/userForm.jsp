<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>User Management Application</title>
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css"
	integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T"
	crossorigin="anonymous">

</head>
<body>
	<header>
		<nav class="navbar navbar-expand-md navbar dark"
			style="background-color: lightgray">
			<div>
				<a href="#">User Management</a>
			</div>
			<ul class="navbar-nav">
				<li><a href="<%=request.getContextPath()%>/list"
					class="nav-link">Users</a></li>
			</ul>
		</nav>
	</header>
	<br>
	<div class="container col-md-5">
		<div class="card">
			<div class="card-body">
				<c:choose>
					<c:when test="${user == null}">
						<form action="insert" method="post">
							<h2>
								<caption>Add User</caption>
							</h2>
					</c:when>
					<c:otherwise>
						<form action="update" method="post">
							<h2>
								<caption>Edit User</caption>
							</h2>
							<input type="hidden" name="id"
								value="<c:out value = '${user.id}'/>" />
					</c:otherwise>
				</c:choose>
				<fieldset class="form-group">
					<label>User Name</label> <input type="text"
						value="<c:out value = '${user.name}'/>" class="form-control"
						name="name" required />
				</fieldset>
				<fieldset class="form-group">
					<label>Email</label> <input type="text"
						value="<c:out value = '${user.email}'/>" class="form-control"
						name="email" required />
				</fieldset>
				<fieldset class="form-group">
					<label>Country</label> <input type="text"
						value="<c:out value = '${user.country}'/>" class="form-control"
						name="country" required />
				</fieldset>
				<button type="submit" class="btn btn-success">Save</button>
			</div>
		</div>
	</div>

</body>
</html>