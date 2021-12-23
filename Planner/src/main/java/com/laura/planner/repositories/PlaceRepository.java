package com.laura.planner.repositories;

import java.util.List;

import org.springframework.data.repository.CrudRepository;

import com.laura.planner.models.Place;

public interface PlaceRepository extends CrudRepository<Place, Long> {

	List<Place> findAll();
	Long countByContentsContaining(String search);
	Long deleteByContentsContaining(String search);
	
}
