<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import = "java.util.List"%>
<%@ page import = "com.example.web.database.UserTask" %>

<%
    List<UserTask> tasks = (List<UserTask>) request.getAttribute("tasks");
%>
<html>
<head>
    <title>Task Management</title>
    <style>
        body { font-family: Arial, sans-serif; margin: 20px; }
        table { width: 100%; border-collapse: collapse; margin-top: 20px; }
        th, td { border: 1px solid #ddd; padding: 8px; text-align: left; }
        th { background-color: #f2f2f2; }
        a { text-decoration: none; color: #0066cc; }
        a:hover { text-decoration: underline; }
        .action-buttons { margin-bottom: 20px; }
    </style>
</head>
<body>
    <h1>Task Management</h1>

    <div class="action-buttons">
        <a href="tasks?action=new">Add New Task</a>
    </div>

    <table>
        <tr>
            <th>ID</th>
            <th>Title</th>
            <th>Description</th>
            <th>Due Date</th>
            <th>User ID</th>
            <th>Status</th>
            <th>Actions</th>
        </tr>

        <%
            if(tasks != null){
                for(UserTask task: tasks){
        %>
        <tr>
            <td><%= task.getId() %></td>
            <td><%= task.getTitle() %></td>
            <td><%= task.getDescription() %></td>
            <td><%= task.getDue_date() %></td>
            <td><%= task.getUser_id() %></td>
            <td><%= task.getStatus() %></td>
            <td><div>
                <a href="tasks?action=edit&id=<%= task.getId() %>"><button>Edit</button></a>
                <form action="tasks" method="post" style="display:inline;" onsubmit="return confirm('Are you sure you want to delete this task?');">
                    <input type="hidden" name="action" value="delete"/>
                    <input type="hidden" name="id" value="<%= task.getId() %>"/>
                    <button type="submit">Delete</button>
                </form>
            </div></td>
        </tr>
        <%
                }
            }
        %>
    </table>
</body>
</html>