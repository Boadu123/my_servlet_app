<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>
        <c:choose>
            <c:when test="${action == 'insert'}">Add New User</c:when>
            <c:otherwise>Edit User</c:otherwise>
        </c:choose>
    </title>
    <style>
        body { font-family: Arial, sans-serif; margin: 20px; }
        .form-container { max-width: 500px; margin: 0 auto; }
        .form-group { margin-bottom: 15px; }
        label { display: block; margin-bottom: 5px; font-weight: bold; }
        input[type="text"], input[type="number"] {
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
                <c:when test="${action == 'insert'}">Add New User</c:when>
                <c:otherwise>Edit User</c:otherwise>
            </c:choose>
        </h1>

        <form action="users" method="post">
            <input type="hidden" name="action" value="${action}">

            <c:if test="${action == 'update'}">
                <input type="hidden" name="id" value="${user.id}">
            </c:if>

            <div class="form-group">
                <label for="firstName">First Name:</label>
                <input type="text" id="firstName" name="firstName" value="${user.firstName}" required>
            </div>

            <div class="form-group">
                <label for="lastName">Last Name:</label>
                <input type="text" id="lastName" name="lastName" value="${user.lastName}" required>
            </div>

            <div class="form-group">
                <label for="mobile">Mobile Number:</label>
                <input type="text" id="mobile" name="mobile" value="${user.mobileNumber}" required>
            </div>

            <div class="button-group">
                <button type="submit">
                    <c:choose>
                        <c:when test="${action == 'insert'}">Add User</c:when>
                        <c:otherwise>Update User</c:otherwise>
                    </c:choose>
                </button>
                <a href="users" class="cancel-link">Cancel</a>
            </div>
        </form>
    </div>
</body>
</html>