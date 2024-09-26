<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name='viewport' content='width=device-width, initial-scale=1.0'>
<title>Responsive Navbar</title>
<link rel="icon" href="images/logo.jpg" type="image/x-icon">
<style type="text/css">
    .navbar {
        width: 100%;
        background-color: #333;
        position: fixed;
        top: 0;
        left: 0;
        z-index: 1000;
        display: flex;
        justify-content: space-between;
        align-items: center;
        padding: 0 16px;
    }
    .navbar .menu-icon {
        display: none;
        font-size: 30px;
        cursor: pointer;
        color: #4CAF50;
    }
    .nav-links {
        display: flex;
        flex-grow: 1;
        justify-content: space-around;
        transition: max-height 0.5s ease-out;
    }
    .nav-links a {
        display: block;
        color: white;
        text-align: left;
        padding: 14px 16px;
        text-decoration: none;
    }
    .nav-links a:hover {
        background-color: #ddd;
        color: black;
    }
    .navbar.responsive .nav-links {
        display: block;
        flex-direction: column;
        width: 100%;
        position: absolute;
        top: 50px;
        left: 0;
        background-color: #333;
        max-height: 200px; /* Limits the max height of the dropdown for animation */
        transition: max-height 0.5s ease;
    }
    @media (max-width: 768px) {
        .nav-links {
            display: none; /* Hide the links initially */
            flex-direction: column;
            width: 100%;
            position: absolute;
            top: 50px;
            left: 0;
            background-color: #333;
            max-height: 0;
            overflow: hidden; /* Prevent overflow content */
        }
        .navbar .menu-icon {
            display: block; /* Show hamburger icon on small screens */
        }
        .navbar.responsive .nav-links {
            display: flex; /* Make links visible on menu open */
            max-height: 240px; /* Control maximum height for smooth animation */
        }
    }
    .logout {
        background-color: red;
    }
</style>
</head>
<body>
<div class="navbar" id="navbar">
    <span class="menu-icon" id="menu-icon" onclick="toggleMenu()">&#9776;</span>
    <div class="nav-links">
        <a href="index.jsp">Home</a>
        <a href="MyBookingsServlet">My Bookings</a>
        <a href="DomesticFlightsServlet">View Domestic Flights</a>
        <a href="InternationalFlightsServlet">View International Flights</a>
        <a href="logoutServlet" class="logout">Logout</a>
    </div>
</div>

<script type="text/javascript">
    function toggleMenu() {
        var navbar = document.getElementById("navbar");
        var menuIcon = document.getElementById("menu-icon");
        navbar.classList.toggle("responsive");

        // Toggle between hamburger (☰) and cross (✖)
        if (navbar.classList.contains("responsive")) {
            menuIcon.innerHTML = "&#10006;"; // Cross symbol
        } else {
            menuIcon.innerHTML = "&#9776;"; // Hamburger symbol
        }
    }
</script>
</body>
</html>
