package com.AirlineSystemController;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.AirlineSystemmodal.Flight;

@WebServlet("/BookNowServlet")
public class BookNowServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    private static final String JDBC_URL = "jdbc:mysql://localhost:3306/project"; 
    private static final String JDBC_USER = "root"; 
    private static final String JDBC_PASS = "Sunil@12345"; 

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        String flightId = request.getParameter("flightId");
        
        System.out.println("Booking flight with ID: " + flightId);
        Connection conn = null;
        PreparedStatement pstmt = null;
        
        try {
     
            Class.forName("com.mysql.cj.jdbc.Driver");
           
            conn = DriverManager.getConnection(JDBC_URL, JDBC_USER, JDBC_PASS);

          
            String sql = "select * from flight where flightId=? and cast(departure_time as DATE)>= CURDATE()";
            List<Flight> flightList = new ArrayList<>();
            pstmt = conn.prepareStatement(sql);
            pstmt.setString(1, flightId);
            

      
            ResultSet resultSet = pstmt.executeQuery();
            
      
            response.setContentType("text/html");
            while (resultSet.next()) {
              Flight flight = new Flight();
              flight.setFlightId(resultSet.getInt("flightId"));
              flight.setSource_city(resultSet.getString("source_city"));
              flight.setDestination_city(resultSet.getString("destination_city"));
              flight.setDeparture_time(resultSet.getTimestamp("departure_time"));
              flight.setArrival_time(resultSet.getTimestamp("arrival_time"));
              flight.setEconomy_fare(resultSet.getBigDecimal("economy_fare"));
              flight.setBusiness_fare(resultSet.getBigDecimal("business_fare"));
              flight.setSeats_Available(resultSet.getInt("seats_Available"));
              flight.setFlight_type(resultSet.getString("Flight_type"));

              flightList.add(flight);
          }

          request.setAttribute("flightList", flightList);

        } catch (ClassNotFoundException | SQLException e) {
            e.printStackTrace();
            response.sendError(HttpServletResponse.SC_INTERNAL_SERVER_ERROR, "An error occurred while processing your request.");
        } finally {
        
            try {
                if (pstmt != null) pstmt.close();
                
                if (conn != null) conn.close();
            } catch (SQLException ex) {
                ex.printStackTrace();
            }
            request.getRequestDispatcher("BookingNow.jsp").forward(request, response);
        }

    }
}
