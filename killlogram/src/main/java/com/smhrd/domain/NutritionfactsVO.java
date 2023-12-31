package com.smhrd.domain;

public class NutritionfactsVO {
	private int nutri_idx;
    private String food_name;
    private Float calories;
    private Float protein;
    private Float carbohydrate;
    private Float fat;
    private int intake;
    private String unit;

    // 기본 생성자
    public NutritionfactsVO() {
    }

	public NutritionfactsVO(String food_name, Float calories) {
		super();
		this.food_name = food_name;
		this.calories = calories;
	}

	public NutritionfactsVO(int nutri_idx, String food_name, Float calories, Float protein, Float carbohydrate,
			Float fat, int intake, String unit) {
		super();
		this.nutri_idx = nutri_idx;
		this.food_name = food_name;
		this.calories = calories;
		this.protein = protein;
		this.carbohydrate = carbohydrate;
		this.fat = fat;
		this.intake = intake;
		this.unit = unit;
	}

	public int getNutri_idx() {
		return nutri_idx;
	}

	public void setNutri_idx(int nutri_idx) {
		this.nutri_idx = nutri_idx;
	}

	public String getFood_name() {
		return food_name;
	}

	public void setFood_name(String food_name) {
		this.food_name = food_name;
	}

	public Float getCalories() {
		return calories;
	}

	public void setCalories(Float calories) {
		this.calories = calories;
	}

	public Float getProtein() {
		return protein;
	}

	public void setProtein(Float protein) {
		this.protein = protein;
	}

	public Float getCarbohydrate() {
		return carbohydrate;
	}

	public void setCarbohydrate(Float carbohydrate) {
		this.carbohydrate = carbohydrate;
	}

	public Float getFat() {
		return fat;
	}

	public void setFat(Float fat) {
		this.fat = fat;
	}

	public int getIntake() {
		return intake;
	}

	public void setIntake(int intake) {
		this.intake = intake;
	}

	public String getUnit() {
		return unit;
	}

	public void setUnit(String unit) {
		this.unit = unit;
	}

    
	

}