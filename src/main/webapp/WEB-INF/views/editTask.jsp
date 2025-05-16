<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="com.example.web.database.UserTask" %>

<%
    UserTask task = (UserTask) request.getAttribute("task");
%>
<html>
<head>
    <title>Edit Task</title>
    <style>
        body { font-family: Arial, sans-serif; margin: 20px; }
        form { max-width: 500px; }
        label { display: block; margin-top: 10px; }
        input[type="text"], input[type="date"], select {
            width: 100%; padding: 8px; box-sizing: border-box;
        }
        input[type="submit"] {
            margin-top: 15px;
            padding: 10px 20px;
            background-color: #4CAF50;
            color: white;
            border: none;
            cursor: pointer;
        }
        input[type="submit"]:hover {
            background-color: #45a049;
        }
        a { display: inline-block; margin-top: 15px; }
    </style>
</head>
<body>
    <h1>Edit Task</h1>

    <form action="tasks" method="post">
        <input type="hidden" name="action" value="update" />
        <input type="hidden" name="id" value="<%= task.getId() %>" />

        <label for="title">Title:</label>
        <input type="text" id="title" name="title" value="<%= task.getTitle() %>" required />

        <label for="description">Description:</label>
        <input type="text" id="description" name="description" value="<%= task.getDescription() %>" required />

        <label for="due_date">Due Date:</label>
        <input type="date" id="due_date" name="due_date" value="<%= new java.text.SimpleDateFormat("yyyy-MM-dd").format(task.getDue_date()) %>" required />

        <label for="user_id">User ID:</label>
        <input type="text" id="user_id" name="user_id" value="<%= task.getUser_id() %>" required />

        <label for="status">Status:</label>
        <select id="status" name="status" required>
            <option value="Pending" <%= "Pending".equals(task.getStatus()) ? "selected" : "" %>>Pending</option>
            <option value="In Progress" <%= "In Progress".equals(task.getStatus()) ? "selected" : "" %>>In Progress</option>
            <option value="Completed" <%= "Completed".equals(task.getStatus()) ? "selected" : "" %>>Completed</option>
        </select>

        <input type="submit" value="Update Task" />
    </form>

    <a href="tasks">Back to Task List</a>
</body>
</html>
