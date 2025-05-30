<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import = "java.util.List"%>
<%@ page import = "com.example.web.database.User" %>

<%
    List<User> users = (List<User>) request.getAttribute("users");
%>
<html>
<head>
    <title>User Management</title>
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
    <h1>User Management</h1>

    <div class="action-buttons">
        <a href="users?action=new">Add New User</a>
    </div>

    <table>
        <tr>
            <th>ID</th>
            <th>First Name</th>
            <th>Last Name</th>
            <th>Mobile Number</th>
        </tr>

        <%
            if(users != null){
                for(User user: users){

        %>
        <tr>
        </tr>
            <td><%= user.getId() %></td>
            <td><%= user.getFirstName() %></td>
            <td><%= user.getLastName() %></td>
            <td><%= user.getMobileNumber() %></td>
        <%
            }
        }
        %>
    </table>
   <br>
   <br>
    <a href="index.jsp">
        <button>Back to Main Page</button>
    </a>
</body>
</html>