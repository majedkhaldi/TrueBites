package com.codingdojo.auth.models;

import java.util.ArrayList;
import java.util.List;

public class MealPlan {
    private List<Brinner> breakfast;
    private List<Snack> snack1;
    private List<Lunch> lunch;
    private List<Snack> snack2;
    private List<Brinner> dinner;

    public MealPlan() {}

	public List<Brinner> getBreakfast() {
		return breakfast;
	}

	public void setBreakfast(List<Brinner> breakfast) {
		this.breakfast = breakfast;
	}

	public List<Snack> getSnack1() {
		return snack1;
	}

	public void setSnack1(List<Snack> snack1) {
		this.snack1 = snack1;
	}

	public List<Lunch> getLunch() {
		return lunch;
	}

	public void setLunch(List<Lunch> lunch) {
		this.lunch = lunch;
	}

	public List<Snack> getSnack2() {
		return snack2;
	}

	public void setSnack2(List<Snack> snack2) {
		this.snack2 = snack2;
	}

	public List<Brinner> getDinner() {
		return dinner;
	}

	public void setDinner(List<Brinner> dinner) {
		this.dinner = dinner;
	}
    
}


