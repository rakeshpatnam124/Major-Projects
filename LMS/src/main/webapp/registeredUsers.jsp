<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Library Management System</title>
<!-- Bootstrap CSS -->
<link href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet">
<style>
body {
    background-color: #f5f5f5;
}

.sidebar {
    background-color: #2c3e50;
    height: 100vh;
    padding: 20px;
    color: white;
}

.sidebar a {
    color: white;
    text-decoration: none;
    display: block;
    margin: 10px 0;
}

.sidebar a:hover {
    background-color: #34495e;
    padding-left: 10px;
}

.header {
    background-color: #2980b9;
    color: white;
    padding: 15px;
    text-align: center;
}

.dashboard-card {
    display: flex;
    justify-content: space-between;
    align-items: center;
    padding: 20px;
    border-radius: 10px;
    margin-bottom: 20px;
    color: white;
}

.card-blue {
    background-color: #3498db;
}

.card-green {
    background-color: #2ecc71;
}

.card-purple {
    background-color: #9b59b6;
}

.card-red {
    background-color: #e74c3c;
}

.card-orange {
    background-color: #f39c12;
}

.card-dark-blue {
    background-color: #2980b9;
}

.chart-container {
    background-color: white;
    padding: 20px;
    border-radius: 10px;
    box-shadow: 0 4px 8px 0 rgba(0, 0, 0, 0.8);
    margin-top: 20px;
}

.chart-container h3 {
    margin-bottom: 20px;
}
</style>
</head>
<body>
    <div class="container-fluid">
        <div class="row">
            <div class="col-md-2 sidebar">
                <h2>Library Management</h2>
                <a href="#">Dashboard</a>
                <a href="#">Members Section</a>
                <a href="#">Books Section</a>
                <a href="#">Issued List</a>
                <a href="#">Returned List</a>
                <a href="#">Not Returned List</a>
                <a href="#">Logout</a>
            </div>
            <div class="col-md-10">
                <div class="header">
                    <h1>Control Panel</h1>
                </div>
                <div class="container mt-4">
                    <div class="row">
                        <div class="col-md-4">
                            <div class="card bg-success text-white mb-3">
                                <div class="card-body">
                                    <h2 class="card-title">Registered Members</h2>
                                    <span class="card-text">15</span>
                                    <a href="#" class="btn btn-light mt-3">View More</a>
                                </div>
                            </div>
                        </div>
                        <div class="col-md-4">
                            <div class="card bg-primary text-white mb-3">
                                <div class="card-body">
                                    <h2 class="card-title">Total Books</h2>
                                    <span class="card-text">22</span>
                                    <a href="#" class="btn btn-light mt-3">View More</a>
                                </div>
                            </div>
                        </div>
                        <div class="col-md-4">
                            <div class="card bg-warning text-white mb-3">
                                <div class="card-body">
                                    <h2 class="card-title">Issued Books</h2>
                                    <span class="card-text">11</span>
                                    <a href="#" class="btn btn-light mt-3">View More</a>
                                </div>
                            </div>
                        </div>
                        <div class="col-md-4">
                            <div class="card bg-secondary text-white mb-3">
                                <div class="card-body">
                                    <h2 class="card-title">Returned Books</h2>
                                    <span class="card-text">6</span>
                                    <a href="#" class="btn btn-light mt-3">View More</a>
                                </div>
                            </div>
                        </div>
                        <div class="col-md-4">
                            <div class="card bg-dark text-white mb-3">
                                <div class="card-body">
                                    <h2 class="card-title">Not Returned Books</h2>
                                    <span class="card-text">5</span>
                                    <a href="#" class="btn btn-light mt-3">View More</a>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="chart-container">
                        <h3>Monthly Transaction Report</h3>
                        <!-- Placeholder for chart -->
                        <div id="transaction-chart"></div>
                    </div>
                    <div class="mt-5">
                        <h2>Issued</h2>
                        <table class="table table-bordered">
                            <thead>
                                <tr>
                                    <th>Issue ID</th>
                                    <th>Member</th>
                                    <th>Book Number</th>
                                    <th>Book Title</th>
                                    <th>Issue Date</th>
                                    <th>Return Date</th>
                                    <th>Status</th>
                                </tr>
                            </thead>
                            <tbody>
                                <tr>
                                    <td>1023</td>
                                    <td>Johnny Wiley</td>
                                    <td>1001</td>
                                    <td>River Between</td>
                                    <td>02/24/2018</td>
                                    <td>02/24/2018</td>
                                    <td>Returned</td>
                                </tr>
                                <tr>
                                    <td>602</td>
                                    <td>James Sanders</td>
                                    <td>1009</td>
                                    <td>World War Z</td>
                                    <td>04/14/2021</td>
                                    <td>04/27/2021</td>
                                    <td>Returned</td>
                                </tr>
                                <tr>
                                    <td>103</td>
                                    <td>Walter Guerrero</td>
                                    <td>1012</td>
                                    <td>Everything's Eventual: 14 Dark Tales</td>
                                    <td>04/14/2021</td>
                                    <td>04/23/2021</td>
                                    <td>Issued</td>
                                </tr>
                                <tr>
                                    <td>104</td>
                                    <td>Daniel Abrahams</td>
                                    <td>1002</td>
                                    <td>River Between</td>
                                    <td>04/15/2021</td>
                                    <td>04/22/2021</td>
                                    <td>Returned</td>
                                </tr>
                                <tr>
                                    <td>105</td>
                                    <td>Anna Maria</td>
                                    <td>1010</td>
                                    <td>The Great Gatsby</td>
                                    <td>04/16/2021</td>
                                    <td>04/23/2021</td>
                                    <td>Issued</td>
                                </tr>
                                <!-- More rows as needed -->
                            </tbody>
                        </table>
                    </div>
                    <div class="mt-5">
                        <h2>Registered Members</h2>
                        <table class="table table-bordered">
                            <thead>
                                <tr>
                                    <th>ID</th>
                                    <th>ID Number</th>
                                    <th>Name</th>
                                    <th>Email</th>
                                    <th>Mobile</th>
                                    <th>Address</th>
                                    <th>Role</th>
                                </tr>
                            </thead>
                            <tbody>
                                <tr>
                                    <td>1</td>
                                    <td>ABC123</td>
                                    <td>John Doe</td>
                                    <td>johndoe@example.com</td>
                                    <td>123-456-7890</td>
                                    <td>123 Main St</td>
                                    <td>Member</td>
                                </tr>
                                <tr>
                                    <td>2</td>
                                    <td>DEF456</td>
                                    <td>Jane Smith</td>
                                    <td>janesmith@example.com</td>
                                    <td>987-654-3210</td>
                                    <td>456 Elm St</td>
                                    <td>Member</td>
                                </tr>
                                <!-- More rows as needed -->
                            </tbody>
                        </table>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <!-- Bootstrap JS and dependencies -->
    <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.5.4/dist/umd/popper.min.js"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
</body>
</html>
