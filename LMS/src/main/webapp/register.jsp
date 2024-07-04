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
body {
	background-color: #f5f5f5;
}

.card {
	border-radius: 15px;
	background-color: #4a90e2;
	box-shadow: 0 4px 8px 0 rgba(0, 0, 0, 0.8);
}

.card-header, .card-body {
	color: white;
}

.form-control, .btn, .dropdown-toggle {
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
	<div
		class="container d-flex justify-content-center align-items-center "
		style="height: 100vh; margin-top: 50px; margin-bottom: 50px">
		<div class="card col-md-7">
			<div class="card-header text-center"><b>Registration Form</b></div>
			<div class="card-body">
				<form action="<%=request.getContextPath()%>/register" method="post">
					<div class="form-group">
						<input type="hidden" id="status"
							value="<%=request.getAttribute("status")%>" class="form-control">
					</div>
					<div class="form-group">
						<label for="name">Name</label> <input type="text"
							class="form-control" id="name" name="name" required />
					</div>
					<div class="form-group">
						<label for="rollNumber">Roll Number</label> <input type="text"
							class="form-control" id="idNumber" name="idNumber" required />
					</div>
					<div class="form-group">
						<label for="email">Email</label> <input type="email"
							class="form-control" id="email" name="email" required />
					</div>
					<div class="form-group">
						<label for="password">Password</label> <input type="password"
							class="form-control" id="password" name="password" required />
					</div>
					<div class="form-group">
						<label for="mobile">Mobile</label> <input type="text"
							class="form-control" id="mobile" name="mobile" required />
					</div>
					<div class="form-group">
						<label for="address">Address</label>
						<textarea class="form-control" id="address" name="address"
							required></textarea>
					</div>
					<div class="form-group">
						<label for="user-type">User Type</label> <select
							class="form-control" id="user-type" name="role">
							<option value="Librarian">Librarian</option>
							<option value="Student">Student</option>
						</select>
					</div><br/>
					<div class="d-flex justify-content-between">
						<button type="submit" class="btn btn-primary">Register</button>
						<a href="login.jsp"><button type="button"
								class="btn btn-primary">Login</button></a>
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
		
	<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>

	<script type="text/javascript">
		var status = document.getElementById("status").value;
		if (status == "success") {
			swal("Registered", "Account Created Successfully", "success");
		}
	</script>
</body>
</html>
