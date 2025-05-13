<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<head><title>User Tasks</title></head>
<body>
<h2>Add New Task</h2>
<form method="post" action="tasks">
    Title: <input type="text" name="title"/><br/>
    Description: <input type="text" name="description"/><br/>
    Due Date (yyyy-MM-dd): <input type="text" name="due_date"/><br/>
    User ID: <input type="text" name="user_id"/><br/>
    Status: <input type="text" name="status"/><br/>
    <input type="submit" value="Add Task"/>
</form>

<h2>Task List</h2>
<ul>
    <c:forEach var="task" items="${tasks}">
        <li>${task.title} - ${task.status} (Due: ${task.due_date})</li>
    </c:forEach>
</ul>
</body>
</html>
