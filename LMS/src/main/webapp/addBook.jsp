<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Add Book</title>
<!-- Bootstrap CSS -->
<link
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css"
	rel="stylesheet">
<style>
body {
	background-color: white;
	display: flex;
	justify-content: center;
	align-items: center;
	height: 100vh;
	margin: 0;
}

.container {
	max-width: 600px;
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

.form-group label {
	color: white;
}

.form-control {
	border-radius: 5px;
}

.btn-primary {
	background-color: #ff7f0e;
	box-shadow: 0 4px 8px 0 rgba(0, 0, 0, 0.8);
}

.btn-primary:hover {
	background-color: #ff5500;
}
</style>
</head>
<body>
	<div class="container">
		<div class="card">
			<div class="card-header">Add Book</div>
			<div class="card-body">
				<form id="addBookForm" action = "<%=request.getContextPath()%>/addBook" method = "post">
					<div class="form-group">
						<label for="bname">Book Name</label> <input type="text"
							class="form-control" id="bname" name="bname" required>
					</div>
					<div class="form-group">
						<label for="author">Author</label> <input type="text"
							class="form-control" id="author" name="author" required>
					</div>
					<div class="form-group">
						<label for="price">Price</label> <input type="text"
							class="form-control" id="price" name="price" required>
					</div>
					<div class="form-group">
						<label for="publisher">Publisher</label> <input type="text"
							class="form-control" id="publisher" name="publisher" required>
					</div>
					<div class="form-group">
						<label for="publishingYear">Publishing Year</label> <input
							type="text" class="form-control" id="publishingYear"
							name="publishingYear" required>
					</div>
					<div class="form-group">
						<label for="quantityAvailable">Available Quantity</label> <input
							type="number" class="form-control" id="quantityAvailable"
							name="quantityAvailable" required>
					</div>
					<div class="text-center">
						<button type="submit" class="btn btn-primary">Add Book</button>
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

