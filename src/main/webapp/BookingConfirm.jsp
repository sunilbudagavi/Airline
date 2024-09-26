<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name='viewport' content='width=device-width, initial-scale=1.0'>
    <title>Booking Confirmation</title>
    <link rel="icon" href="images/logo.jpg" type="image/x-icon">
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f4f4f4;
            margin: 0;
            padding: 0;
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
        }
        .confirmation-container {
            background-color: #ffffff;
            border-radius: 10px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
            padding: 20px;
            max-width: 90%;
            width: 800px;
            text-align: center;
            font-size: 20px;
        }
        h1 {
            color: #4CAF50;
            font-size: 30px;
        }
        p {
            font-size: 20px;
            margin: 10px 0;
        }
        .total-amount {
            font-size: 25px;
            color: #333;
            font-weight: bold;
        }
        .li {
            display: inline-block;
            margin-top: 10px;
            padding: 10px 20px;
            background-color: #4CAF50;
            color: white;
            text-decoration: none;
            border-radius: 5px;
            transition: background-color 0.3s ease;
        }
        .li:hover {
            background-color: #45a049;
        }
        .logout-button {
            display: inline-block;
            margin-top: 10px;
            padding: 10px 20px;
            background-color: #f44336;
            color: white;
            text-decoration: none;
            border-radius: 5px;
            transition: background-color 0.3s ease;
        }
        .logout-button:hover {
            background-color: #e53935;
        }

        /* Responsive adjustments */
        @media (max-width: 768px) {
            .confirmation-container {
                padding: 15px;
                font-size: 18px;
            }
            h1 {
                font-size: 24px;
            }
            p {
                font-size: 18px;
            }
            .total-amount {
                font-size: 22px;
            }
        }

        @media (max-width: 480px) {
            .confirmation-container {
                padding: 10px;
                font-size: 16px;
            }
            h1 {
                font-size: 20px;
            }
            p {
                font-size: 16px;
            }
            .total-amount {
                font-size: 18px;
            }
            .li {
                padding: 8px 16px;
                font-size: 14px;
            }
            .logout-button {
                padding: 8px 16px;
                font-size: 14px;
            }
        }
    </style>
</head>
<body>
    <%@ include file="menu.jsp" %>
    <div class="confirmation-container">
        <h1>Booking Confirmed!</h1>
        <p>Thank you for booking your flight.</p>
        <p><strong>Fare Type:</strong> ${param.fareType}</p>
        <p><strong>Number of Tickets:</strong> ${param.numTickets}</p>
        <p class="total-amount"><strong>Total Amount:</strong> $${param.totalAmount}</p>
        <a href="index.jsp" class="li">Back To Book Flight</a>
        <br>
        <a href="logoutServlet" class="logout-button li">Logout</a>
    </div>
</body>
</html>
