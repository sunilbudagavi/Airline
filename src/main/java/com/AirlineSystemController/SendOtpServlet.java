package com.AirlineSystemController;

// SendOtpServlet.java
import java.io.IOException;
import java.sql.*;
import javax.mail.*;
import javax.mail.internet.*;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import java.util.Properties;

@WebServlet("/SendOtpServlet")
public class SendOtpServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String email = request.getParameter("email");
        HttpSession session = request.getSession();
        session.setAttribute("email", email);
        

        try  {
        	Class.forName("com.mysql.cj.jdbc.Driver");
        	Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/project", "root", "Sunil@12345");
            String query = "SELECT * FROM register_login where email=?";
            try (PreparedStatement ps = con.prepareStatement(query)) {
                ps.setString(1, email);
                try (ResultSet rs = ps.executeQuery()) {
                    if (rs.next()) {
                        // Generate OTP and set expiration time
                        String otp = OTPUtil.generateOTP();
                        Timestamp expirationTime = new Timestamp(System.currentTimeMillis() + 5 * 60 * 1000); // 5 min expiry

                        // Store OTP in the database
                        String updateQuery = "UPDATE register_login SET otp=?, otp_expiration=? WHERE email=?";
                        try (PreparedStatement updatePs = con.prepareStatement(updateQuery)) {
                            updatePs.setString(1, otp);
                            updatePs.setTimestamp(2, expirationTime);
                            updatePs.setString(3, email);
                            updatePs.executeUpdate();
                        }
                        
                        // Send OTP via email
                        try {
                            sendOtpEmail(email, otp);
                            response.sendRedirect("OtpVerification.jsp");
                        } catch (MessagingException e) {
                            e.printStackTrace();
                            response.getWriter().println("Failed to send OTP. Please try again.");
                        }
                    } else {
                        response.getWriter().println("Email not found!");
                    }
                }
            }
        } catch (SQLException | ClassNotFoundException e) {
            e.printStackTrace();
            response.getWriter().println("Database error occurred.");
        }
    }

    private void sendOtpEmail(String email, String otp) throws MessagingException {
    	final String username = "pk3950785@gmail.com";  // your Gmail address
    	final String password = "xdfgebqifprtfked";     // the 16-character App password generated

    	Properties props = new Properties();
    	props.put("mail.smtp.auth", "true");
    	props.put("mail.smtp.starttls.enable", "true");
    	props.put("mail.smtp.host", "smtp.gmail.com");
    	props.put("mail.smtp.port", "587");

    	Session session = Session.getInstance(props, new javax.mail.Authenticator() {
    	    protected PasswordAuthentication getPasswordAuthentication() {
    	        return new PasswordAuthentication(username, password);
    	    }
    	});
        Message message = new MimeMessage(session);
        message.setFrom(new InternetAddress(username));
        message.setRecipients(Message.RecipientType.TO, InternetAddress.parse(email));
        message.setSubject("Your OTP for Password Reset");
        message.setText("Your OTP is: " + otp);

        Transport.send(message);
    }
}
