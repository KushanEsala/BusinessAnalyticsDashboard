<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Welcome to Our Application</title>
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
            display: flex;
            align-items: center;
            justify-content: center;
            height: 100vh;
            color: #333;
            overflow: hidden;
        }

        /* Container Styling */
        .container {
            background-color: #ffffff;
            padding: 40px 30px;
            border-radius: 10px;
            box-shadow: 0px 10px 20px rgba(0, 0, 0, 0.15);
            text-align: center;
            max-width: 400px;
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
            width: 100%;
            padding: 12px;
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
    
    <%
    String message = request.getParameter("message");
    if (message != null) {
%>
        <p style="color: red;"><%= message %></p>
<%
    }
%>
    
    
    <div class="container">
        <h1>Welcome to ABC Enterprises</h1>
        <p>Your gateway to a seamless experience. Sign up to get started or login if you already have an account.</p>

        <!-- Sign Up and Login Buttons -->
        <a href="signup.jsp" class="btn">Sign Up</a>
        <a href="login.jsp" class="btn btn-secondary">Login</a>

        <!-- Footer Links -->
        <footer>
            <p>Need help? <a href="contact.jsp">Contact Support</a></p>
        </footer>
    </div>
</body>
</html>
