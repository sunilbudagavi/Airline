package com.AirlineSystemController;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.Statement;

@WebServlet("/DomesticFlightsServlet")
public class DomesticFlight extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setContentType("text/html");
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/project", "root", "Sunil@12345");
            Statement stmt = con.createStatement();
            String sql = "SELECT * FROM flight WHERE flight_type='domestic' and cast(departure_time as DATE)>= CURDATE()";
            ResultSet rs = stmt.executeQuery(sql);
            
            // Include the menu.jsp at the top of the output
            request.getRequestDispatcher("menu.jsp").include(request, response);
            
            // Start of the HTML output
            response.getWriter().println("<html><head><style>");
            response.getWriter().println("<meta name='viewport' content='width=device-width, initial-scale=1.0'>");
            response.getWriter().println("body {font-family: Arial, sans-serif; background-color: #f4f4f4; margin: 0; padding: 0; padding-top: 60px;}"); // padding for the fixed menu
            response.getWriter().println("h2 {text-align: center; color: #333333; margin-top: 20px;}");
            response.getWriter().println("table {width: 100%; margin: 20px auto; border-collapse: collapse;}");
            response.getWriter().println("th, td {padding: 10px; text-align: left; border-bottom: 1px solid #ddd;}");
            response.getWriter().println("th {background-color: #4CAF50; color: white;}");
            response.getWriter().println("tr:hover {background-color: #f1f1f1;}");
            response.getWriter().println(".footer {text-align: center; padding: 20px;}");
            response.getWriter().println(".footer a {color: white; font-weight: bold; text-decoration: none; background-color: #4CAF50; padding: 10px 20px; border-radius: 5px; border: 1px solid #4CAF50; display: inline-block;}");
            response.getWriter().println(".footer a:hover {background-color: #45a049;}");
            response.getWriter().println(".book-button {background-color: #4CAF50; color: white; border: none; padding: 10px 20px; text-align: center; text-decoration: none; display: inline-block; font-size: 14px; margin: 4px 2px; cursor: pointer; border-radius: 4px;}");
            response.getWriter().println(".book-button:hover {background-color: #45a049;}");

            // Responsive design adjustments
            response.getWriter().println("@media screen and (max-width: 768px) {");
            response.getWriter().println("table {display: block; overflow-x: auto; white-space: nowrap;}");
            response.getWriter().println("th, td {font-size: 14px; padding: 8px;}");
            response.getWriter().println("h2 {font-size: 18px;}");
            response.getWriter().println("}");
            response.getWriter().println("@media screen and (max-width: 480px) {");
            response.getWriter().println("th, td {font-size: 12px; padding: 6px;}");
            response.getWriter().println("h2 {font-size: 16px;}");
            response.getWriter().println("}");

            response.getWriter().println("</style></head><body>");
            response.getWriter().println("<h2>International Flights</h2>");
            response.getWriter().println("<table border='1'><tr><th>Flight ID</th><th>Source</th><th>Destination</th><th>Departure Time</th><th>Arrival Time</th><th>Economy Fare</th><th>Business Fare</th><th>Seats Available</th><th>Action</th></tr>");
            
            while (rs.next()) {
                response.getWriter().println("<tr>"
                        + "<td>" + rs.getInt("flightId") + "</td>"
                        + "<td>" + rs.getString("source_city") + "</td>"
                        + "<td>" + rs.getString("destination_city") + "</td>"
                        + "<td>" + rs.getString("departure_time") + "</td>"
                        + "<td>" + rs.getString("arrival_time") + "</td>"
                        + "<td>" + rs.getDouble("economy_fare") + "</td>"
                        + "<td>" + rs.getDouble("business_fare") + "</td>"
                        + "<td>" + rs.getInt("seats_available") + "</td>"
                        // Add the "Book Now" button
                        + "<td><form action='BookNowServlet' method='post'>"
                        + "<input type='hidden' name='flightId' value='" + rs.getInt("flightId") + "'/>"
                        + "<input type='submit' value='Book Now' class='book-button'/>"
                        + "</form></td>"
                        + "</tr>");
            }
            
            response.getWriter().println("</table>");
            response.getWriter().println("<div class='footer'><a href='index.jsp'>Back to Book Flight</a></div>");
            response.getWriter().println("</body></html>");
            con.close();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}
