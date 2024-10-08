package com.codingdojo.auth.services;

import java.util.ArrayList;
import java.util.Collections;
import java.util.List;
import java.util.Random;
import java.util.stream.Collectors;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.codingdojo.auth.models.Brinner;
import com.codingdojo.auth.models.Fat;
import com.codingdojo.auth.models.Lunch;
import com.codingdojo.auth.models.MealPlan;
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
        int breakfastCalories = dailyCalories * 25 / 100;
        int lunchCalories = dailyCalories * 30 / 100;
        int snackCalories = dailyCalories * 10 / 100;
        int dinnerCalories = dailyCalories * 25 / 100;

        List<Brinner> recommendedBrinner = brinnerRepo.findByRecommended(1);
        List<Lunch> recommendedLunch = lunchRepo.findByRecommended(1);
        List<Snack> recommendedSnack = snackRepo.findByRecommended(1);
        List<Fat> recommendedFats = fatsRepo.findByRecommended(1);

        List<MealPlan> mealPlans = new ArrayList<>();
        for (int i = 0; i < 3; i++) {
            MealPlan mealPlan = new MealPlan();

            // Select random items for breakfast, lunch, and dinner
            mealPlan.setBreakfast(selectMealItems(recommendedBrinner, breakfastCalories, "breakfast"));
            mealPlan.setLunch(selectMealItemsL(recommendedLunch, lunchCalories, "lunch"));
            mealPlan.setDinner(selectMealItems(recommendedBrinner, dinnerCalories, "dinner"));

            // Select random items for snacks
            mealPlan.setSnack1(selectMealItemsS(recommendedSnack, snackCalories, "snack1"));
            mealPlan.setSnack2(selectMealItemsS(recommendedSnack, snackCalories, "snack2"));

            mealPlans.add(mealPlan);
        }

        return mealPlans;
    }

    private List<Brinner> selectMealItems(List<Brinner> items, int targetCalories, String mealType) {
        List<Brinner> selectedItems = new ArrayList<>();
        List<Brinner> fruits = items.stream().filter(item -> "fruits".equals(item.getType())).collect(Collectors.toList());
        List<Brinner> vegetables = items.stream().filter(item -> "vegetables".equals(item.getType())).collect(Collectors.toList());
        List<Brinner> carbs = items.stream().filter(item -> "carbs".equals(item.getType())).collect(Collectors.toList());
        List<Brinner> dairy = items.stream().filter(item -> "dairy".equals(item.getType())).collect(Collectors.toList());
        int totalCalories = 0;
        boolean hasFruit = false;
        boolean hasCarbs = false;
        boolean hasDairy = false;
        int vegetableCount = 0;

        if (!fruits.isEmpty()) {
            Brinner fruit = fruits.get(new Random().nextInt(fruits.size()));
            selectedItems.add(fruit);
            totalCalories += fruit.getCalories();
            hasFruit = true;
        }

        if (!vegetables.isEmpty()) {
            for (int i = 0; i < 2; i++) {
                Brinner vegetable = vegetables.get(new Random().nextInt(vegetables.size()));
                selectedItems.add(vegetable);
                totalCalories += vegetable.getCalories();
                vegetableCount++;
            }
        }
        if (!carbs.isEmpty()) {
            Brinner carb = carbs.get(new Random().nextInt(carbs.size()));
            selectedItems.add(carb);
            totalCalories += carb.getCalories();
            hasCarbs = true;
        }
        if (!dairy.isEmpty()) {
            Brinner dai = dairy.get(new Random().nextInt(dairy.size()));
            selectedItems.add(dai);
            totalCalories += dai.getCalories();
            hasDairy = true;
        }

        // Add other items to meet the target calories
        List<Brinner> remainingItems = items.stream()
                                            .filter(item -> !selectedItems.contains(item))
                                            .collect(Collectors.toList());
        Collections.shuffle(remainingItems);

        for (Brinner item : remainingItems) {
            if (totalCalories + item.getCalories() <= targetCalories + 50) {
                selectedItems.add(item);
                totalCalories += item.getCalories();
            }
            if (totalCalories >= targetCalories - 50 && hasFruit && vegetableCount >= 2 && hasCarbs && hasDairy) {
                break;
            }
        }

        // Ensure meal meets the calorie requirement within the margin
        if (totalCalories < targetCalories - 50) {
            // Optionally handle cases where the selected items do not meet the target calories
        }

        return selectedItems;
    }

    
    private List<Lunch> selectMealItemsL(List<Lunch> items, int targetCalories, String mealType) {
        List<Lunch> selectedItems = new ArrayList<>();
        List<Lunch> fruits = items.stream().filter(item -> "fruits".equals(item.getType())).collect(Collectors.toList());
        List<Lunch> vegetables = items.stream().filter(item -> "vegetables".equals(item.getType())).collect(Collectors.toList());
        List<Lunch> carbs = items.stream().filter(item -> "carbs".equals(item.getType())).collect(Collectors.toList());
        List<Lunch> meats = items.stream().filter(item -> "meats".equals(item.getType())).collect(Collectors.toList());
        int totalCalories = 0;
        boolean hasFruit = false;
        boolean hasCarbs = false;
        boolean hasMeats = false;
        int vegetableCount = 0;

        // Add at least one fruit
        if (!fruits.isEmpty()) {
        	Lunch fruit = fruits.get(new Random().nextInt(fruits.size()));
            selectedItems.add(fruit);
            totalCalories += fruit.getCalories();
            hasFruit = true;
        }

        // Add at least two vegetables
        if (!vegetables.isEmpty()) {
            for (int i = 0; i < 2; i++) {
            	Lunch vegetable = vegetables.get(new Random().nextInt(vegetables.size()));
                selectedItems.add(vegetable);
                totalCalories += vegetable.getCalories();
                vegetableCount++;
            }
        }
        if (!carbs.isEmpty()) {
            Lunch carb = carbs.get(new Random().nextInt(carbs.size()));
            selectedItems.add(carb);
            totalCalories += carb.getCalories();
            hasCarbs = true;
        }
        if (!meats.isEmpty()) {
            Lunch meat = meats.get(new Random().nextInt(meats.size()));
            selectedItems.add(meat);
            totalCalories += meat.getCalories();
            hasMeats = true;
        }

        // Add other items to meet the target calories
        List<Lunch> remainingItems = items.stream()
                                            .filter(item -> !selectedItems.contains(item))
                                            .collect(Collectors.toList());
        Collections.shuffle(remainingItems);

        for (Lunch item : remainingItems) {
            if (totalCalories + item.getCalories() <= targetCalories + 50) {
                selectedItems.add(item);
                totalCalories += item.getCalories();
            }
            if (totalCalories >= targetCalories - 50 && hasFruit && vegetableCount >= 2 && hasCarbs && hasMeats) {
                break;
            }
        }

        // Ensure meal meets the calorie requirement within the margin
        if (totalCalories < targetCalories - 50) {
            // Optionally handle cases where the selected items do not meet the target calories
        }

        return selectedItems;
    }
    private List<Snack> selectMealItemsS(List<Snack> items, int targetCalories, String mealType) {
        List<Snack> selectedItems = new ArrayList<>();
        List<Snack> fruits = items.stream().filter(item -> "fruits".equals(item.getType())).collect(Collectors.toList());
        List<Snack> nuts = items.stream().filter(item -> "nuts".equals(item.getType())).collect(Collectors.toList());
        int totalCalories = 0;
        boolean hasFruit = false;
        boolean hasNuts = false;
        // Add at least one fruit
        if (!fruits.isEmpty()) {
        	Snack fruit = fruits.get(new Random().nextInt(fruits.size()));
            selectedItems.add(fruit);
            totalCalories += fruit.getCalories();
            hasFruit = true;
        }
        if (!nuts.isEmpty()) {
        	Snack nut = nuts.get(new Random().nextInt(nuts.size()));
            selectedItems.add(nut);
            totalCalories += nut.getCalories();
            hasNuts = true;
        }

        

        // Add other items to meet the target calories
        List<Snack> remainingItems = items.stream()
                                            .filter(item -> !selectedItems.contains(item))
                                            .collect(Collectors.toList());
        Collections.shuffle(remainingItems);

        for (Snack item : remainingItems) {
            if (totalCalories + item.getCalories() <= targetCalories + 50) {
                selectedItems.add(item);
                totalCalories += item.getCalories();
            }
            if (totalCalories >= targetCalories - 50 && hasFruit && hasNuts) {
                break;
            }
        }

        // Ensure meal meets the calorie requirement within the margin
        if (totalCalories < targetCalories - 50) {
            // Optionally handle cases where the selected items do not meet the target calories
        }

        return selectedItems;
    }

    
    
    }


