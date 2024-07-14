package com.codingdojo.auth.controllers;

import java.security.Principal;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

import com.codingdojo.auth.models.User;
import com.codingdojo.auth.services.UserService;

@Controller
public class RController {
	@Autowired
	UserService userService;
	
	@GetMapping("/foodDiary")
	public String foodDiary() {
		return "foodDiary.jsp";
	}

	@GetMapping("/")
	public String start(Principal principal) {
		if(principal!=null) {
			String username=principal.getName();
			User user = userService.findByUsername(username);
			Long id = user.getId();
			return "redirect:/profile/" + id;
		}
		else if(principal==null){
			return "Home.jsp";
		}
		return null;
		
	}
	
	@GetMapping("/profilee")
	public String profile() {
		
		return "profile.jsp";
	}
	
	
	

}
