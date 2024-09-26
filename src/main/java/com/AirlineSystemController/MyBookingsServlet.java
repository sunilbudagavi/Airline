package com.AirlineSystemController;
import com.AirlineSystemmodal.*;
import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;


@WebServlet("/MyBookingsServlet")
public class MyBookingsServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession();
		String passengerName = session.getAttribute("name").toString();
		System.out.println("Passenger Name"+passengerName);
		List<MyBookings> bookingsList = new ArrayList<>();
		
		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
            Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/project", "root", "Sunil@12345");

            // Query to get the fare based on passenger name
            String query = "SELECT * FROM flight_bookings WHERE Passenger_name = ? and email=?";
            PreparedStatement stmt = con.prepareStatement(query);
            stmt.setString(1,passengerName);
            stmt.setString(2, (String) session.getAttribute("email"));
            ResultSet rs = stmt.executeQuery();
            while(rs.next()) {
            	MyBookings booking = new MyBookings();
            	booking.setBooking_id(rs.getInt("booking_id"));
            	booking.setFlight_id(rs.getInt("flight_id"));
            	booking.setPassengername(rs.getString("Passenger_name"));
            	booking.setSeatClass(rs.getString("Seat_class"));
            	booking.setNoOfPassengers(rs.getInt("No_of_Passengers"));
            	booking.setBooking_date(rs.getTimestamp("Booking_date").toInstant());
            	booking.setFlight_date(rs.getDate("flight_date"));
            	booking.setTotal_amount(rs.getDouble("Total_amount"));
            	booking.setFlight_type(rs.getString("flight_type"));
            	booking.setSource_city(rs.getString("source_city"));
            	booking.setDestination_city(rs.getString("destination_city"));
            	
            	bookingsList.add(booking);
            	
            }
            request.setAttribute("bookingsList", bookingsList);
            stmt.close();
		} catch (Exception e) {
			e.printStackTrace();
            response.sendError(HttpServletResponse.SC_INTERNAL_SERVER_ERROR, "An error occurred while processing your request.");
		}
		finally {
            request.getRequestDispatcher("MyBookings.jsp").forward(request, response);
        }
	}

}