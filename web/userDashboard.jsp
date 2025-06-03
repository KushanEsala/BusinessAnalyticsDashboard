<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page session="true" %>
<%
    String role = (String) session.getAttribute("role");
    if (role == null || !"user".equalsIgnoreCase(role)) {
        response.sendRedirect("login.jsp"); // Redirect to login if not authorized
    }
%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>User Dashboard</title>
    <style>
        /* General Reset */
        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
        }

        /* Body Styling */
        body {
            font-family: 'Arial', sans-serif;
            background: linear-gradient(135deg, #4A90E2, #9013FE);
            color: #333;
        }

        /* Navbar Styling */
        nav {
            background-color: #4A90E2;
            padding: 15px;
            display: flex;
            justify-content: space-between;
            align-items: center;
            position: sticky;
            top: 0;
            z-index: 10;
        }

        nav a {
            text-decoration: none;
            color: white;
            margin: 0 15px;
            font-weight: bold;
            font-size: 16px;
        }

        nav a:hover {
            color: #9013FE;
        }

        .navbar-right {
            display: flex;
            align-items: center;
        }

        /* Container Styling */
        .container {
            margin-top: 80px;
            text-align: center;
            padding: 40px 30px;
            background-color: #ffffff;
            border-radius: 10px;
            box-shadow: 0px 10px 20px rgba(0, 0, 0, 0.15);
            max-width: 1000px;
            margin-left: auto;
            margin-right: auto;
            animation: fadeIn 1.5s ease;
        }

        /* Header Styling */
        h1 {
            font-size: 28px;
            margin-bottom: 10px;
            color: #4A90E2;
        }

        p {
            color: #666;
            font-size: 16px;
            margin-bottom: 20px;
        }

        /* Button Styling */
        .btn {
            display: inline-block;
            padding: 12px 30px;
            margin: 10px 0;
            font-size: 18px;
            font-weight: bold;
            color: white;
            background-color: #4A90E2;
            border: none;
            border-radius: 5px;
            cursor: pointer;
            transition: background-color 0.3s ease;
            text-decoration: none;
        }

        .btn:hover {
            background-color: #357ABD;
        }

        /* Secondary Button */
        .btn-secondary {
            background-color: #9013FE;
        }

        .btn-secondary:hover {
            background-color: #6A0EB5;
        }

        /* Fade-In Animation */
        @keyframes fadeIn {
            0% {
                opacity: 0;
                transform: translateY(-20px);
            }
            100% {
                opacity: 1;
                transform: translateY(0);
            }
        }

        /* Footer Styling */
        footer {
            margin-top: 20px;
            font-size: 14px;
            color: #aaa;
        }

        footer a {
            color: #4A90E2;
            text-decoration: none;
            font-weight: bold;
        }

        footer a:hover {
            text-decoration: underline;
        }
    </style>
</head>
<body>
    
    <!-- Navbar -->
    <nav>
        <a href="sales.jsp">Sales</a>
        <a href="product.jsp">Products</a>
        <a href="performance.jsp">Performance</a>
        <a href="employee.jsp">Employees</a>
        <div class="navbar-right">
            <a href="Logoutcontroller" class="btn btn-secondary">Logout</a>
        </div>
    </nav>

    <!-- Dashboard Content -->
    <div class="container">
        <h1>Welcome, User!</h1>
        <p>Manage and view your sales, products, performance, and employees.</p>
        
        <!-- You can add other sections here for the user to interact with -->

        <footer>
            <p>Need help? <a href="contact.jsp">Contact Support</a></p>
        </footer>
    </div>
</body>
</html>
