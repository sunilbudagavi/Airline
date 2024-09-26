package com.AirlineSystemmodal;

import java.math.BigDecimal;
import java.util.Date;

public class Flight {
	private int flightId;
	private String source_city;
	private String destination_city;
	private Date departure_time;
	private Date arrival_time;
	private BigDecimal economy_fare;
	private BigDecimal business_fare;
	private int seats_Available;
	private String Flight_type;
	public int getFlightId() {
		return flightId;
	}
	public void setFlightId(int flightId) {
		this.flightId = flightId;
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
	public Date getDeparture_time() {
		return departure_time;
	}
	public void setDeparture_time(Date departure_time) {
		this.departure_time = departure_time;
	}
	public Date getArrival_time() {
		return arrival_time;
	}
	public void setArrival_time(Date arrival_time) {
		this.arrival_time = arrival_time;
	}
	public BigDecimal getEconomy_fare() {
		return economy_fare;
	}
	public void setEconomy_fare(BigDecimal economy_fare) {
		this.economy_fare = economy_fare;
	}
	public BigDecimal getBusiness_fare() {
		return business_fare;
	}
	public void setBusiness_fare(BigDecimal business_fare) {
		this.business_fare = business_fare;
	}
	public int getSeats_Available() {
		return seats_Available;
	}
	public void setSeats_Available(int seats_Available) {
		this.seats_Available = seats_Available;
	}
	public String getFlight_type() {
		return Flight_type;
	}
	public void setFlight_type(String flight_type) {
		Flight_type = flight_type;
	}
	
}
