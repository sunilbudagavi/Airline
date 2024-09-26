<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name='viewport' content='width=device-width, initial-scale=1.0'>
<title>Login </title>
<link rel="icon" href="images/logo.jpg" type="image/x-icon">
<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
<link rel="stylesheet" href="alert/dist/sweetalert.css">

    <style>
        body {
            font-family: Arial, sans-serif;
            background-size: cover;
            background-position: center;
            margin: 0;
            padding: 0;
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
            padding-left: 30px;
        }
        .title {
            background-color: #2C3E50;
            color: white;
            padding: 30px 0;
            width: 100%;
            text-align: center;
            font-size: 28px;
            font-weight: bold;
            position: absolute;
            top: 0;
            left: 0;
        }
        .container {
            background-color: rgba(255, 255, 255, 0.9); /* Transparent background */
            padding: 40px;
            border-radius: 8px;
            box-shadow: 0 0 5px rgba(0, 0, 0, 0.2);
            width: 90%;
            max-width: 400px;
            text-align: center;
            margin-top: 12%;
            box-sizing: border-box;
        }
        h2 {
            color: #000000;
            font-weight: bold;
            margin-bottom: 20px;
        }
        label {
            display: block;
            margin: 10px 0 5px;
            color: #000000;
            font-weight: bold;
        }
        input[type="email"], input[type="password"],input[type="text"] {
            width: 100%;
            padding: 8px;
            margin-bottom: 10px;
            border: 1px solid #cccccc;
            border-radius: 4px;
            box-sizing: border-box;
        }
        
        .checkbox {
            margin-bottom: 20px;
            display: flex;
            align-items: center;
            font-size: 14px;
        }
        
        /* Style the checkbox to be consistent on different devices */
        .checkbox input[type="checkbox"] {
            margin-right: 10px;
        }

        input[type="submit"] {
            width: 100%;
            background-color: #4CAF50;
            color: white;
            padding: 10px;
            border: none;
            border-radius: 4px;
            cursor: pointer;
            margin-bottom: 10px;
            transition: background-color 0.3s ease;
        }
        input[type="submit"]:hover {
            background-color: #45a049;
        }
        .options {
            margin-top: 15px;
        }
        .options a {
            text-decoration: none;
            color: #00f808;
            font-weight: bold;
            margin: 0 10px;
        }
        .options a:hover {
            color: #45a049;
        }

        /* Responsive styles */
        @media (max-width: 600px) {
            .container {
                padding: 20px;
                margin-top: 15%;
            }

            .title {
                font-size: 22px;
                padding: 20px 0;
            }

            input[type="submit"] {
                padding: 12px;
            }

            .options a {
                font-size: 14px;
            }

            .checkbox {
                font-size: 12px;
            }
        }
    </style>
</head>
<body>

    <div class="title">
        Welcome to Airline Reservation System
    </div>
    <div class="container">
        <h2>Login User</h2>
        <form action="LoginiValidationServlet" method="post">
        <input type="hidden" id="status" value="<%= request.getAttribute("status") %>">
            <label for="email">Email:</label>
            <input type="email" name="email" required>
            
            <label for="password">Password:</label>
            <input type="password" name="password" id="password" required>
            
            <!-- Show Password Checkbox -->
            <div class="checkbox">
                <input type="checkbox" id="showPassword" onclick="togglePassword()"> Show Password
            </div>
            
            <input type="submit" value="Sign In">
        </form>
        
        <!-- Sign In, Sign Up, and Forgot Password Options -->
        <div class="options">
            <a href="register.jsp">Sign Up</a> <!-- Link to the registration page -->
            <a href="ForgotPassword.jsp">Forgot Password?</a> <!-- Link to forgot password page -->
        </div>
    </div>
    
    <script type="text/javascript">
        var status = document.getElementById("status").value;
        if (status == "failed") {
            swal("Sorry", "Wrong username or password", "error");
        }
        if (status == "ok") {
            swal("Done", "Logout Successfully", "success");
        }
        if (status == "okay") {
            swal("Done", "Password Changed", "success");
        }
        if (status == "Reset") {
            swal("Done", "Password Changed", "success");
        }
        
        function togglePassword() {
            var passwordField = document.getElementById("password");
            if (passwordField.type === "password") {
                passwordField.type = "text";  // Show password
            } else {
                passwordField.type = "password";  // Hide password
            }
        }
    </script>
    
</body>
</html>
