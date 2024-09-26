<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="com.AirlineSystemmodal.Flight" %>
<%@ page import="java.util.List" %>
<% 
if(session.getAttribute("email") == null || session.getAttribute("PassKey") == null){
    response.sendRedirect("login.jsp");
}
%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name='viewport' content='width=device-width, initial-scale=1.0'>
    <title>Flight Booking</title>
    <style>


/* Page-specific styles */
body {
    font-family: Arial, sans-serif;
    background-color: #f4f4f4;
    margin: 0;
    padding: 0;
}

h2 {
    text-align: center;
    color: #333333;
    font-weight: bold;
    margin-top: 20px;
}

/* Responsive table container */
.table-container {
    width: 100%;
    overflow-x: auto; /* Enable horizontal scrolling */
    margin: 20px auto;
}

/* Table styles */
table {
    width: 100%;
    border-collapse: collapse;
    box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
    min-width: 600px; /* Ensure table has a minimum width */
}

th, td {
    padding: 12px;
    border: 1px solid #ddd;
    text-align: center;
}

th {
    background-color: #4CAF50;
    color: white;
    font-size: 16px;
}

tr:nth-child(even) {
    background-color: #f2f2f2;
}

tr:hover {
    background-color: #ddd;
}

/* Flight Booking Form Container */
.container1 {
    background-color: rgba(255, 255, 255, 0.8); /* Semi-transparent background */
    padding: 20px;
    border-radius: 8px;
    box-shadow: 0 0 10px rgba(0, 0, 0, 0.2);
    margin: 30px auto;
    max-width: 400px;
}

/* Form styles */
form {
    max-width: 400px;
    margin: 20px auto;
    padding: 20px;
    border: 1px solid #ddd;
    border-radius: 8px;
    background-color: #f9f9f9;
    box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
    font-family: Arial, sans-serif;
}

form label {
    display: block;
    margin-bottom: 5px;
    font-weight: bold;
    color: #333;
}

form input[type="number"],
form input[type="text"],
form input[type="radio"] {
    margin-bottom: 15px;
    padding: 8px;
    border: 1px solid #ccc;
    border-radius: 4px;
    width: 100%;
    box-sizing: border-box;
}

form input[type="radio"] {
    width: auto;
    margin-right: 5px;
}

form input[type="submit"] {
    background-color: #007bff;
    color: #fff;
    padding: 10px 15px;
    border: none;
    border-radius: 5px;
    cursor: pointer;
    font-size: 16px;
    width: 100%;
    box-sizing: border-box;
    transition: background-color 0.3s ease;
}

form input[type="submit"]:hover {
    background-color: #0056b3;
}

/* No flights message */
.no-flights-message {
    color: #e74c3c; /* Red color */
    font-size: 20px;
    margin-top: 30px;
    padding: 15px;
    background-color: #f8d7da; /* Light red background */
    border: 1px solid #f5c6cb; /* Slightly darker red border */
    border-radius: 8px;
    max-width: 400px;
    margin-left: auto;
    margin-right: auto;
    font-weight: bold;
    box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1); /* Subtle shadow effect */
    text-align: center; /* Center-align the text */
}

/* Media Queries */
@media (max-width: 768px) {
    h2 {
        font-size: 24px;
        margin-top: 10px; /* Adjust for smaller screens */
    }

    .container1,
    form,
    .no-flights-message {
        padding: 15px;
        margin: 10px auto;
    }

    table {
        font-size: 14px; /* Adjust font size for smaller screens */
    }

    form input[type="submit"] {
        font-size: 14px;
        padding: 8px 12px;
    }
}

@media (max-width: 480px) {
    h2 {
        font-size: 20px;
    }

    form input[type="submit"] {
        font-size: 12px;
        padding: 6px 10px;
    }

    .no-flights-message {
        font-size: 18px;
        padding: 10px;
    }
}

    </style>
</head>
<body>
     <%@ include file="menu.jsp" %>

    <div class="container">
        <h2>Flight Details</h2>
        <!-- JSP scriptlet to display flight list -->
        <%
            List<Flight> flightList = (List<Flight>) request.getAttribute("flightList");
            if (flightList != null && !flightList.isEmpty()) { 
        %>
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
                            <td><%= flight.getDeparture_time()%></td>
                            <td><%= flight.getArrival_time() %></td>
                            <td><%= flight.getEconomy_fare() %></td>
                            <td><%= flight.getBusiness_fare() %></td>
                            <td><%= flight.getSeats_Available() %></td>
                            <td><%= flight.getFlight_type() %></td>
                        </tr>
                    <% 
                        } 
                    %>
                </tbody>
            </table>
            </div>
            <div class="container1">
                <h2>Flight Booking Form</h2>
                <form action="BookFlightServlet" method="post">
                    
                    <label for="fareType">Select Fare</label>
                    <label for="business">Business</label>
                    <input type="radio" id="business" name="fareType" value="Business" required>
                    <label for="economy">Economy</label>
                    <input type="radio" id="economy" name="fareType" value="Economy">
                    
                    <label for="numTickets">Enter no of Tickets:</label>
                    <input type="number" id="numTickets" name="numTickets" min=1 max=9 required>
                    
                    <input type="hidden" name="flightId" value="<%= flightList.get(0).getFlightId() %>">
                    <input type="hidden" name="flight_type" value="<%= flightList.get(0).getFlight_type() %>">
                    <input type="hidden" name="source_city" value="<%= flightList.get(0).getSource_city() %>">
                    <input type="hidden" name="destination_city" value="<%= flightList.get(0).getDestination_city() %>">
                    
                    <input type="submit" value="Book Now"><br>
                </form>
            </div>
        <% 
            } else { 
        %>
            <div class="no-flights-message">
                <h2>No flights available.</h2>
                <a href="index.jsp">Go to Home</a>
            </div>
        <% 
            } 
        %>
    </div>
</body>
</html>
