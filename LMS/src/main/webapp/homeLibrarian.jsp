<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

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
	margin-bottom: 20px;
	box-shadow: 0 4px 8px 0 rgba(0, 0, 0, 0.8);
}

.btn-success {
	background-color: #ff7f0e;
	color: white;
	border: none;
	margin: 5px;
	box-shadow: 0 4px 8px 0 rgba(0, 0, 0, 0.8);
}

.btn-success:hover {
	background-color: #ff5500;
}
</style>
</head>
<body>
	<div class="container my-5">
		<div class="card text-center">
			<div class="card-header">
				<div class="container">
					<div class="header-title">
						<h1>Librarian Home Page</h1>
					</div>
				</div>
			</div>
			<div class="card-body" style="margin-top: 40px">
				<div class="container">
					<button class="btn btn-primary" onclick = "myFunction()">Logout</button><br /> <br />
				</div>
				<div class="form-group">
					<input type="hidden" id="status"
						value="<%=request.getAttribute("status")%>" class="form-control">
				</div>
				<a href="register.jsp"><button class="btn btn-success">Register</button></a>
				<a href="addBook.jsp"><button class="btn btn-success">Add
						Book</button></a> <a href="deleteBook.jsp"><button class="btn btn-success">Delete
						Book</button></a> <a href="issueBook.jsp"><button class="btn btn-success">Issue
						Book</button></a> <a href="updateStock.jsp"><button class="btn btn-success">Update
						Stock</button></a> <a href="<%=request.getContextPath()%>/allBooks"><button
						class="btn btn-success">All Books</button></a> <a
					href="searchBookByName.jsp"><button class="btn btn-success">Search
						Book</button></a> <a href="issuedBooks.jsp"><button class="btn btn-success">Issued
						Books</button></a>
			</div>
		</div>
	</div>

	<!-- Bootstrap JS and dependencies -->
	<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
	<script
		src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.5.2/dist/umd/popper.min.js"></script>
	<script
		src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
		
		
	<script type = "text/javascript">
	function myFunction() {
		let result = confirm("You will be logged out !!");
		if (result === true) {
			document.location.href = "<%=request.getContextPath()%>/logout";
		}
	  
	}
	</script>
</body>
</html>