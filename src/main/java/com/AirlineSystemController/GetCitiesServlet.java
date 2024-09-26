package com.AirlineSystemController;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.*;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import com.google.gson.Gson;
import java.util.ArrayList;
import java.util.List;

@WebServlet("/GetCities")
public class GetCitiesServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setContentType("application/json");
        PrintWriter out = response.getWriter();
        Connection con = null;
        PreparedStatement ps = null;
        ResultSet rs = null;

        try {
            // Connect to database
            Class.forName("com.mysql.cj.jdbc.Driver");
            con = DriverManager.getConnection("jdbc:mysql://localhost:3306/project", "root", "Sunil@12345");  // adjust credentials
            String query = "SELECT DISTINCT source_city, destination_city FROM flight";
            ps = con.prepareStatement(query);
            rs = ps.executeQuery();

            // Create a container for city names
            CityData cityData = new CityData();

            while (rs.next()) {
                cityData.sourceCities.add(rs.getString("source_city"));
                cityData.destinationCities.add(rs.getString("destination_city"));
            }

            // Convert city data to JSON and send it to the client
            Gson gson = new Gson();
            String jsonResponse = gson.toJson(cityData);
            out.print(jsonResponse);
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            try { rs.close(); ps.close(); con.close(); } catch (Exception e) { e.printStackTrace(); }
        }
    }

    // Class to hold city data for JSON response
    class CityData {
        public List<String> sourceCities = new ArrayList<>();
        public List<String> destinationCities = new ArrayList<>();
    }
}
