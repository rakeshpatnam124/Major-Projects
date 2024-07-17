<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page
	import="java.util.List, com.lms.beans.Book, com.lms.beans.UserBooks"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>All Books - Library Management Portal</title>
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
	<c:choose>
		<c:when test="${role == 1}">
			<jsp:include page="headerStudent.jsp"></jsp:include>
		</c:when>
		<c:otherwise>
			<jsp:include page="header.jsp"></jsp:include>
		</c:otherwise>
	</c:choose>

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
							<th scope="col">ID</th>
							<th scope="col">Book Name</th>
							<th scope="col">Author</th>
							<th scope="col">Price</th>
							<th scope="col">Publisher</th>
							<th scope="col">Published Year</th>
							<th scope="col">Available Quantity</th>
							<c:choose>
								<c:when test="${role == 1}">
									<th scope="col">Actions</th>
								</c:when>
							</c:choose>

						</tr>
					</thead>
					<tbody>
						<%
						java.util.List<com.lms.beans.Book> allBooks = (java.util.List<com.lms.beans.Book>) request.getAttribute("allBooks");
						com.lms.beans.UserBooks userBookList = (com.lms.beans.UserBooks) request.getAttribute("userBookList");
						for (com.lms.beans.Book b : allBooks) {
						%>
						<tr>
							<td><%=b.getBid()%></td>
							<td><%=b.getBname()%></td>
							<td><%=b.getAuthor()%></td>
							<td><%=b.getPrice()%></td>
							<td><%=b.getPublisher()%></td>
							<td><%=b.getPublishingYear()%></td>
							<td><%=b.getQuantityAvailable()%></td>
							<c:choose>
								<c:when test="${role == 1}">
									<%
									if (userBookList.getBidList().contains(Integer.valueOf(b.getBid())) == true) {
									%>
									<td><a href="./unreserveBook?bid=<%=b.getBid()%>"><button
												class="btn btn-primary">Reserved</button></a></td>
									<%
									} else {
									%>
									<td><a href="./reserveBook?bid=<%=b.getBid()%>"><button
												class="btn btn-success">Reserve</button></a></td>
									<%
									}
									%>

								</c:when>
							</c:choose>

						</tr>
						<%
						}
						%>
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
