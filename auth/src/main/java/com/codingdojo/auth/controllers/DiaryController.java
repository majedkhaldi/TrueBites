package com.codingdojo.auth.controllers;
import java.security.Principal;
import java.time.LocalTime;
import java.time.format.DateTimeFormatter;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.codingdojo.auth.models.Brinner;
import com.codingdojo.auth.models.Diary;
import com.codingdojo.auth.models.Lunch;
import com.codingdojo.auth.models.Snack;
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
		Diary diary = user.getDiary();
		List<Brinner> joinedBrinner =  user.getDiary().getBrinneritems();
		List<Lunch> joinedLunch =  user.getDiary().getLunchitems();
		List<Snack> joinedSnack =  user.getDiary().getSnackitems();

		
		
		/*
		 * model.addAttribute("calories", user.getEer());
		 */		 		
		
		model.addAttribute("diaryId", user.getDiary().getId());
		model.addAttribute("diary", user.getDiary());
		model.addAttribute("userId", user.getId());
		session.setAttribute("calories", user.getEer());
		session.setAttribute("user", user.getId());
		model.addAttribute("joinedBrinner", joinedBrinner);
		model.addAttribute("caloriesIn", diary.getCaloriesin());
		model.addAttribute("joinedLunch", joinedLunch);
		model.addAttribute("joinedSnack", joinedSnack);

		
		
		

		
		
		
		
			
			return "foodDiary.jsp";
	
		
	}
   

    
    

    @PostMapping("/searchBrinner/{id}")
    public String searchBrinner(@RequestParam("query") String query,  @PathVariable("id") Long id,
    		HttpSession session
    		,@RequestParam("type") String type,
    		Model model) {
    	User user = userservice.findById(id);
		Diary diary = user.getDiary();
    	
    	
    	
    	if (type.equals("breakfast")) {
          List<Brinner> results = diaryService.searchBrinner(query);
          model.addAttribute("results", results);

    	}
    	
    	
    	if (type.equals("dinner")) {
            List<Brinner> results = diaryService.searchBrinner(query);
            model.addAttribute("results", results);

      	}  
    	if (type.equals("lunch")) {
            List<Lunch> results = diaryService.searchLunch(query);
            model.addAttribute("results", results);

      	}
    	if (type.equals("snack")) {
            List<Snack> results = diaryService.searchSnack(query);
            model.addAttribute("results", results);

      	}
    	
    	
    	
    	
    	
        model.addAttribute("type", type);
        model.addAttribute("query", query);
        model.addAttribute("userId",session.getAttribute("user"));
        model.addAttribute("caloriesIn", diary.getCaloriesin());
        
        
        return "foodDiary.jsp";
    }

    @PostMapping("/addToDiary/{userId}/{foodId}")
    public String addToDiary(@PathVariable("foodId") Long foodId, @PathVariable("userId") Long userId, Model model, HttpSession session, @RequestParam("type") String type) {
    	User user = userservice.findById(userId);
    	int newcals = 0;
        
        
        Diary diary = user.getDiary();
        System.out.println(diary);
    	
    	
    	
//    	if (session.getAttribute("caloriesIn") == null) {
//    	session.setAttribute("caloriesIn" , 0);
//    	}
    	/*if (session.getAttribute("proteinIn") == null) {
        	session.setAttribute("proteinIn" , 0);
        	}*/
    	
    	if (type.equals("breakfast")) {
            Brinner brinner = diaryService.findBrinner(foodId);
            int brinnerCal = brinner.getCalories();
             newcals = diary.getCaloriesin() + brinnerCal;
             diary.setCaloriesin(newcals);
             diaryService.addBrinnerItem(diary, brinner);



    		
    		
    	}
    	
    	if (type.equals("lunch")) {
            Lunch lunch = diaryService.findLunch(foodId);
            int lunchCal = lunch.getCalories();
             newcals = diary.getCaloriesin() + lunchCal;
             diary.setCaloriesin(newcals);
             diaryService.addLunchItem(diary, lunch);

    	}
    	
    	
    	if (type.equals("dinner")) {
            Brinner brinner = diaryService.findBrinner(foodId);
            int brinnerCal = brinner.getCalories();
             newcals =  diary.getCaloriesin() + brinnerCal;
             diary.setCaloriesin(newcals);
             diaryService.addBrinnerItem(diary, brinner);



    		
    		
    	}
    	if (type.equals("snack")) {
            Snack snack = diaryService.findSnack(foodId);
            int SnackCal = snack.getCalories();
             newcals = diary.getCaloriesin() + SnackCal;
             diary.setCaloriesin(newcals);
             diaryService.addSnackItem(diary, snack);
             



    		
    		
    	}
    
    	LocalTime now = LocalTime.now();
    	DateTimeFormatter formatter = DateTimeFormatter.ofPattern("HH:mm");
    	String formattedTime = now.format(formatter);
    	if(formattedTime == "00:00") {
    		 diaryService.reset(diary);
    	}
        
     
		/*
		 * double brinnerPro =( brinner.getProtein() * 4) / brinnerCal ;
		 */		/*
		 * double newPros = (double) session.getAttribute("proteinIn") + brinnerPro;
		 */        
//        session.setAttribute("caloriesIn", newcals);
		/*
		 * session.setAttribute("proteinIn", newPros);
		 */ 
    	diary.setCaloriesin(newcals);
    	model.addAttribute("caloriesIn", diary.getCaloriesin());
    
    	System.out.println(diary.getCaloriesin());
        
        return "redirect:/profile/{userId}/foodDiary";
    }
    
    
    
    @DeleteMapping("/removeFromDiary/{userId}/{foodId}")
    public String removeToDiary(@PathVariable("foodId") Long foodId, @PathVariable("userId") Long userId, Model model, HttpSession session,  @RequestParam("type") String type) {
    
        User user = userservice.findById(userId);
        Diary diary = user.getDiary();
        
        int newcals = 0;
        
        
        
        
        
        if (type.equals("breakfast")) {
            Brinner brinner = diaryService.findBrinner(foodId);
            int brinnerCal = brinner.getCalories();
             newcals = diary.getCaloriesin() - brinnerCal;
             diary.setCaloriesin(newcals);
             diaryService.removeBrinnerItem(diary, brinner);



    		
    		
    	}
    	
    	if (type.equals("lunch")) {
            Lunch lunch = diaryService.findLunch(foodId);
            int lunchCal = lunch.getCalories();
             newcals = diary.getCaloriesin() - lunchCal;
             diary.setCaloriesin(newcals);
             diaryService.removelunchItem(diary, lunch);

    	}
    	
    	
    	if (type.equals("dinner")) {
            Brinner brinner = diaryService.findBrinner(foodId);
            int brinnerCal = brinner.getCalories();
             newcals = diary.getCaloriesin() - brinnerCal;
             diary.setCaloriesin(newcals);
             diaryService.removeBrinnerItem(diary, brinner);



    		
    		
    	}
    	if (type.equals("snack")) {
            Snack snack = diaryService.findSnack(foodId);
            int SnackCal = snack.getCalories();
             newcals = diary.getCaloriesin() - SnackCal;
             diary.setCaloriesin(newcals);
             diaryService.removeSnackItem(diary, snack);



    		
    		
    	}
        
        
        
        
        
       /* double brinnerPro =( brinner.getProtein() * 4) / brinnerCal ;
        double newPros = (double) session.getAttribute("proteinIn") + brinnerPro;*/
//        session.setAttribute("caloriesIn", newcals);
/*        session.setAttribute("proteinIn", newPros);
*/        
    	diary.setCaloriesin(newcals);
    	model.addAttribute("caloriesIn", diary.getCaloriesin());
    
        System.out.println(diary.getCaloriesin());
       
        return "redirect:/profile/{userId}/foodDiary";
    }
    
    
    
    
    
    
    
}


    





