<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Main Page</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            margin: 50px;
            text-align: center;
        }
        h2 {
            color: #333;
        }
        .link-buttons {
            margin-top: 30px;
        }
        a {
            display: inline-block;
            padding: 12px 24px;
            margin: 10px;
            background-color: #0066cc;
            color: white;
            text-decoration: none;
            border-radius: 5px;
        }
        a:hover {
            background-color: #004999;
        }
    </style>
</head>
<body>
    <h2>Welcome to Task Management app</h2>
    <div class="link-buttons">
        <a href="users">Go to User Management</a>
        <a href="tasks">Go to Task Management</a>
    </div>
</body>
</html>
