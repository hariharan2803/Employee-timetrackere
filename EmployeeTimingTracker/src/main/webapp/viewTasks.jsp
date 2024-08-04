<%@page import="jakarta.servlet.http.HttpSession"%>
<%@page import="java.sql.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    HttpSession currentSession = request.getSession(false);
    if (currentSession == null || currentSession.getAttribute("username") == null) {
        response.sendRedirect("login.jsp");
        return; // Prevent further processing if the user is not logged in
    }

    String username = (String) currentSession.getAttribute("username");
    int userId = 0;
    String dbUrl = "jdbc:mysql://localhost:3306/EmployeeTaskTracker";
    String dbUser = "root";
    String dbPass = "Hari@108";

    // Query to get user_id from username
    try {
        Class.forName("com.mysql.cj.jdbc.Driver");
        Connection con = DriverManager.getConnection(dbUrl, dbUser, dbPass);
        PreparedStatement ps = con.prepareStatement("SELECT user_id FROM Users WHERE username=?");
        ps.setString(1, username);
        ResultSet rs = ps.executeQuery();
        if (rs.next()) {
            userId = rs.getInt("user_id");
        }
        rs.close();
        ps.close();
        con.close();
    } catch (Exception e) {
        e.printStackTrace();
    }
%>
<!DOCTYPE html>
<html>
<head>
    <title>View My Tasks</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background: linear-gradient(135deg, #2193b0, #6dd5ed); /* Gradient background */
            margin: 0;
            padding: 0;
            display: flex;
            justify-content: center;
            align-items: center;
            min-height: 100vh; /* Full viewport height */
            color: #fff; /* Text color */
        }
        .container {
            background: linear-gradient(135deg, #2c3e50, #4ca1af); /* Darker gradient for the container */
            padding: 30px;
            border-radius: 12px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.3);
            text-align: center;
            width: 100%;
            max-width: 800px; /* Responsive container width */
            margin: 20px; /* Added margin for spacing */
        }
        h2 {
            color: #fff; /* White text color */
            margin-bottom: 20px;
            font-size: 24px;
            font-weight: 700; /* Bold text */
        }
        table {
            width: 100%;
            border-collapse: collapse;
            margin: 20px 0; /* Margin around the table */
        }
        th, td {
            padding: 10px;
            border: 1px solid #ddd;
            text-align: left;
            color: #fff;
        }
        th {
            background: linear-gradient(135deg, #ff7e5f, #feb47b); /* Gradient header background */
            color: #fff;
        }
        a {
            display: inline-block;
            background: linear-gradient(135deg, #6a11cb, #2575fc); /* Gradient background for links */
            color: #fff;
            padding: 10px 20px;
            border-radius: 5px;
            text-decoration: none;
            font-size: 16px;
            font-weight: 600;
            transition: background 0.3s, transform 0.3s; /* Smooth transitions */
        }
        a:hover {
            background: linear-gradient(135deg, #2575fc, #6a11cb); /* Reverse gradient on hover */
            transform: scale(1.05); /* Slightly enlarge link on hover */
        }
        a:active {
            transform: scale(0.98); /* Slightly shrink link on click */
        }
    </style>
</head>
<body>
    <div class="container">
        <h2>My Tasks</h2>
        <table>
            <tr>
                <th>Project</th>
                <th>Date</th>
                <th>Start Time</th>
                <th>End Time</th>
                <th>Category</th>
                <th>Description</th>
                <th>Actions</th>
            </tr>
            <%
                try {
                    Connection con = DriverManager.getConnection(dbUrl, dbUser, dbPass);
                    PreparedStatement ps = con.prepareStatement("SELECT * FROM Tasks WHERE employee_id=?");
                    ps.setInt(1, userId);
                    ResultSet rs = ps.executeQuery();
                    while (rs.next()) {
            %>
            <tr>
                <td><%= rs.getString("project") %></td>
                <td><%= rs.getDate("date") %></td>
                <td><%= rs.getTime("start_time") %></td>
                <td><%= rs.getTime("end_time") %></td>
                <td><%= rs.getString("category") %></td>
                <td><%= rs.getString("description") %></td>
                <td>
                    <a href="EditTaskServlet?taskId=<%= rs.getInt("task_id") %>">Edit</a>
                    <a href="DeleteTaskServlet?taskId=<%= rs.getInt("task_id") %>">Delete</a>
                </td>
            </tr>
            <%
                    }
                    rs.close();
                    ps.close();
                    con.close();
                } catch (Exception e) {
                    e.printStackTrace();
                }
            %>
        </table>
        <a href="dashboard.jsp">Back to Dashboard</a>
    </div>
</body>
</html>
