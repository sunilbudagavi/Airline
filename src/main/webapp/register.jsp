<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name='viewport' content='width=device-width, initial-scale=1.0'>
    <title>Register User</title>
    <link rel="icon" href="images/logo.jpg" type="image/x-icon">
    <script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
    <link rel="stylesheet" href="https://unpkg.com/sweetalert/dist/sweetalert.css">

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
            min-height: 100vh;
            box-sizing: border-box;
        }
        .container {
            background-color: rgba(255, 255, 255, 0.9);
            padding: 20px;
            border-radius: 8px;
            box-shadow: 0 0 5px rgba(0, 0, 0, 0.2);
            width: 90%;
            max-width: 400px;
            box-sizing: border-box;
            margin: 10px;
        }
        h2 {
            text-align: center;
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
        input[type="text"], input[type="email"], input[type="password"] {
            width: 100%;
            padding: 8px;
            margin-bottom: 10px;
            border: 1px solid #cccccc;
            border-radius: 4px;
            box-sizing: border-box;
        }
        .checkbox {
            margin-right: 180px;
            margin-bottom: 20px;
            text-align: left; /* Align checkbox to the left */
        }
        input[type="submit"] {
            width: 100%;
            background-color: #4CAF50;
            color: white;
            padding: 10px;
            border: none;
            border-radius: 4px;
            cursor: pointer;
            transition: background-color 0.3s ease;
        }
        input[type="submit"]:hover {
            background-color: #45a049;
        }
        .message {
            text-align: center;
            margin-top: 10px;
            color: #333333;
        }
        .back-to-login {
            text-align: center;
            margin-top: 15px;
        }
        .back-to-login a {
            text-decoration: none;
            color: blue;
            font-weight: bold;
            font-size: 16px;
            transition: color 0.3s ease, border-bottom 0.3s ease;
            border-bottom: 2px solid transparent;
            padding-bottom: 2px;
        }
        .back-to-login a:hover {
            color: #45a049; /* Change color on hover */
            border-bottom: 2px solid #45a049; /* Underline effect on hover */
        }
        .back-to-login a:active {
            color: #2e7031; /* Darker shade when active */
        }

        /* Responsive styles */
        @media (max-width: 600px) {
            .container {
                padding: 15px;
                max-width: 100%;
            }

            input[type="submit"] {
                padding: 12px;
            }

            .back-to-login a {
                font-size: 14px;
            }

            /* Responsive styles for the checkbox */
            .checkbox {
                margin-right: 0;  /* Remove margin-right on smaller screens */
            }
        }
    </style>
</head>
<body>
    <div class="container">
        <h2>Register User</h2>
        <form action="RegistrationServlet" method="post">
            <input type="hidden" id="status" value="<%= request.getAttribute("status") %>">
            <label for="first_name">First Name:</label>
            <input type="text" name="first_name" required>
            
            <label for="last_name">Last Name:</label>
            <input type="text" name="last_name" required>
            
            <label for="email">Email:</label>
            <input type="email" name="email" required>
            
            <label for="password">Password:</label>
            <input type="password" name="password" id="password" required>
            <div class="checkbox">
                <input type="checkbox" id="showPassword" onclick="togglePassword()"> Show Password
            </div>
            
            <label for="contact">Contact Number:</label>
            <input type="text" name="contact" required>
            
            <input type="submit" value="Register">
        </form>
        
        <div class="back-to-login">
            <a href="login.jsp">I am already a member</a>
        </div>
    </div>
    
    <script type="text/javascript">
        var status = document.getElementById("status").value;
        if (status == "success") {
            swal("Congrats", "Account Created Successfully", "success");
        }
        if(status == "Exist") {
            swal("Sorry", "Email is already existed", "error");
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
