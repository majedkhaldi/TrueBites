package com.codingdojo.auth.controllers;

import java.security.Principal;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.codingdojo.auth.models.Diary;
import com.codingdojo.auth.models.User;
import com.codingdojo.auth.services.DiaryService;
import com.codingdojo.auth.services.UserService;
import com.codingdojo.auth.validator.UserValidator;

import jakarta.servlet.http.HttpSession;
import jakarta.validation.Valid;



@Controller
public class UserController {
	private UserService userService;
	@Autowired
	DiaryService diaryService;
	
	// NEW
    private UserValidator userValidator;
    
    // NEW
    public UserController(UserService userService, UserValidator userValidator) {
        this.userService = userService;
        this.userValidator = userValidator;
    }

    
    @RequestMapping("/registrationPage")
    public String registerForm(@ModelAttribute("user") User user) {
        return "registrationPage.jsp";
    }
    
    @PostMapping("/register")
    public String registration(@Valid @ModelAttribute("user") User user, BindingResult result, Model model) {
        // NEW
        userValidator.validate(user, result);
        if (result.hasErrors()) {
            return "registrationPage.jsp";
        }
        
        userService.saveUserWithAdminRole(user);
        return "redirect:/";
    }
    
 // NEW 
    @RequestMapping("/admin")
    public String adminPage(Principal principal, Model model) {
        String username = principal.getName();
        model.addAttribute("currentUser", userService.findByUsername(username));
        return "adminPage.jsp";
    }

    @RequestMapping("/login")
    public String login(@Valid @ModelAttribute("user") User user, BindingResult result,@RequestParam(value="error", required=false) String error, @RequestParam(value="logout", required=false) String logout,Model model) {
        if(error!=null ) {
            model.addAttribute("errorMessage", "Invalid Credentials, Please try again.");
        }
        if(logout != null) {
            model.addAttribute("logoutMessage", "Logout Successful!");
        }
        
        
        System.out.println("--------->");
        return "registrationPage.jsp";
    }
    
    
    @RequestMapping(value = {"/", "/home"})
	 public String home(Principal principal, Model model) {
	        // 1
	        String username = principal.getName();
	        model.addAttribute("currentUser", userService.findByUsername(username));
	        return "homePage.jsp";
	    }
    
    @PostMapping("/calculate/{id}")
	public String calculations(Model model, 
			HttpSession session, 
			@PathVariable("id") Long id, 
			@RequestParam("height") int h,
			@RequestParam("weight") int w,
			@RequestParam("gender") String g,
			@RequestParam("age") int a,
			@RequestParam("activity") double act,
			@RequestParam("goal") int goal) {
		User thisuser = userService.findById(id);
	System.out.println("*******" + thisuser.getId());
		thisuser.setHeight(h);
		thisuser.setWeight(w);
		thisuser.setGender(g);
		thisuser.setAge(a);
		thisuser.setActivitylevel(act);
		thisuser.setGoal(goal);

		
		
		if (thisuser.getAge()<18) {
			return "under-18.jsp";
		}
		double idealWeight = 0;
		int bmr = 0;
		int eer = 0;
		if(g.equals("f")) {
			 idealWeight = 45.5 + (0.91 * (h - 152.4));
			 bmr = (int) ((10*w) + (6.25*h) - (5*a) - 161);
			
		}
		else if(g.equals("m")) {
			 idealWeight = 50 + (0.91 * (h - 152.4));
			 bmr = (int) ((10 * w) + (6.25 * h) - (5 * a) + 5);
		}
		
		int tdee = (int) (bmr * act);
		double bmi = w / ((h/100)^2);
		
		switch(goal) {
			case 1:
				eer = tdee - 700;
				break;
			case 2:
				eer = tdee + 700;
				break;
			default:
				eer = tdee;
		}
		Diary diary = new Diary();
        diary.setUser(thisuser);
        diary.setCalories(eer);
        thisuser.setDiary(diary);
        diaryService.saveDiary(diary);
		session.setAttribute("bmi", bmi);
		thisuser.setEer(eer);
		userService.updateUser(thisuser);
		session.setAttribute("eer", eer);
		session.setAttribute("idealWeight", idealWeight);
		return"redirect:/profile/{id}";
		
	}
	
	@GetMapping("/profile/{id}")
	public String showProfile(@PathVariable("id") Long id, HttpSession session, Model model) {
		User thisuser = userService.findById(id);
		if(thisuser.getAge()<18) {
			return "redirect:/logoutt";
		}
		double bmiValue = (double) session.getAttribute("bmi");
		if (bmiValue <18.5) {
			thisuser.setBmi("Underweight");
			userService.updateUser(thisuser);
		}
		else if (18.5 < bmiValue && bmiValue <24.9) {
			thisuser.setBmi("Healthy Weight");
			userService.updateUser(thisuser);
		}
		else if (25.0 < bmiValue && bmiValue <29.9) {
			thisuser.setBmi("Overweight");
			userService.updateUser(thisuser);
		}
		else if (30.0 < bmiValue) {
			thisuser.setBmi("Obese");
			userService.updateUser(thisuser);
		}
		System.out.println("**=============****" + thisuser.getWeight());
		model.addAttribute("thisuser", thisuser);
		model.addAttribute("choreq", (int)((int)session.getAttribute("eer")*0.45));
		model.addAttribute("proreq", (int)((int)session.getAttribute("eer")*0.35));
		model.addAttribute("fatreq", (int)((int)session.getAttribute("eer")*0.20));
		
		return "profile.jsp";

	}
	//Additional info form
	@GetMapping("/more")
	public String moreForm( Principal principal, Model model) {
		String thisusername= principal.getName();
		User user = userService.findByUsername(thisusername);
		Long id = user.getId();
		model.addAttribute("user", id);

		if(user.getGender() == null) {
			return "additionalInfo.jsp";
		}

		
		return "redirect:/profile/" + user.getId();
	}
	@GetMapping("/logoutt")
	public String logoutt(Principal principal) {
		principal= null;
		return "redirect:/";
	}

}

