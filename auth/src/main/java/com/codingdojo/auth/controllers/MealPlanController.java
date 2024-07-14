package com.codingdojo.auth.controllers;

import java.security.Principal;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import com.codingdojo.auth.models.MealPlan;
import com.codingdojo.auth.models.User;
import com.codingdojo.auth.services.MealPlanService;
import com.codingdojo.auth.services.UserService;


@Controller
public class MealPlanController {

    @Autowired
    private MealPlanService mealPlanService;
    @Autowired
    private UserService userService;

    @GetMapping("/generateMealPlans")
    public String generateMealPlans(Principal pr, Model model) {
    	Long userId = (userService.findByUsername(pr.getName())).getId();
        User user = userService.findById(userId);
        List<MealPlan> mealPlans = mealPlanService.generateMealPlans(user);
        model.addAttribute("mealPlans", mealPlans);
        model.addAttribute("user", user);
        return "mealGenerator.jsp";
    }
}
