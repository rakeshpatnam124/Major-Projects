<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Student Home - Library Management System</title>
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
						<h1>Student Home Page</h1>
					</div>
				</div>
			</div>
			<div class="card-body">
				<div class="container">
					<a href="login.jsp"><button class="btn btn-primary">Login
							Page</button></a><br /> <br />
				</div>
				<a href="reserveBook.jsp"><button class="btn btn-success">Reserve
						Book</button></a> <a href="<%=request.getContextPath()%>/allBooks"><button class="btn btn-success">All
						Books</button></a> <a href="renewalBook.jsp"><button
						class="btn btn-success">Renewal Book</button></a> <a
					href="returnBook.jsp"><button class="btn btn-success">Return
						Book</button></a><a href="searchBookByName.jsp"><button
						class="btn btn-success">Search Book</button></a>
			</div>
		</div>
		<img src = "./libraryHome.jpg"/>
	</div>

	<!-- Bootstrap JS and dependencies -->
	<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
	<script
		src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.5.2/dist/umd/popper.min.js"></script>
	<script
		src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
</body>
</html>