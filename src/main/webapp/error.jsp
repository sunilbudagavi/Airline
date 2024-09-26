<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name='viewport' content='width=device-width, initial-scale=1.0'>
    <title>Booking Status</title>
    <link rel="icon" href="images/logo.jpg" type="image/x-icon">
    
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f5f5f5; /* Light grey background */
            margin: 0;
            padding: 0;
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
        }
        .message-container {
            text-align: center;
            padding: 20px;
            border-radius: 8px;
            background-color: #ffffff; /* White background for the message box */
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1); /* Soft shadow */
            max-width: 400px;
            width: 80%;
        }
        p {
            font-size: 18px;
            color: #e74c3c; /* Red color for the message text */
            font-weight: bold;
        }
        .home-button {
            display: inline-block;
            margin-top: 10px;
            padding: 10px 20px;
            background-color: #4CAF50;
            color: white;
            text-decoration: none;
            border-radius: 5px;
            transition: background-color 0.3s ease;
        }
        .home-button:hover {
            background-color: #45a049;
        }

        /* Responsive adjustments */
        @media (max-width: 768px) {
            .message-container {
                padding: 15px;
                width: 90%;
            }
            p {
                font-size: 16px;
            }
            .home-button {
                padding: 8px 16px;
                font-size: 14px;
            }
        }

        @media (max-width: 480px) {
            .message-container {
                padding: 10px;
                width: 95%;
            }
            p {
                font-size: 14px;
            }
            .home-button {
                padding: 8px 12px;
                font-size: 12px;
            }
        }
    </style>
</head>
<body>
    <%@ include file="menu.jsp" %>
    <div class="message-container">
        <p>Not enough Seats Available</p>
        <a href="index.jsp" class="home-button">Home</a>
    </div>
</body>
</html>
