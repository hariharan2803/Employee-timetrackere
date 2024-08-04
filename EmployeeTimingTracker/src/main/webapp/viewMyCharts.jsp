<%@page import="jakarta.servlet.http.HttpSession"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    HttpSession currentSession = request.getSession(false);
    if (currentSession == null || currentSession.getAttribute("username") == null) {
        response.sendRedirect("login.jsp");
        return; // Prevent further processing if the user is not logged in
    }
%>
<!DOCTYPE html>
<html>
<head>
    <title>View My Charts</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background: url('images/chart-BG.jpg') no-repeat center center fixed;
            background-size: cover; /* Cover the entire page with the background image */
            margin: 0;
            padding: 0;
            display: flex;
            justify-content: center;
            align-items: center;
            min-height: 100vh; /* Full viewport height */
            color: #fff; /* Text color */
        }
        .container {
            background: rgba(0, 0, 0, 0.8); /* Semi-transparent black background for better contrast */
            padding: 30px;
            border-radius: 12px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.3);
            text-align: center;
            width: 100%;
            max-width: 400px; /* Responsive container width */
            margin: 20px; /* Added margin for spacing */
        }
        h2 {
            color: #fff; /* White text color */
            margin-bottom: 20px;
            font-size: 24px;
            font-weight: 700; /* Bold text */
        }
        ul {
            list-style-type: none;
            padding: 0;
        }
        li {
            margin: 10px 0; /* Space between links */
        }
        a {
            display: block;
            background: linear-gradient(135deg, #f44336, #b71c1c); /* Gradient background */
            color: #fff;
            padding: 12px 25px;
            border-radius: 5px;
            text-decoration: none;
            font-size: 16px;
            font-weight: 600;
            transition: background 0.3s, transform 0.3s; /* Smooth transitions */
        }
        a:hover {
            background: linear-gradient(135deg, #b71c1c, #f44336); /* Reverse gradient on hover */
            transform: scale(1.05); /* Slightly enlarge link on hover */
        }
        a:active {
            transform: scale(0.98); /* Slightly shrink link on click */
        }
    </style>
</head>
<body>
    <div class="container">
        <h2>My Charts</h2>
        <ul>
            <li><a href="dailyChart.jsp">View Daily Chart</a></li>
            <li><a href="weeklyChart.jsp">View Weekly Chart</a></li>
            <li><a href="monthlyChart.jsp">View Monthly Chart</a></li>
        </ul>
        <a href="dashboard.jsp">Back to Dashboard</a>
    </div>
</body>
</html>