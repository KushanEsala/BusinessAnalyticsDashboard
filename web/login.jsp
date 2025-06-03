<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Login</title>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css">
    <style>
        body {
            background: linear-gradient(135deg, #4A90E2, #9013FE);
            height: 100vh;
            display: flex;
            justify-content: center;
            align-items: center;
        }
        .login-container {
            background: #ffffff;
            padding: 40px;
            border-radius: 10px;
            box-shadow: 0px 10px 20px rgba(0, 0, 0, 0.15);
            max-width: 400px;
            width: 100%;
        }
        .login-container h2 {
            color: #4A90E2;
            margin-bottom: 20px;
        }
        .btn-custom {
            background-color: #4A90E2;
            color: white;
        }
        .btn-custom:hover {
            background-color: #357ABD;
        }
    </style>
</head>
<body>
    <div class="login-container">
        <h2>Login to Your Account</h2>

        <form action="Logincontroller" method="Post">
            <div class="form-group">
                <label for="username">Username</label>
                <input type="text" class="form-control" id="username" name="username" placeholder="Username" required />
            </div>
            <div class="form-group">
                <label for="password">Password</label>
                <input type="password" class="form-control" id="password" name="password" placeholder="Password" required />
            </div>
            <button type="submit" class="btn btn-custom btn-block">Login</button>
            <p class="text-center mt-3">Don't have an account? <a href="signup.jsp">Sign Up</a></p>
        </form>
    </div>

    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
</body>
</html>
