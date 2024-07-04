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
	box-shadow: 0 4px 8px 0 rgba(0, 0, 0, 0.8);
}

.card-header {
	font-size: 1.5rem;
	font-weight: bold;
	text-align: center;
}

.form-control, .btn {
	border-radius: 5px;
}

.btn-primary {
	background-color: #ff7f0e;
	box-shadow: 0 4px 8px 0 rgba(0, 0, 0, 0.8);
}

.btn-primary :hover {
	background-color: #285a8c;
}
</style>
</head>
<body>
	<div class="container d-flex justify-content-center align-items-center"
		style="height: 100vh;">
		<div class="card col-md-6">
			<div class="card-header text-center">Delete Book</div>
			<div class="card-body">
				<form action="<%=request.getContextPath()%>/deleteBook"
					method="post">
					<div class="form-group">
						<label for="book-name">Book Name</label> <input type="text"
							class="form-control" id="bname" name="bname">
					</div>
					<div class="text-center">
						<button type="submit" class="btn btn-primary">Delete Book</button>
					</div>
				</form>
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
