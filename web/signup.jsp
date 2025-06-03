<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Sign Up</title>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css">
    <style>
        body {
            background: linear-gradient(135deg, #4A90E2, #9013FE);
            height: 100vh;
            display: flex;
            align-items: center;
            justify-content: center;
        }

        .signup-container {
            background-color: #ffffff;
            padding: 40px;
            border-radius: 10px;
            box-shadow: 0px 10px 20px rgba(0, 0, 0, 0.15);
            max-width: 400px;
            width: 100%;
        }

        .signup-container h2 {
            margin-bottom: 20px;
            color: #4A90E2;
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
    <div class="signup-container">
        <h2>Create Account</h2>
        <form action="SignupController" method="Post" >
             <div class="form-group">
                <label for="email">Email</label>
                <input type="email" class="form-control" id="email" name="email" required>
                <small class="form-text text-muted">Enter your email</small>
            </div>
            <div class="form-group">
                <label for="username">Username</label>
                <input type="text" class="form-control" id="username" name="username" required>
                <small class="form-text text-muted">Choose a unique username.</small>
            </div>
            <div class="form-group">
                <label for="password">Password</label>
                <input type="password" class="form-control" id="password" name="password" required>
                <small class="form-text text-muted">Your password must be 8-20 characters long.</small>
            </div>
            <div class="form-group">
                <label for="confirmPassword">Confirm Password</label>
                <input type="password" class="form-control" id="confirmPassword" required>
                <small class="form-text text-muted">Please confirm your password.</small>
                <div id="passwordError" class="text-danger" style="display:none;">Passwords do not match!</div>
            </div>
            <button type="submit" class="btn btn-custom btn-block">Sign Up</button>
            <p class="text-center mt-3">Already have an account? <a href="login.jsp">Login</a></p>
        </form>
    </div>

    <script>
        function validateForm() {
            const password = document.getElementById("password").value;
            const confirmPassword = document.getElementById("confirmPassword").value;
            const passwordError = document.getElementById("passwordError");

            if (password !== confirmPassword) {
                passwordError.style.display = "block";
                return false;
            }
            passwordError.style.display = "none";
            return true;
        }
    </script>

    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script ```html
</body>
</html>