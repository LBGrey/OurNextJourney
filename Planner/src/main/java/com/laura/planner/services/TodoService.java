package com.laura.planner.services;

import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.laura.planner.models.Todo;
import com.laura.planner.repositories.TodoRepository;

@Service
public class TodoService {

	@Autowired 
	TodoRepository todoRepository;
	
	 // creates 
	 public Todo createTodo(Todo t) {
	     return todoRepository.save(t);
	 }
	 
	 
	 // returns
	 public List<Todo> allTodos() {
	     return todoRepository.findAll();
	 }
	 
	 // retrieves
	 public Todo findTodo(Long id) {
	     Optional<Todo> optionalTodo = todoRepository.findById(id);
	     if(optionalTodo.isPresent()) {
	         return optionalTodo.get();
	     } else {
	         return null;
	     }
	 }
	 public Todo findById(Long id) {
	     Optional<Todo> optionalTodo = todoRepository.findById(id);
	     if(optionalTodo.isPresent()) {
	         return optionalTodo.get();
	     } else {
	         return null;
	     }
	 }
	 //delete 
	 public void deleteTodo(long id) {
		 todoRepository.deleteById(id);
	 }
}
