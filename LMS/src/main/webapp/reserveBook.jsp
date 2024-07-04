<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Find Books Reserved</title>
    <!-- Bootstrap CSS -->
    <link href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet">
    <style>
        body {
            background-color: #f5f5f5;
        }
        .container {
            margin-top: 50px;
        }
        .table-card {
            border-radius: 15px;
            background-color: #4a90e2;
            padding: 20px;
            color: white;
            box-shadow: 0 4px 8px 0 rgba(0, 0, 0, 0.8);
        }
        .table-card h2, .table-card label {
            color: white;
        }
        .table thead th {
            background-color: #ff7f0e;
            color: white;
        }
        .table tbody td {
            background-color: #ffe9cc;
        }
        .btn-issue {
            background-color: #98fb98;
            color: black;
            border-radius: 5px;
        }
        .btn-issue:hover {
            background-color: #8fbc8f;
        }
    </style>
</head>
<body>
    <div class="container">
        <div class="table-card text-center">
            <h2>Librarian</h2>
            <label for="reservedBooks">Books Reserved</label>
            <div id="reservedBooks" class="table-responsive">
                <table class="table table-bordered mt-3">
                    <thead>
                        <tr>
                            <th>ID</th>
                            <th>Book Name</th>
                            <th>RollNo</th>
                            <th>Student Name</th>
                            <th>Book Reserve Date</th>
                            <th>Quantity Available</th>
                            <th>Action</th>
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
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.5.2/dist/umd/popper.min.js"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
</body>
</html>