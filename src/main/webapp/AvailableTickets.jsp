<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="com.AirlineSystemmodal.Flight" %>
<%@ page import="java.util.List" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0"> <!-- Viewport meta tag for responsiveness -->
    <title>View Flights</title>
    <link rel="icon" href="images/logo.jpg" type="image/x-icon">
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f4f4f4;
            margin: 0;
            padding: 0;
            display: flex;
            flex-direction: column;
            align-items: center;
        }
        
        h2 {
            margin-top: 80px; /* Adjusted to accommodate the navbar */
            color: #333;
        }

        .table-container {
            width: 100%; /* Full width on smaller screens */
            max-width: 90%; /* Restrict maximum width */
            overflow-x: auto; /* Add horizontal scroll if needed */
            margin: 20px 0;
        }

        table {
            width: 100%; /* Full width of the container */
            border-collapse: collapse;
            background-color: #fff;
            border-radius: 8px;
            box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1);
        }

        th, td {
            padding: 12px;
            border: 1px solid #ddd;
            text-align: center;
        }

        th {
            background-color: #4CAF50;
            color: white;
        }

        tr:nth-child(even) {
            background-color: #f9f9f9;
        }

        tr:hover {
            background-color: #f1f1f1;
        }

        form {
            margin: 0;
        }

        input[type="submit"] {
            background-color: #4CAF50;
            color: white;
            border: none;
            padding: 8px 16px;
            text-align: center;
            text-decoration: none;
            display: inline-block;
            font-size: 14px;
            margin: 4px 2px;
            cursor: pointer;
            border-radius: 4px;
        }

        input[type="submit"]:hover {
            background-color: #45a049;
        }

        .no-flights-message {
            font-size: 30px;
            color: #ff0000;
            font-weight: bold;
            margin: 80px;
        }

        .footer {
            margin: 20px;
        }

        .back-button {
            background-color: #4CAF50;
            color: white;
            border: none;
            padding: 8px 16px;
            text-align: center;
            text-decoration: none;
            display: inline-block;
            font-size: 14px;
            margin: 4px 2px;
            cursor: pointer;
            border-radius: 4px;
        }

        .back-button:hover {
            background-color: #45a049;
        }

        /* Media Queries */
        @media (max-width: 768px) {
            h2 {
                font-size: 24px;
                margin-top: 60px; /* Adjusted for smaller screens */
            }

            .footer {
                text-align: center;
            }
        }

        @media (max-width: 480px) {
            h2 {
                font-size: 20px;
                margin-top: 50px; /* Further adjustment for very small screens */
            }

            input[type="submit"] {
                padding: 6px 12px;
                font-size: 12px;
            }

            .no-flights-message {
                font-size: 24px;
                margin: 40px;
            }
        }
    </style>
</head>
<body>
    <%@ include file="menu.jsp" %>
    <!-- JSP scriptlet to display flight list -->
    <%
        List<Flight> flightList = (List<Flight>) request.getAttribute("flightList");
        if (flightList != null && !flightList.isEmpty()) { 
    %>
        <h2>Available Flights</h2>
        <div class="table-container">
            <table>
                <thead>
                    <tr>
                        <th>Flight ID</th>
                        <th>Source City</th>
                        <th>Destination City</th>
                        <th>Departure Time</th>
                        <th>Arrival Time</th>
                        <th>Economy Fare</th>
                        <th>Business Fare</th>
                        <th>Seats Available</th>
                        <th>Flight Type</th>
                        <th>Booking</th>
                    </tr>
                </thead>
                <tbody>
                    <% 
                        for (Flight flight : flightList) { 
                    %>
                        <tr>
                            <td><%= flight.getFlightId() %></td>
                            <td><%= flight.getSource_city() %></td>
                            <td><%= flight.getDestination_city() %></td>
                            <td><%= flight.getDeparture_time() %></td>
                            <td><%= flight.getArrival_time() %></td>
                            <td><%= flight.getEconomy_fare() %></td>
                            <td><%= flight.getBusiness_fare() %></td>
                            <td><%= flight.getSeats_Available() %></td>
                            <td><%= flight.getFlight_type() %></td>
                            <td>
                                <form action="BookNowServlet" method="post">
                                    <input type="hidden" name="flightId" value="<%= flight.getFlightId() %>">
                                    <input type="submit" value="Book Now"> 
                                </form>
                            </td>
                        </tr>
                    <% 
                        } 
                    %>
                </tbody>
            </table>
        </div>
    <% 
        } else { 
    %>
        <p class="no-flights-message">No flights available.</p>
    <% 
        } 
    %>

    <div class="footer">
        <a href="index.jsp" class="back-button">Back to Book Flight</a>
    </div>
</body>
</html>
