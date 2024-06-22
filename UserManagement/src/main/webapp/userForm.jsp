<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>User Management Application</title>
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
</head>
<body>
	<div class = "container" style = "margin-top : 40px">
		<nav class="navbar navbar-expand-md ">
			<div>
				<a class = "nav-link" href="#"><button type="button" class="btn btn-outline-light" style = "color : black">User Management</button></a>
			</div>
			<ul class="navbar-nav">
				<li><a href="<%=request.getContextPath()%>/list"
					class="nav-link active"><button type="button" class="btn btn-outline-light" style = "color : black">Users</button></a></li>
			</ul>
		</nav>
	</div>
	<br>
	<div class="container col-md-5">
		<div class="card" style = "box-shadow: 0 4px 8px 0 rgba(0, 0, 0, 0.2)">
			<div class="card-body">
				<c:choose>
					<c:when test="${user == null}">
						<form action="insert" method="post">
							<h2>
								<caption>Add User</caption>
							</h2><br/>
					</c:when>
					<c:otherwise>
						<form action="update" method="post">
							<h2>
								<caption>Edit User</caption>
							</h2><br/>
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
				<div class="d-grid gap-2">
					<button type="submit" class="btn btn-success">Save</button>
				</div>
			</div>
		</div>
	</div>

</body>
</html>