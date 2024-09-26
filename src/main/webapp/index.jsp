<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
    <link rel="icon" href="images/logo.jpg" type="image/x-icon">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/flatpickr/dist/flatpickr.min.css">
    <script src="https://cdn.jsdelivr.net/npm/flatpickr"></script>
    
    <style>
        body {
            font-family: Arial, sans-serif;
            background-size: cover;
            background-position: center;
            margin: 0;
            padding: 0;
            height: 100vh;
            display: flex;
            flex-direction: column;
            align-items: center;
        }
        
        .container {
            background-color: rgba(255, 255, 255, 0.8);
            padding: 100px;
            border-radius: 8px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.2);
            width: 300px;
            text-align: center;
            margin-top: 60px; /* Adjust margin to make space for the navbar */
            transition: margin-top 0.5s ease; /* Smooth transition for moving container */
        }
    
        h2 {
            color: #333333;
            font-weight: bold;
        }
        label {
            display: block;
            margin: 10px 0 5px;
            color: #333333;
            font-weight: bold;
        }
        input[type="text"], input[type="date"], select {
            width: 100%;
            padding: 8px;
            margin-bottom: 10px;
            border: 1px solid #cccccc;
            border-radius: 4px;
            box-sizing: border-box;
        }
        input[type="submit"] {
            width: 100%;
            background-color: #4CAF50;
            color: white;
            padding: 10px;
            border: none;
            border-radius: 4px;
            cursor: pointer;
            transition: background-color 0.3s, transform 0.3s;
        }
        input[type="submit"]:hover {
            background-color: #45a049;
            transform: scale(1.05);
        }
    </style>
</head>
<body>
    <%@ include file="menu.jsp" %> 

    <div class="container">
        <h2>Flight Booking Form</h2>
        <form id="bookingForm" action="HomeServlet" method="post">
            <label for="source_city">Source City:</label>
            <input type="text" name="source_city" id="sourceCity" list="sourceCityList" required>
            <datalist id="sourceCityList">
            <!-- Options will be populated here -->
        	</datalist>

            <label for="destination_city">Destination City:</label>
            <input type="text" name="destination_city" id="destinationCity" list="destinationCityList" required>
			 <datalist id="destinationCityList">
            <!-- Options will be populated here -->
        	</datalist>
        	
            <label for="travel_date">Travel Date:</label>
            <input type="text" name="travel_date" id="date" required>

            <label for="travel_type">Travel Type:</label>
            <select name="travel_type" required>
                <option value="domestic">Domestic</option>
                <option value="international">International</option>
            </select>

            <input type="submit" value="Search Flights">
        </form>
    </div>

    <script>
    document.addEventListener('DOMContentLoaded', function() {
        var datepicker = flatpickr("#date", {
            dateFormat: "Y-m-d",
            minDate: "today",
            disable: [], // Initially, no dates are disabled
        });

        function populateDatalist(listId, cities) {
            var datalist = document.getElementById(listId);
            cities.forEach(function(city) {
                var option = document.createElement('option');
                option.value = city;
                datalist.appendChild(option);
            });
        }

        function fetchAvailableDates() {
            var sourceCity = document.getElementById('sourceCity').value;
            var destinationCity = document.getElementById('destinationCity').value;

            if (sourceCity && destinationCity) {
                fetch('GetAvailableDates', {
                    method: 'POST',
                    headers: {
                        'Content-Type': 'application/json'
                    },
                    body: JSON.stringify({
                        sourceCity: sourceCity,
                        destinationCity: destinationCity
                    })
                })
                .then(response => response.json())
                .then(data => {
                    // Update Flatpickr with unavailable dates
                    datepicker.set('disable', data.unavailableDates.map(date => new Date(date)));
                })
                .catch(error => console.error('Error fetching available dates:', error));
            } else {
                // Clear disabled dates if either field is empty
                datepicker.set('disable', []);
            }
        }

        // Event listeners to update dates when cities are changed
        document.getElementById('sourceCity').addEventListener('change', fetchAvailableDates);
        document.getElementById('destinationCity').addEventListener('change', fetchAvailableDates);

        // Populate datalists with city options
        fetch('GetCities', {
            method: 'POST',
            headers: {
                'Content-Type': 'application/json'
            }
        })
        .then(response => response.json())
        .then(data => {
            populateDatalist("sourceCityList", data.sourceCities);
            populateDatalist("destinationCityList", data.destinationCities);
        })
        .catch(error => console.error('Error fetching city data:', error));
    });
    </script>
    
</body>
</html>
