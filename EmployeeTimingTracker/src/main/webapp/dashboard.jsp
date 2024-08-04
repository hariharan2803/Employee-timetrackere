<%@page import="jakarta.servlet.http.HttpSession"%>
<%@page import="jakarta.servlet.http.HttpServletRequest"%>
<%@page import="jakarta.servlet.http.HttpServletResponse"%>
<%
    HttpSession currentSession = request.getSession(false);
    if (currentSession == null || currentSession.getAttribute("username") == null) {
        response.sendRedirect("login.jsp");
    } else {
        String role = (String) currentSession.getAttribute("role");
%>
<!DOCTYPE html>
<html>
<head>
    <title>Dashboard</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background: linear-gradient(135deg, #2c3e50, #4ca1af);
            margin: 0;
            padding: 0;
            display: flex;
            justify-content: center;
            align-items: center;
            min-height: 100vh;
            color: #fff;
        }
        .container {
            background: rgba(0, 0, 0, 0.8);
            padding: 30px;
            border-radius: 12px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.3);
            text-align: center;
            width: 100%;
            max-width: 400px;
            margin: 20px 0; /* Added margin for spacing */
        }
        h2 {
            margin-bottom: 20px;
            font-size: 24px;
            font-weight: 700;
        }
        a {
            display: block;
            background: linear-gradient(135deg, #4ca1af, #2c3e50);
            color: #fff;
            padding: 12px 25px;
            border-radius: 5px;
            text-decoration: none;
            font-size: 16px;
            font-weight: 600;
            margin: 10px 0; /* Spacing between links */
            transition: background 0.3s, transform 0.3s;
        }
        a:hover {
            background: linear-gradient(135deg, #2c3e50, #4ca1af);
            transform: scale(1.05);
        }
        a:active {
            transform: scale(0.98);
        }
    </style>
</head>
<body>
    <div class="container">
        <h2>Welcome, <%= currentSession.getAttribute("username") %></h2>
        <% if ("Admin".equals(role)) { %>
            <a href="adminPage.jsp">Admin Page</a>
        <% } else { %>
            <a href="taskPage.jsp">Task Management</a>
            <a href="associaterPage.jsp">View Associate</a>
        <% } %>
        <a href="LogoutServlet">Logout</a>
    </div>
</body>
</html>
<%
    }
%>
