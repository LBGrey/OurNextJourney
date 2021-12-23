package com.laura.planner.repositories;

import java.util.List;

import org.springframework.data.repository.CrudRepository;

import com.laura.planner.models.Trip;

public interface TripRepository extends CrudRepository<Trip, Long> {
	
	List<Trip> findAll();
	Long countByNameContaining(String search);
	Long deleteByNameContaining(String search);
	
	

}
