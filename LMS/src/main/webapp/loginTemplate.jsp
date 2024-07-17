<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Library Management Portal</title>
    <style>
        body {
            background-color: #121212;
            color: #ffffff;
            font-family: Arial, sans-serif;
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
            margin: 0;
        }
        .login-container {
            background-color: #1e1e1e;
            padding: 20px;
            border-radius: 8px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.3);
            width: 300px;
        }
        .login-container h1 {
            text-align: center;
            margin-bottom: 20px;
        }
        .login-container label {
            display: block;
            margin-bottom: 5px;
        }
        .login-container input, .login-container select {
            width: 100%;
            padding: 10px;
            margin-bottom: 15px;
            border: none;
            border-radius: 4px;
            background-color: #333333;
            color: #ffffff;
        }
        .login-container button {
            width: 100%;
            padding: 10px;
            background-color: #6200ea;
            border: none;
            border-radius: 4px;
            color: #ffffff;
            cursor: pointer;
            font-size: 16px;
        }
        .login-container button:hover {
            background-color: #3700b3;
        }
    </style>
</head>
<body>
    <div class="login-container">
        <h1>Library Management Portal</h1>
        <form>
            <label for="username">Username</label>
            <input type="text" id="username" name="username" required>
            
            <label for="password">Password</label>
            <input type="password" id="password" name="password" required>
            
            <label for="role">Role</label>
            <select id="role" name="role" required>
                <option value="Librarian">Librarian</option>
                <option value="Student">Student</option>
            </select>
            
            <button type="submit">Login</button>
        </form>
    </div>
</body>
</html>
