package com.laura.planner.controllers;

import java.util.List;

import javax.servlet.http.HttpSession;
import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.laura.planner.models.LoginUser;
import com.laura.planner.models.Place;
import com.laura.planner.models.Todo;
import com.laura.planner.models.Trip;
import com.laura.planner.models.User;
import com.laura.planner.services.PlaceService;
import com.laura.planner.services.TodoService;
import com.laura.planner.services.TripService;
import com.laura.planner.services.UserService;


@Controller
public class HomeController {
    
	@Autowired
    private UserService userService;
    
    @Autowired
    private TripService tripService;
    
    @Autowired
    private TodoService todoServ;
    
    @Autowired
    private PlaceService placeService;
    
//    @Autowired
//    private GroupTodoService groupTodoServ;
  
    //LOGIN & REG
    
    @GetMapping("/")
    public String index(Model model) {
        model.addAttribute("newUser", new User());
        model.addAttribute("newLogin", new LoginUser());
        return "home.jsp";
    }
    
    @GetMapping("/register")
    public String register(Model model) {
        model.addAttribute("newUser", new User());
        model.addAttribute("newLogin", new LoginUser());
        return "index.jsp";
    }
    
    @PostMapping("/register")
    public String register(@Valid @ModelAttribute("newUser") User newUser, 
            BindingResult result, Model model, HttpSession session) {
        userService.register(newUser, result);
        if(result.hasErrors()) {
            model.addAttribute("newLogin", new LoginUser());
            return "index.jsp";
        }
        session.setAttribute("user_id", newUser.getId());
        return "redirect:/";
    }
    
    @GetMapping("/login")
    public String login(Model model) {
        model.addAttribute("newUser", new User());
        model.addAttribute("newLogin", new LoginUser());
        return "index.jsp";
    }
    
    @PostMapping("/login")
    public String login(@Valid @ModelAttribute("newLogin") LoginUser newLogin, 
            BindingResult result, Model model, HttpSession session) {
        User user = userService.login(newLogin, result);
        if(result.hasErrors()) {
            model.addAttribute("newUser", new User());
            return "index.jsp";
        }
        session.setAttribute("user_id", user.getId());
        return "redirect:/dashboard";
    }
    
    //create trips
    
    @RequestMapping("/trip/new")
    public String add(HttpSession session, Model model, @ModelAttribute("trip") Trip trip) {
    	Long userID = (Long) session.getAttribute("user_id");
    	if(userID == null) {
    		return "redirect:/";
    	}
    	else {    		
    		
    		return "newtrip.jsp";
    	}
    }
    
    @PostMapping("/trip/new")
    public String create(@Valid @ModelAttribute("trip") Trip trip, BindingResult result, HttpSession session, Model model) {
        model.addAttribute("users", userService.allUsers());
    	Long userID = (Long) session.getAttribute("user_id");
    	if(userID == null) {
    		return "redirect:/";
    	}
    	else if (result.hasErrors()) {

            return "newtrip.jsp";
            
        } 
    	
    	else {

        	tripService.createTrip(trip);
        	

            return "redirect:/dashboard";
        }

    }
    //show all
    
    @GetMapping("/maps")
    public String home(HttpSession session, Model model) {
    	Long userID = (Long) session.getAttribute("user_id");
    	if(userID == null) {
    		return "redirect:/";
    	}
    	else {
    		User thisUser = userService.findOne(userID);
    		System.out.println(thisUser);
    		model.addAttribute("name", thisUser.getFirstName());
//    		List<Idea> ideas = ideaService.allIdeas();
//        	model.addAttribute("ideas", ideas);
    		return "map.jsp";
    	}
    
    }
    
    @GetMapping("/dashboard")
    public String dashboard(HttpSession session, Model model) {
    	Long userID = (Long) session.getAttribute("user_id");
    	if(userID == null) {
    		return "redirect:/";
    	}
    	else {
    		User thisUser = userService.findOne(userID);
    		System.out.println(thisUser);
    		model.addAttribute("name", thisUser.getFirstName());
    		List<Trip> trips = tripService.allTrips();
        	model.addAttribute("trips", trips);
    		return "dashboard.jsp";
    	}
    }
    
    @GetMapping("/show/{id}")
    public String oneTrip(@PathVariable("id") Long id, @ModelAttribute("todoS") Todo todo, @ModelAttribute("placeS") Place place, HttpSession session, Model model) {
    	Long userID = (Long) session.getAttribute("user_id");
    	if(userID == null) {
    		return "redirect:/";
    	}
    	else {
    		User thisUser = userService.findOne(userID);
    		System.out.println(thisUser);
    		Trip thisTrip = tripService.findById(id);
            model.addAttribute("trip", thisTrip);
    		model.addAttribute("trip_id", id);
        	model.addAttribute("trips", tripService.allTrips());
    		model.addAttribute("name", thisUser.getFirstName());

        	List<Todo> todos = thisTrip.getUsertodo();
	    	model.addAttribute("todos", todos);
	    	
	    	List<Place> places = thisTrip.getUserplace();
	    	model.addAttribute("places", places);
	    	
    		return "showtrip.jsp";
    	}
    }
    
    @GetMapping("/groupshow/{id}")
    public String groupTrip(HttpSession session, Model model) {
    	Long userID = (Long) session.getAttribute("user_id");
    	if(userID == null) {
    		return "redirect:/";
    	}
    	else {
    		User thisUser = userService.findOne(userID);
    		System.out.println(thisUser);
    		model.addAttribute("name", thisUser.getFirstName());
    		
    		return "showgroup.jsp";
    	}
    }
    
    @GetMapping("/trip/{id}/edit")
    public String edit(@PathVariable("id") Long id, @ModelAttribute("trip") Trip trip, Model model) {
        Trip thisTrip = tripService.findTrip(id);
        model.addAttribute("trip", thisTrip);
        return "edittrip.jsp";
    }
    
    @RequestMapping(value="/trip/{id}/edit", method=RequestMethod.PUT)
    public String updateTrip(@Valid @ModelAttribute("trip") Trip trip, BindingResult result, Model model) {
    	
        if (result.hasErrors()) {
            return "edittrip.jsp";
            
        } else {
        	
            tripService.updateTrip(trip);
            
            return "redirect:/dashboard";
        }
    }
    

    @RequestMapping("/trip/{id}/delete")
    public String delete(@PathVariable("id") Long id) {
    	
        tripService.deleteTrip(id);
        
        return "redirect:/dashboard";
    }
    
    
    //todos/////

//    @GetMapping("/show/{id}")
//    public String alltodos(@ModelAttribute("todoS") Todo todo, Model model, HttpSession session) {
//    	Long userId = (Long) session.getAttribute("user_id");
//    	if (userId == null) {
//    		return "redirect:/";
//    	}
//    	else {
//    		
//
//	    	User loguser = userService.findOne(userId);
//
//	    	model.addAttribute("name", loguser.getFirstName());
//	    	List<Todo> todos = loguser.getUserTodo();
//	    	model.addAttribute("todos", todos);
//	    	return "showtrip.jsp";
//    	}
//    }
    
//    @RequestMapping("/todos/new")
//    public String addTodo(@ModelAttribute("todo") Todo todo, Model model, HttpSession session) {
//    	Long userId = (Long) session.getAttribute("user_id");
//    	if (userId == null) {
//    		return "redirect:/dashboard";
//    	}
//    	else {
//    		return "showtrip.jsp";
//    	}
//    }
    
    @PostMapping("/places/new")
    public String newPlace(@Valid @ModelAttribute("placeS") Place place, BindingResult result, Model model, HttpSession session, @RequestParam("trip") String trip_id) {

    	Long userId = (Long) session.getAttribute("user_id");
    	model.addAttribute("users", userService.allUsers());
    	
    	Long tripId = Long.parseLong(trip_id);
    	model.addAttribute("trips", tripService.allTrips());
    	
    	if (userId == null) {
    		return "redirect:/";
    	}
    	else if (result.hasErrors()) {
    		return "dashboard.jsp";
    	}
    	else {
    		placeService.createPlace(place);
    		return "redirect:/show/"+ tripId;
    	}
    }
    
    @RequestMapping("/places/{place_id}/delete/{trip_id}")
    public String destroyPlace(@PathVariable("place_id") Long place_id, @PathVariable("trip_id") Long trip_id, Model model, HttpSession session) {

    	placeService.deletePlace(place_id);
    	
    	
        
        return "redirect:/show/" + trip_id;
    }
    
    @PostMapping("/todos/new")
    public String newTodo(@Valid @ModelAttribute("todoS") Todo todo, BindingResult result, Model model, HttpSession session, @RequestParam("trip") String trip_id) {

    	Long userId = (Long) session.getAttribute("user_id");
    	model.addAttribute("users", userService.allUsers());
    	
    	Long tripId = Long.parseLong(trip_id);
    	model.addAttribute("trips", tripService.allTrips());
    	
    	if (userId == null) {
    		return "redirect:/";
    	}
    	else if (result.hasErrors()) {
    		return "dashboard.jsp";
    	}
    	else {
    		todoServ.createTodo(todo);
    		return "redirect:/show/"+ tripId;
    	}
    }
    
    @RequestMapping("/todos/{todo_id}/delete/{trip_id}")
    public String destroy(@PathVariable("todo_id") Long todo_id, @PathVariable("trip_id") Long trip_id,Model model, HttpSession session) {

    	todoServ.deleteTodo(todo_id);
    	
    	
        
        return "redirect:/show/" + trip_id;
    }
    
    
    
    
//    @GetMapping("/grouptodos")
//    public String allGroupTodos(Model model, HttpSession session) {
//    	Long userId = (Long) session.getAttribute("user_id");
//    	if (userId == null) {
//    		return "redirect:/";
//    	}
//    	else {
//	    	User loguser = userService.findOne(userId);
//	    	model.addAttribute("name", loguser.getFirstName());
//	    	List<GroupTodo> groupTodos = groupTodoServ.allGroupTodos();
//	    	model.addAttribute("grouptodos", groupTodos);
//	    	return "allgrouptodos.jsp";
//    	}
//    }
//    
//    @RequestMapping(value="/grouptodos/{id}/delete", method=RequestMethod.DELETE)
//    public String destroygroup(@PathVariable("id") Long id) {
//    	groupTodoServ.deleteGroupTodo(id);
//        return "redirect:/grouptodos";
//    }
    
    
    @GetMapping("/logout")
    public String logout(HttpSession session) {
    	session.invalidate();
    	return "redirect:/";
    }
}
