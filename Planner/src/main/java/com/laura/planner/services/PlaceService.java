package com.laura.planner.services;

import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.laura.planner.models.Place;
import com.laura.planner.repositories.PlaceRepository;

@Service
public class PlaceService {

	@Autowired 
	PlaceRepository placeRepository;
	
	 // creates 
	 public Place createPlace(Place p) {
	     return placeRepository.save(p);
	 }
	 
	 
	 // returns
	 public List<Place> allPlaces() {
	     return placeRepository.findAll();
	 }
	 
	 // retrieves
	 public Place findPlace(Long id) {
	     Optional<Place> optionalPlace = placeRepository.findById(id);
	     if(optionalPlace.isPresent()) {
	         return optionalPlace.get();
	     } else {
	         return null;
	     }
	 }
	 public Place findById(Long id) {
	     Optional<Place> optionalPlace = placeRepository.findById(id);
	     if(optionalPlace.isPresent()) {
	         return optionalPlace.get();
	     } else {
	         return null;
	     }
	 }
	 //delete 
	 public void deletePlace(long id) {
		 placeRepository.deleteById(id);
	 }
}

