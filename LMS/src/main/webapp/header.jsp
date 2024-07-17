<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Header</title>
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<meta name="description" content="">
<meta name="author" content="">
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/4.0.0/css/bootstrap.css">
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.css">
<link rel="stylesheet" href="./style.css">
<style>
.chart-grid {
	display: grid;
	grid-template-columns: 1fr 1fr;
	gap: 20px;
}
</style>
</head>
<body class="fixed-nav sticky-footer bg-dark" id="page-top">
	<!-- Navigation -->
	<div
		class="navbar sidebar navbar-expand-lg navbar-dark bg-dark fixed-top"
		id="mainNav">
		<a class="navbar-brand" href="#">Library Management</a>
		<button class="navbar-toggler navbar-toggler-right" type="button"
			data-toggle="collapse" data-target="#navbarResponsive"
			aria-controls="navbarResponsive" aria-expanded="false"
			aria-label="Toggle navigation">
			<span class="navbar-toggler-icon"></span>
		</button>
		<div class="collapse navbar-collapse" id="navbarResponsive">
			<ul class="navbar-nav navbar-sidenav" id="exampleAccordion">
				<li class="nav-item" data-toggle="tooltip" data-placement="right"
					title="Dashboard"><a class="nav-link" href="homeLibrarian.jsp"> <i
						class="fa fa-fw fa-dashboard"></i> <span class="nav-link-text">Dashboard</span>
				</a></li>
				<li class="nav-item" data-toggle="tooltip" data-placement="right"
					title="Books"><a class="nav-link" href="./allBooks" id="books-link">
						<i class="fa fa-fw fa-book"></i> <span class="nav-link-text">Books</span>
				</a></li>
				<li class="nav-item" data-toggle="tooltip" data-placement="right"
					title="Members"><a class="nav-link" href="./showUsers"> <i
						class="fa fa-fw fa-users"></i> <span class="nav-link-text">Members</span>
				</a></li>
				<li class="nav-item"><a href="./logout" class="nav-link"> <i
						class="fa fa-fw fa-sign-out"></i>Logout
				</a></li>
			</ul>
		</div>
	</div>

	<!-- Content Wrapper -->
	<div class="content-wrapper">
		<div class="container-fluid">
			<!-- Breadcrumbs -->
			<ol class="breadcrumb">
				<li class="breadcrumb-item"><a href="#">Dashboard</a></li>
				<li class="breadcrumb-item active">My Dashboard</li>
			</ol>

			<!-- Icon Cards -->
			<div class="row main-content">
				<div class="col-xl-3 col-sm-6 mb-3">
					<div class="card text-white bg-primary o-hidden h-100">
						<div class="card-body">
							<div class="card-body-icon"></div>
							<div class="mr-5">All Books</div>
						</div>
						<a class="card-footer text-white clearfix small z-1"
							href="<%=request.getContextPath()%>/allBooks"> <span
							class="float-left">View Details</span>
						</a>
					</div>
				</div>
				<div class="col-xl-3 col-sm-6 mb-3">
					<div class="card text-white bg-warning o-hidden h-100">
						<div class="card-body">
							<div class="card-body-icon"></div>
							<div class="mr-5">Issued Books</div>
						</div>
						<a class="card-footer text-white clearfix small z-1"
							href="#issuedBooks"> <span class="float-left">View
								Details</span>
						</a>
					</div>
				</div>
				<div class="col-xl-3 col-sm-6 mb-3">
					<div class="card text-white bg-success o-hidden h-100">
						<div class="card-body">
							<div class="card-body-icon"></div>
							<div class="mr-5">Returned Books</div>
						</div>
						<a class="card-footer text-white clearfix small z-1" href="#">
							<span class="float-left">View Details</span>
						</a>
					</div>
				</div>
				<div class="col-xl-3 col-sm-6 mb-3">
					<div class="card text-white bg-danger o-hidden h-100">
						<div class="card-body">
							<div class="card-body-icon"></div>
							<div class="mr-5">Reports</div>
						</div>
						<a class="card-footer text-white clearfix small z-1" href="#">
							<span class="float-left">View Details</span>
						</a>
					</div>
				</div>
			</div>
		</div>
</body>
</html>