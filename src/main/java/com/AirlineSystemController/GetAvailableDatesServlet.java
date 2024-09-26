package com.AirlineSystemController;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.BufferedReader;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Arrays;
import java.util.ArrayList;
import java.util.List;
import com.google.gson.Gson;

@WebServlet("/GetAvailableDates")
public class GetAvailableDatesServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	 private static final String JDBC_URL = "jdbc:mysql://localhost:3306/project"; 
	    private static final String JDBC_USER = "root"; 
	    private static final String JDBC_PASS = "Sunil@12345"; 
	@Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // Read the input JSON data
        StringBuilder stringBuilder = new StringBuilder();
        String line;
        try (BufferedReader reader = request.getReader()) {
            while ((line = reader.readLine()) != null) {
                stringBuilder.append(line);
            }
        }
        String json = stringBuilder.toString();
        Gson gson = new Gson();
        CityRequest cityRequest = gson.fromJson(json, CityRequest.class);

        // Fetch available dates based on the source and destination cities
        List<String> unavailableDates = fetchUnavailableDates(cityRequest.getSourceCity(), cityRequest.getDestinationCity());

        // Create the response JSON
        response.setContentType("application/json");
        PrintWriter out = response.getWriter();
        gson.toJson(new DateResponse(unavailableDates), out);
    }

    private List<String> fetchUnavailableDates(String sourceCity, String destinationCity) {
    	
    	Connection conn = null;
        PreparedStatement pstmt = null;
        List<String> dates = new ArrayList<>();
       
     
            try {
				Class.forName("com.mysql.cj.jdbc.Driver");
				conn = DriverManager.getConnection(JDBC_URL, JDBC_USER, JDBC_PASS);

		          
	            String sql = "select cast(departure_time as DATE) from flight where source_city!= ? and destination_city!= ?";
	            pstmt = conn.prepareStatement(sql);
	            pstmt.setString(1, sourceCity);
	            pstmt.setString(2, destinationCity);
	            ResultSet resultSet = pstmt.executeQuery();
	            while(resultSet.next()) {
	            	dates.add(resultSet.getString("cast(departure_time as DATE)"));
	            }
	            
			} catch (ClassNotFoundException e) {
				e.printStackTrace();
			} catch (SQLException e) {
				e.printStackTrace();
			}
        
        return dates;  // Sample data
    }

    // Helper classes for JSON conversion
    private static class CityRequest {
        private String sourceCity;
        private String destinationCity;

        public String getSourceCity() {
            return sourceCity;
        }

        public void setSourceCity(String sourceCity) {
            this.sourceCity = sourceCity;
        }

        public String getDestinationCity() {
            return destinationCity;
        }

        public void setDestinationCity(String destinationCity) {
            this.destinationCity = destinationCity;
        }
    }

    private static class DateResponse {
        private List<String> unavailableDates;

        public DateResponse(List<String> unavailableDates) {
            this.unavailableDates = unavailableDates;
        }

        public List<String> getUnavailableDates() {
            return unavailableDates;
        }

        public void setUnavailableDates(List<String> unavailableDates) {
            this.unavailableDates = unavailableDates;
        }
    }
}
