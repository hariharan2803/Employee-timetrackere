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
    <title>View All Charts</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background: linear-gradient(135deg, #ff7e5f, #feb47b); /* Gradient background */
            margin: 0;
            padding: 0;
            display: flex;
            justify-content: center;
            align-items: center;
            min-height: 100vh; /* Full viewport height */
            color: #fff; /* Text color */
        }
        .container {
            background: linear-gradient(135deg, #2c3e50, #34495e); /* Darker gradient for the container */
            padding: 30px;
            border-radius: 12px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.3);
            text-align: center;
            width: 100%;
            max-width: 500px; /* Responsive container width */
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
            margin: 0;
        }
        li {
            margin: 15px 0; /* Space between links */
        }
        a {
            display: block;
            background: linear-gradient(135deg, #6a11cb, #2575fc); /* Gradient background for links */
            color: #fff;
            padding: 12px 20px;
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
        <h2>Charts Overview</h2>
        <ul>
            <li><a href="AllDailyChart.jsp">View Daily Chart</a></li>
            <li><a href="AllWeeklyChart.jsp">View Weekly Chart</a></li>
            <li><a href="AllMonthlyChart.jsp">View Monthly Chart</a></li>
        </ul>
        <a href="dashboard.jsp">Back to Dashboard</a>
    </div>
</body>
</html>
