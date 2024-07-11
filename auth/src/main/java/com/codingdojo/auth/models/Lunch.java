package com.codingdojo.auth.models;

import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;

@Entity
public class Lunch {

	@Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;
	
	private String food;
    private int calories;
    private int carbohydrates;
    private int protein;
    private int fat;
    private String type;
    private int recommended;
	
    public Lunch() {
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

	public int getCalories() {
		return calories;
	}

	public void setCalories(int calories) {
		this.calories = calories;
	}

	public int getCarbohydrates() {
		return carbohydrates;
	}

	public void setCarbohydrates(int carbohydrates) {
		this.carbohydrates = carbohydrates;
	}

	public int getProtein() {
		return protein;
	}

	public void setProtein(int protein) {
		this.protein = protein;
	}

	public int getFat() {
		return fat;
	}

	public void setFat(int fat) {
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
