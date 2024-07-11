package com.codingdojo.auth.models;

import java.util.ArrayList;
import java.util.List;

public class Meal {
	    private List<FoodItem> items = new ArrayList<>();

	    public void addItem(FoodItem item) {
	        items.add(item);
	    }

	    public void clearItems() {
	        items.clear();
	    }

	    // Getters and Setters
	}
}
