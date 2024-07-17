<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="java.util.List, com.lms.beans.IssuedBook"%>

<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<title>Reserved Books - Library Management Portal</title>
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
/* Additional styles */
</style>
</head>
<body>
	<jsp:include page="headerStudent.jsp"></jsp:include>
	<!-- Table -->
	<div id="allBooks" class="card mb-3 tab-content">
		<div class="card-header">
			<i class="fa fa-table"></i> Reserved Books
			<form action="<%=request.getContextPath()%>/searchReservedBook"
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
							<th>Actions</th>
						</tr>
					</thead>
					<tbody>
						<%
						List<IssuedBook> userReservedBooks = (List<IssuedBook>) request.getAttribute("userReservedBooks");
						com.lms.beans.UserBooks userBookList = (com.lms.beans.UserBooks) request.getAttribute("userBookList");
						int i = 1;
						for (IssuedBook b : userReservedBooks) {
						%>
						<tr>
							<td><%=i%></td>
							<td><%=b.getBname()%></td>
							<td><%=b.getReservedDate()%></td>
							<c:choose>
								<c:when test="${role == 1}">
									<%
									if (userBookList.getBidList().contains(Integer.valueOf(b.getBid())) == true) {
									%>
									<td><a
										href="./unreserveBookReservedBooksPage?bid=<%=b.getBid()%>"><button
												class="btn btn-primary">Reserved</button></a></td>
									<%
									} else {
									%>
									<td><a
										href="./reserveBookReservedBooksPage?bid=<%=b.getBid()%>"><button
												class="btn btn-success">Reserve</button></a></td>
									<%
									}
									%>

								</c:when>
							</c:choose>
						</tr>
						<%
						i++;
						}
						%>
					</tbody>
				</table>
			</div>
		</div>
	</div>


	<!-- Bootstrap core JavaScript-->
	<script src="https://code.jquery.com/jquery-3.2.1.slim.min.js"></script>
	<script
		src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.11.0/umd/popper.min.js"></script>
	<script
		src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"></script>
	<script
		src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.7.2/Chart.min.js"></script>

</body>
</html>

