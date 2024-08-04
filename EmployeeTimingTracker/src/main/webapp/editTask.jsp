<%@page import="java.sql.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<% 
    //HttpSession session = request.getSession(false);
    ResultSet task = (ResultSet) request.getAttribute("task");
    if (task != null) {
%>
<!DOCTYPE html>
<html>
<head>
    <title>Edit Task</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background: linear-gradient(to right, #343a40, #212529);
            color: #f8f9fa;
            display: flex;
            justify-content: center;
            align-items: center;
            min-height: 100vh;
            margin: 0;
            padding: 20px 0;
        }
        .container {
            background: #495057;
            padding: 20px;
            border-radius: 10px;
            box-shadow: 0 0 20px rgba(0, 0, 0, 0.5);
            width: 350px;
        }
        h2 {
            text-align: center;
            color: #f8f9fa;
            font-size: 24px;
            font-weight: bold;
        }
        label {
            font-weight: bold;
            font-size: 16px;
            display: block;
            margin-top: 15px;
        }
        input[type="text"], input[type="date"], input[type="time"], textarea {
            width: calc(100% - 20px);
            padding: 10px;
            margin-top: 5px;
            border: 1px solid #ced4da;
            border-radius: 4px;
            background: #e9ecef;
            font-size: 16px;
        }
        textarea {
            height: 80px;
        }
        input[type="submit"] {
            background: #007bff;
            color: #ffffff;
            padding: 12px;
            border: none;
            border-radius: 4px;
            cursor: pointer;
            margin-top: 20px;
            width: 100%;
            font-size: 18px;
            font-weight: bold;
        }
        input[type="submit"]:hover {
            background: #0056b3;
        }
        a {
            display: block;
            text-align: center;
            margin-top: 20px;
            color: #f8f9fa;
            text-decoration: none;
            font-size: 16px;
            font-weight: bold;
        }
        a:hover {
            text-decoration: underline;
        }
    </style>
</head>
<body>
    <div class="container">
        <h2>Edit Task</h2>
        <form action="EditTaskServlet" method="post">
            <input type="hidden" name="taskId" value="<%= task.getInt("task_id") %>">
            <label for="project">Project:</label>
            <input type="text" id="project" name="project" value="<%= task.getString("project") %>">
            <label for="date">Date:</label>
            <input type="date" id="date" name="date" value="<%= task.getDate("date") %>">
            <label for="startTime">Start Time:</label>
            <input type="time" id="startTime" name="startTime" value="<%= task.getTime("start_time") %>">
            <label for="endTime">End Time:</label>
            <input type="time" id="endTime" name="endTime" value="<%= task.getTime("end_time") %>">
            <label for="category">Category:</label>
            <input type="text" id="category" name="category" value="<%= task.getString("category") %>">
            <label for="description">Description:</label>
            <textarea id="description" name="description"><%= task.getString("description") %></textarea>
            <input type="submit" value="Update Task">
        </form>
        <a href="taskPage.jsp">Back to Task Management</a>
    </div>
</body>
</html>
<%
    }
%>
