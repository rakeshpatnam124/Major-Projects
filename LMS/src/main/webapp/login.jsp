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
<link rel="stylesheet" href="alert/dist/sweetalert.css">
<style>
.chart-grid {
	display: grid;
	grid-template-columns: 1fr 1fr;
	gap: 20px;
}
body {
	background-color : #f5f5f5;
}
.card {
	border-radius: 15px;
	background-color: #4a90e2;
	color: white;
	box-shadow: 0 4px 8px 0 rgba(0, 0, 0, 0.8);
}

.card-header, .card-body {
	color: white;
}

.header-title {
	box-shadow: 0 4px 8px 0 rgba(0, 0, 0, 0.8);
}

.form-control, .btn {
	border-radius: 5px;
}

.btn-primary {
	background-color: #ff7f0e;
	box-shadow: 0 4px 8px 0 rgba(0, 0, 0, 0.8);
}

.btn-primary:hover {
	background-color: #ff5500;
}

.header-title {
	background-color: #4a90e2;
	color: white;
	padding: 20px;
	border-radius: 15px;
	text-align: center;
	margin-top: 20px;
	font-family: 'Arial', sans-serif;
}
</style>
</head>
<body>
	<div class="login-container" style="margin-top: 40px;">
		<div class="container">
			<div class="header-title">
				<h1>Library Management System</h1>
				<p class="lead">Organize - Discover - Inspire</p>
			</div>
		</div>
		<div
			class="container d-flex justify-content-center align-items-center"
			style="height: 65vh;">
			<div class="card col-md-6 row-md-6">
				<div class="card-header text-center">
					<b>User Login</b>
				</div>
				<div class="card-body">
					<form action="./login" method="post">
						<div class="form-group">
							<input type="hidden" id="status"
								value="<%=request.getAttribute("status")%>" class="form-control">
						</div>
						<div class="form-group">
							<label for="idNumber">Username</label> <input type="text"
								class="form-control" id="idNumber" name="idNumber">
						</div>
						<div class="form-group">
							<label for="password">Password</label> <input type="password"
								class="form-control" id="password" name="password">
						</div>
						<div class="form-group">
							<label for="user-type">Role</label> <select class="form-control"
								id="role" name="role">
								<option value="Librarian">Librarian</option>
								<option value="Student">Student</option>
							</select>
						</div>
						<div class="text-center">
							<button type="submit" class="btn btn-primary">Login</button>
						</div>
					</form>
				</div>
			</div>
		</div>
	</div>

	<!-- Bootstrap JS and dependencies -->
	<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
	<script
		src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.5.2/dist/umd/popper.min.js"></script>
	<script
		src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>

	<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>


	<script type="text/javascript">
		var status = document.getElementById("status").value;
		if (status == "failure") {
			swal("Login Failed", "Incorrect Details", "error");
		}
	</script>
</body>
</html>
