<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Student Home Page</title>
<!-- Bootstrap CSS -->
<link
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css"
	rel="stylesheet">
<style>
body {
	background-color: #f5f5f5;
}

.container {
	margin-top: 50px;
}

.search-card {
	border-radius: 15px;
	background-color: #4a90e2;
	padding: 20px;
	color: white;
	box-shadow: 0 4px 8px 0 rgba(0, 0, 0, 0.8);
}

.search-card h2, .search-card label {
	color: white;
}

.table-card {
	border-radius: 15px;
	background-color: #4a90e2;
	padding: 20px;
	color: white;
	margin-top: 20px;
	box-shadow: 0 4px 8px 0 rgba(0, 0, 0, 0.8);
}

.table thead th {
	background-color: #ff7f0e;
	color: white;
}

.table tbody td {
	background-color: #ffe9cc;
}

.btn-reserve {
	background-color: #98fb98;
	color: black;
	border-radius: 5px;
}

.btn-reserve:hover {
	background-color: #8fbc8f;
}
</style>
</head>
<body>
	<div class="container">
		<form action="<%=request.getContextPath()%>/searchBookByName"
			method="post">
			<div class="search-card text-center">
				<h2>
					<b>Search Book</b>
				</h2>
				<br /> <label for="bookName">Search Book by Name</label> <input
					type="text" id="bname" name="bname" class="form-control"
					placeholder="Book Name"
					style="display: inline-block; width: auto; margin-left: 10px;">&nbsp;&nbsp;
				<button type="submit" class="btn btn-success">Search</button>
			</div>
		</form>
		<div class="table-card">
			<table class="table table-bordered">
				<thead>
					<tr>
						<th>ID</th>
						<th>Book Name</th>
						<th>Author</th>
						<th>Price</th>
						<th>Publisher</th>
						<th>Publishing Year</th>
						<th>Available Quantity</th>
					</tr>
				</thead>
				<tbody>
				
					<%
					com.lms.beans.Book searchedBook = (com.lms.beans.Book) request.getAttribute("searchedBook");
					if (searchedBook != null) {
					%>
					<tr>
						<td><%=searchedBook.getBid()%></td>
						<td><%=searchedBook.getBname()%></td>
						<td><%=searchedBook.getAuthor()%></td>
						<td><%=searchedBook.getPrice()%></td>
						<td><%=searchedBook.getPublisher()%></td>
						<td><%=searchedBook.getPublishingYear()%></td>
						<td><%=searchedBook.getQuantityAvailable()%></td>
					</tr>
					<%
					}
					%>
				</tbody>
			</table>
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