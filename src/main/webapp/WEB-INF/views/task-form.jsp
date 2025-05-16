<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>
        <c:choose>
            <c:when test="${action == 'insert'}">Add New Task</c:when>
            <c:otherwise>Edit Task</c:otherwise>
        </c:choose>
    </title>
    <style>
        body { font-family: Arial, sans-serif; margin: 20px; }
        .form-container { max-width: 500px; margin: 0 auto; }
        .form-group { margin-bottom: 15px; }
        label { display: block; margin-bottom: 5px; font-weight: bold; }
        input[type="text"], input[type="date"], input[type="number"], select {
            width: 100%; padding: 8px; border: 1px solid #ddd; border-radius: 4px;
        }
        .button-group { margin-top: 20px; }
        button {
            padding: 8px 15px; background-color: #0066cc; color: white;
            border: none; border-radius: 4px; cursor: pointer;
        }
        button:hover { background-color: #0055aa; }
        .cancel-link { margin-left: 10px; }
    </style>
</head>
<body>
    <div class="form-container">
        <h1>
            <c:choose>
                <c:when test="${action == 'insert'}">Add New Task</c:when>
                <c:otherwise>Edit Task</c:otherwise>
            </c:choose>
        </h1>

        <form action="tasks" method="post">
            <input type="hidden" name="action" value="${action}">

            <c:if test="${action == 'update'}">
                <input type="hidden" name="id" value="${task.id}">
            </c:if>

            <div class="form-group">
                <label for="title">Title:</label>
                <input type="text" id="title" name="title" value="${task.title}" required>
            </div>

            <div class="form-group">
                <label for="description">Description:</label>
                <input type="text" id="description" name="description" value="${task.description}" required>
            </div>

            <div class="form-group">
                <label for="due_date">Due Date:</label>
                <input type="date" id="due_date" name="due_date" value="${task.due_date}" required>
            </div>

            <div class="form-group">
                <label for="user_id">User ID:</label>
                <input type="number" id="user_id" name="user_id" value="${task.user_id}" required>
            </div>

            <div class="form-group">
                <label for="status">Status:</label>
                <select id="status" name="status" required>
                    <option value="Pending" ${task.status == 'Pending' ? 'selected' : ''}>Pending</option>
                    <option value="In Progress" ${task.status == 'In Progress' ? 'selected' : ''}>In Progress</option>
                    <option value="Completed" ${task.status == 'Completed' ? 'selected' : ''}>Completed</option>
                </select>
            </div>

            <div class="button-group">
                <button type="submit">
                    <c:choose>
                        <c:when test="${action == 'create'}">Add Task</c:when>
                    </c:choose>
                </button>
                <a href="tasks" class="cancel-link">Cancel</a>
            </div>
        </form>
    </div>
</body>
</html>