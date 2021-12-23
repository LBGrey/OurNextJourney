package com.laura.planner.repositories;

import java.util.List;

import org.springframework.data.repository.CrudRepository;

import com.laura.planner.models.Todo;

public interface TodoRepository extends CrudRepository<Todo, Long> {
	
	List<Todo> findAll();
	

}
