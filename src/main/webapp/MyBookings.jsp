<%@page import="com.AirlineSystemmodal.MyBookings"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="com.AirlineSystemmodal.*" %>
<%@ page import="java.util.List" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name='viewport' content='width=device-width, initial-scale=1.0'>
    <title>My Bookings</title>
    <link rel="icon" href="images/logo.jpg" type="image/x-icon">
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f4f4f4;
            background-size: cover;
            background-position: center;
            margin: 0;
            padding-top: 60px; /* Adds space for the fixed menu */
            align-items: center;
            height: 70vh;
        }
        h2 {
            margin-top: 20px;
            color: #333;
            text-align: center;
        }

        table {
            width: 100%;
            border-collapse: collapse;
            margin: 20px 0;
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

        .no-flights-message {
            text-align: center; /* Center-align the message */
            margin-bottom: 10px; /* Space below the message */
            font-size: 18px; /* Adjust the font size if needed */
            color: #333;
        }

        .footer {
            text-align: center; /* Center-align the footer */
            margin-top: 10px;
        }

        .back-button {
            display: inline-block; /* Display as an inline-block element */
            padding: 10px 20px; /* Add padding for the button */
            background-color: #007bff; /* Background color of the button */
            color: white; /* Text color */
            text-decoration: none; /* Remove underline */
            border-radius: 5px; /* Rounded corners */
            font-size: 16px;
        }

        .back-button:hover {
            background-color: #0056b3;
        }

        @media screen and (max-width: 768px) {
            table {
                width: 100%;
                display: block;
                overflow-x: auto;
                white-space: nowrap;
            }

            th, td {
                padding: 8px;
                font-size: 14px;
            }

            .back-button {
                font-size: 14px;
                padding: 8px 16px;
            }

            body {
                padding-top: 100px; /* Adjust padding for smaller screens */
            }
        }

        @media screen and (max-width: 480px) {
            table {
                font-size: 12px;
            }

            .back-button {
                font-size: 12px;
                padding: 6px 12px;
            }
        }
    </style>
</head>
<body>    
 <%@ include file="menu.jsp" %>
<h2>My Bookings</h2>

<!-- JSP scriptlet to display flight list -->
<%
    List<MyBookings> bookingList = (List<MyBookings>) request.getAttribute("bookingsList");
    if (bookingList != null && !bookingList.isEmpty()) { 
%>
    <table>
        <thead>
            <tr>
                <th>Booking Id</th>
                <th>Flight ID</th>
                <th>Source City</th>
                <th>Destination City</th>
                <th>Passenger Name</th>
                <th>Seat Class</th>
                <th>No of Passengers</th>
                <th>Booking Date</th>
                <th>Flight Date</th>
                <th>Flight Type</th>
                <th>Total Amount</th>
            </tr>
        </thead>
        <tbody>
            <% 
                for (MyBookings book : bookingList) { 
            %>
                <tr>
                    <td><%= book.getBooking_id() %></td>
                    <td><%= book.getFlight_id() %></td>
                    <td><%= book.getSource_city() %></td>
                    <td><%= book.getDestination_city() %></td>
                    <td><%= book.getPassengername() %></td>
                    <td><%= book.getSeatClass()%></td>
                    <td><%= book.getNoOfPassengers() %></td>
                    <td><%= book.getBooking_date() %></td>
                    <td><%= book.getFlight_date() %></td>
                    <td><%= book.getFlight_type() %></td>
                    <td><%= book.getTotal_amount() %></td>
                </tr>
            <% 
                } 
            %>
        </tbody>
    </table>
<% 
    } else { 
%>
    <p class="no-flights-message">Empty List</p>
<% 
    } 
%>
<div class="footer">
    <a href="index.jsp" class="back-button">Back to Book flight</a>
</div>
</body>
</html>
