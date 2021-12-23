package com.laura.planner.models;

import java.util.Date;
import java.util.List;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import javax.persistence.PrePersist;
import javax.persistence.PreUpdate;
import javax.persistence.Table;
import javax.validation.constraints.NotNull;
import javax.validation.constraints.Size;

import org.springframework.format.annotation.DateTimeFormat;

import com.fasterxml.jackson.annotation.JsonFormat;

@Entity
@Table(name="trips")
public class Trip {

	@Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;
	
    @NotNull
    @Size(min = 2, max = 30, message="Title must be at least 2 characters.")
    private String name;
    
    private String location;
    private String airline;
    private String flightNumber;
    private String itineraryNumber;
    
    @NotNull
    @DateTimeFormat(iso = DateTimeFormat.ISO.DATE)
    @JsonFormat(pattern = "MM/dd/yyyy")
    private Date startDate;
    
    @NotNull
    @DateTimeFormat(iso = DateTimeFormat.ISO.DATE)
    @JsonFormat(pattern = "MM/dd/yyyy")
    private Date endDate;
    
    @Column(updatable=false)
    private Date createdAt;
    private Date updatedAt;
    
    @ManyToOne(fetch=FetchType.LAZY)
    @JoinColumn(name="user_id")
    private User user;
    
    @OneToMany(mappedBy="trip", fetch=FetchType.LAZY)
    private List<Todo> usertodo;
    
    @OneToMany(mappedBy="trip", fetch=FetchType.LAZY)
    private List<Place> userplace;
    
    
    
    public Trip() {
    	
    }
    
    public Trip(Long id, String name, String location, String airline, String flightNumber, String itineraryNumber, Date startDate, Date endDate) {
	 this.id = id;
	 this.name = name;
	 this.location = location;
	 this.startDate = startDate;
	 this.endDate = endDate;
	 this.airline = airline;
	 this.flightNumber = flightNumber;
	 this.itineraryNumber = itineraryNumber;
    	
    }
    
    @PrePersist
    protected void onCreate(){
        this.createdAt = new Date();
    }
    @PreUpdate
    protected void onUpdate(){
        this.updatedAt = new Date();
    }

	public Long getId() {
		return id;
	}

	public void setId(Long id) {
		this.id = id;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getLocation() {
		return location;
	}

	public void setLocation(String location) {
		this.location = location;
	}

	public String getAirline() {
		return airline;
	}

	public void setAirline(String airline) {
		this.airline = airline;
	}

	public String getFlightNumber() {
		return flightNumber;
	}

	public void setFlightNumber(String flightNumber) {
		this.flightNumber = flightNumber;
	}

	public String getItineraryNumber() {
		return itineraryNumber;
	}

	public void setItineraryNumber(String itineraryNumber) {
		this.itineraryNumber = itineraryNumber;
	}

	public Date getStartDate() {
		return startDate;
	}

	public void setStartDate(Date startDate) {
		this.startDate = startDate;
	}

	public Date getEndDate() {
		return endDate;
	}

	public void setEndDate(Date endDate) {
		this.endDate = endDate;
	}

	public Date getCreatedAt() {
		return createdAt;
	}

	public void setCreatedAt(Date createdAt) {
		this.createdAt = createdAt;
	}

	public Date getUpdatedAt() {
		return updatedAt;
	}

	public void setUpdatedAt(Date updatedAt) {
		this.updatedAt = updatedAt;
	}

	public User getUser() {
		return user;
	}

	public void setUser(User user) {
		this.user = user;
	}

	public List<Todo> getUsertodo() {
		return usertodo;
	}

	public void setUsertodo(List<Todo> usertodo) {
		this.usertodo = usertodo;
	}

	public List<Place> getUserplace() {
		return userplace;
	}

	public void setUserplace(List<Place> userplace) {
		this.userplace = userplace;
	}

    
    
}
