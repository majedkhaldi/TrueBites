package com.codingdojo.auth.services;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.codingdojo.auth.models.Brinner;
import com.codingdojo.auth.models.Lunch;
import com.codingdojo.auth.models.Snack;
import com.codingdojo.auth.models.User;
import com.codingdojo.auth.repositories.BrinnerRepository;
import com.codingdojo.auth.repositories.FatsRepository;
import com.codingdojo.auth.repositories.LunchRepository;
import com.codingdojo.auth.repositories.SnackRepository;

@Service
public class MealPlanService {

    @Autowired
    private BrinnerRepository brinnerRepo;

    @Autowired
    private LunchRepository lunchRepo;

    @Autowired
    private SnackRepository snackRepo;

    @Autowired
    private FatsRepository fatsRepo;

    public List<MealPlan> generateMealPlans(User user) {
        int dailyCalories = user.getEer();
        int breakfastCalories = dailyCalories * 20 / 100;
        int lunchCalories = dailyCalories * 30 / 100;
        int snackCalories = dailyCalories * 15 / 100;
        int dinnerCalories = dailyCalories * 20 / 100;

        List<Brinner> recommendedBrinner = brinnerRepo.findByRecommended(true);
        List<Lunch> recommendedLunch = lunchRepo.findByRecommended(true);
        List<Snack> recommendedSnack = snackRepo.findByRecommended(true);
        List<Fats> recommendedFats = fatsRepo.findByRecommended(true);

        // Generate meal plans based on the requirements

        return mealPlans;
    }
}

