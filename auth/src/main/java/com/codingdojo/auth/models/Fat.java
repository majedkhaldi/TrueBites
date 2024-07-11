package com.codingdojo.auth.models;

import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;

@Entity
public class Fat {
	
	@Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;
	
	private String food;
    private double calories;
    private int carbohydrates;
    private double protein;
    private double fat;
    private String type;
    private int recommended;
	
    public Fat() {
    	
    }

	public Long getId() {
		return id;
	}

	public void setId(Long id) {
		this.id = id;
	}

	public String getFood() {
		return food;
	}

	public void setFood(String food) {
		this.food = food;
	}

	public double getCalories() {
		return calories;
	}

	public void setCalories(double calories) {
		this.calories = calories;
	}

	public int getCarbohydrates() {
		return carbohydrates;
	}

	public void setCarbohydrates(int carbohydrates) {
		this.carbohydrates = carbohydrates;
	}

	public double getProtein() {
		return protein;
	}

	public void setProtein(double protein) {
		this.protein = protein;
	}

	public double getFat() {
		return fat;
	}

	public void setFat(double fat) {
		this.fat = fat;
	}

	public String getType() {
		return type;
	}

	public void setType(String type) {
		this.type = type;
	}

	public int getRecommended() {
		return recommended;
	}

	public void setRecommended(int recommended) {
		this.recommended = recommended;
	}
    
    

}
