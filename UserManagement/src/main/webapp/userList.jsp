<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>User Management Application</title>
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
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
	<div class="row">
		<div class="container">
			<h3 class="text-center">List of Users</h3>
			<hr>
			<div class="container text-left">
				<a href="<%=request.getContextPath()%>/new" class="btn btn-outline-success">Add
					New User</a>
			</div>
			<br>
			<table class="table table-bordered table-striped">
				<thead class = "thead">
					<tr>
						<td>ID</td>
						<td>Name</td>
						<td>Email</td>
						<td>Country</td>
						<td>Actions</td>
					</tr>
				</thead>
				<tbody>
					<c:forEach var="user" items="${userList}">
						<tr>
							<td><c:out value="${user.id}" /></td>
							<td><c:out value="${user.name}" /></td>
							<td><c:out value="${user.email}" /></td>
							<td><c:out value="${user.country}" /></td>
							<td><a href="edit?id=<c:out value = '${user.id}'/>"><button type="button" class="btn btn-outline-primary">Edit</button></a>
								&nbsp;&nbsp;&nbsp;&nbsp; <a
								href="delete?id=<c:out value = '${user.id}'/>"><button type="button" class="btn btn-outline-primary">Delete</button></a></td>
						</tr>
					</c:forEach>
				</tbody>
			</table>
		</div>
	</div>
</body>
</html>