<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.util.List, com.lms.beans.Book" %>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Library Management System</title>
<!-- Bootstrap CSS -->
<link
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css"
	rel="stylesheet">
<style>
body {
	background-color: #f5f5f5;
}

.card {
	border-radius: 15px;
	background-color: #4a90e2;
	color: white;
	padding: 20px;
}

.table {
	background-color: #ffefdb;
}

.table thead th {
	background-color: #ff7f0e;
	color: white;
}

.card-header {
	font-size: 1.5rem;
}
</style>
</head>
<body>
	<div class="container my-5">
		<div class="card col-md-12">
			<div class="card-header text-center">Librarian / Student</div>
			<div class="card-body">
				<h4 class="text-center">All Books</h4>
				<table class="table table-bordered">
					<thead>
						<tr>
							<th scope="col">ID</th>
							<th scope="col">Book Name</th>
							<th scope="col">Author</th>
							<th scope="col">Price</th>
							<th scope="col">Publisher</th>
							<th scope="col">Published Year</th>
							<th scope="col">Available Quantity</th>
							<th scope="col">Actions</th>
						</tr>
					</thead>
					<tbody id="bookTableBody">
						
						<%
						java.util.List<com.lms.beans.Book> allBooks = (java.util.List<com.lms.beans.Book>) request.getAttribute("allBooks");
						for (com.lms.beans.Book b : allBooks) {
						%>
						<tr>
							<td><%=b.getBid()%></td>
							<td><%=b.getBname()%></td>
							<td><%=b.getAuthor()%></td>
							<td><%=b.getPrice()%></td>
							<td><%=b.getPublisher()%></td>
							<td><%=b.getPublishingYear()%></td>
							<td><%=b.getQuantityAvailable()%></td>
							<td><a href = "<%=request.getContextPath()%>/reserveBook"><button class = "btn btn-success" name = "bname" value = "<%=b.getBname()%>">Reserve</button></a></td>
						</tr>
						<%
						}
						%>

					</tbody>
				</table>
			</div>
		</div>
	</div>

	<!-- Bootstrap JS and dependencies -->
	<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
	<script
		src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.5.2/dist/umd/popper.min.js"></script>
	<script
		src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>


</body>
</html>
