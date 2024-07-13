package com.codingdojo.auth.controllers;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class RController {
	
	
	@GetMapping("/foodDiary")
	public String foodDiary() {
		return "foodDiary.jsp";
	}

	@GetMapping("/start")
	public String start() {
		return "Home.jsp";
	}
	
	@GetMapping("/profilee")
	public String profile() {
		return "profile.jsp";
	}
	
	
	
	
}
