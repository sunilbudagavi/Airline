package com.AirlineSystemmodal;

import java.sql.Date;
import java.time.Instant;

public class MyBookings {
	private int booking_id;
	public int getBooking_id() {
		return booking_id;
	}
	public void setBooking_id(int booking_id) {
		this.booking_id = booking_id;
	}
	private int flight_id;
	private String Passenger_name;
	private String seatClass;
	private int noOfPassengers;
	private Instant booking_date;
	private Date flight_date;
	private double total_amount;
	private String flight_type;
	private String source_city;
	private String destination_city;
	
	
	public String getFlight_type() {
		return flight_type;
	}
	public void setFlight_type(String flight_type) {
		this.flight_type = flight_type;
	}
	public String getSource_city() {
		return source_city;
	}
	public void setSource_city(String source_city) {
		this.source_city = source_city;
	}
	public String getDestination_city() {
		return destination_city;
	}
	public void setDestination_city(String destination_city) {
		this.destination_city = destination_city;
	}
	public int getFlight_id() {
		return flight_id;
	}
	public void setFlight_id(int flight_id) {
		this.flight_id = flight_id;
	}
	public String getPassengername() {
		return Passenger_name;
	}
	public void setPassengername(String passengername) {
		this.Passenger_name = passengername;
	}
	public String getSeatClass() {
		return seatClass;
	}
	public void setSeatClass(String seatClass) {
		this.seatClass = seatClass;
	}
	public int getNoOfPassengers() {
		return noOfPassengers;
	}
	public void setNoOfPassengers(int noOfPassengers) {
		this.noOfPassengers = noOfPassengers;
	}
	public Instant getBooking_date() {
		return booking_date;
	}
	public void setBooking_date(Instant instant) {
		this.booking_date = instant;
	}
	public Date getFlight_date() {
		return flight_date;
	}
	public void setFlight_date(Date flight_date) {
		this.flight_date = flight_date;
	}
	public double getTotal_amount() {
		return total_amount;
	}
	public void setTotal_amount(double total_amount) {
		this.total_amount = total_amount;
	}

}