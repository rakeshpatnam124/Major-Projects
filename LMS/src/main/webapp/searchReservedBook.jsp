<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Search Book - Library Management Portal</title>
<!-- Bootstrap CSS -->
<link
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css"
	rel="stylesheet">
<style>
.chart-grid {
	display: grid;
	grid-template-columns: 1fr 1fr;
	gap: 20px;
}
/* Additional styles */
</style>
</head>
<body>
	<jsp:include page="header.jsp"></jsp:include>
	<!-- Table -->
	<div id="allBooks" class="card mb-3 tab-content">
		<div class="card-header">
			<i class="fa fa-table"></i> Books Data
			<form action="<%=request.getContextPath()%>/searchBookByName"
				method="post">
				<div class="search-card text-center float-right">
					<input type="text" id="bname" name="bname" class="form-control"
						placeholder="Book Name"
						style="display: inline-block; width: auto; margin-left: 10px;">&nbsp;&nbsp;
					<button type="submit" class="btn btn-success">Search</button>
				</div>
			</form>
		</div>
		<div class="card-body">
			<div class="table-responsive">
				<table class="table table-bordered" id="dataTable" width="100%"
					cellspacing="0">
					<thead>
						<tr>
							<th>S No.</th>
							<th>Book Name</th>
							<th>Date</th>
						</tr>
					</thead>
					<tbody>

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