package com.codingdojo.auth.controllers;
import java.security.Principal;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.codingdojo.auth.models.Brinner;
import com.codingdojo.auth.models.Diary;
import com.codingdojo.auth.models.User;
import com.codingdojo.auth.services.DiaryService;
import com.codingdojo.auth.services.UserService;

import jakarta.servlet.http.HttpSession;

@Controller
public class DiaryController {

    @Autowired
    private DiaryService diaryService;
    @Autowired
    private UserService userservice;
    
    
    
    
    
	/*
	 * @GetMapping("/foodDiary/{userId}") public String
	 * renderFoodDiary(@PathVariable("userId") Long userId, Model model) { User user
	 * = userService.findUserById(userId); // Assuming you have a method to find
	 * user by ID Diary diary = diaryService.findDiaryByUserId(userId); // Assuming
	 * you have a method to find diary by user ID model.addAttribute("user", user);
	 * model.addAttribute("diary", diary); return "foodDiary.jsp"; }
	 */
	
	@GetMapping("/profile/{id}/foodDiary")
	public String foodDiary(Principal principal, @PathVariable("id") Long id, Model model, HttpSession session) {
		User user = userservice.findById(id);
		/*
		 * model.addAttribute("calories", user.getEer());
		 *///		model.addAttribute("diaryId", user.getDiary().getId());
		model.addAttribute("userId", user.getId());
		session.setAttribute("calories", user.getEer());
		session.setAttribute("user", user.getId());

		
		
		
		
			
			return "foodDiary.jsp";
	
		
	}
   

    
    
    
    @GetMapping("/searchBrinner")
    public String searchBrinner(@RequestParam("query") String query, @RequestParam("type") String type, Model model) {
        List<Brinner> results = diaryService.searchBrinner(query);
        model.addAttribute("results", results);
        model.addAttribute("type", type);
        model.addAttribute("query", query);
        return "foodDiary.jsp";
    }
    
    @PostMapping("/addToDiary/{id}/{foodId}")
    public String addToDiary(@PathVariable("foodId") Long brinnerId, @PathVariable("id") Long id, Model model) {
    	User user = userservice.findById(id);
    	Diary thisdiary = user.getDiary();
		/*
		 * Diary diary = diaryService.findDiary(diaryId);
		 */       
    	Brinner brinner = diaryService.findBrinner(brinnerId);
        diaryService.addBrinnerItem(thisdiary, brinner);
        return "redirect:/profile/{id}/foodDiary";
    }
    
}





