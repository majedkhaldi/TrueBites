package com.codingdojo.auth.controllers;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.codingdojo.auth.models.User;
import com.codingdojo.auth.services.MealPlanService;
import com.codingdojo.auth.services.UserService;

import ch.qos.logback.core.model.Model;

@Controller
public class MealPlanController {

    @Autowired
    private MealPlanService mealPlanService;
    
    @Autowired
    private UserService userService;

    @PostMapping("/generateMealPlans")
    public String generateMealPlans(@RequestParam Long userId, Model model) {
        User user = userService.findById(userId);
        List<MealPlan> mealPlans = mealPlanService.generateMealPlans(user);
        model.addAttribute("mealPlans", mealPlans);
        return "mealPlans.jsp";
    }
}
