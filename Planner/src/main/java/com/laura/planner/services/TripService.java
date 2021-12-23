package com.laura.planner.services;

import java.util.List;
import java.util.Optional;

import org.springframework.stereotype.Service;

import com.laura.planner.models.Trip;
import com.laura.planner.repositories.TripRepository;

@Service
public class TripService {

    private final TripRepository tripRepository;
    
    public TripService(TripRepository tripRepository) {
        this.tripRepository = tripRepository;
    }
    // returns all  ideas
    public List<Trip> allTrips() {
        return tripRepository.findAll();
    }
    // creates an idea
    public Trip createTrip(Trip trip) {
        return tripRepository.save(trip);
    }
    
    // updates an idea 
    public Trip updateTrip(Trip trip) {
    	
    	
    	return tripRepository.save(trip);
    	
    }
    // returns idea by id
    public Trip findById(Long id) {
        Optional<Trip> optionalTrip = tripRepository.findById(id);
        if(optionalTrip.isPresent()) {
            return optionalTrip.get();
        } else {
            return null;
        }
    }
    
    // retrieves an idea
    public Trip findTrip(Long id) {
        Optional<Trip> optionalTrip = tripRepository.findById(id);
        if(optionalTrip.isPresent()) {
            return optionalTrip.get();
        } else {
            return null;
        }
    }
    
    // deletes an idea
    public void deleteTrip(Long id) {
    	tripRepository.deleteById(id);
    }

}

