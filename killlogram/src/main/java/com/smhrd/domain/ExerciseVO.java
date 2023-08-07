package com.smhrd.domain;

import java.sql.Date;


public class ExerciseVO {
	private int exercise_idx;
	private String user_id;
	private Float user_weight;
	private int exercise_time;
	private Float exercise_strength;
	private Float o2_waste;
	private Float calories_waste;
    private Date created_at;
    
	public ExerciseVO() {
		super();
	}
	

	public ExerciseVO(String user_id, Float calories_waste, Date created_at) {
		super();
		this.calories_waste = calories_waste;
		this.created_at = created_at;
	}


	public ExerciseVO(String user_id, Float user_weight, int exercise_time, Float exercise_strength, Float o2_waste,
			Float calories_waste, Date created_at) {
		super();
		this.user_id = user_id;
		this.user_weight = user_weight;
		this.exercise_time = exercise_time;
		this.exercise_strength = exercise_strength;
		this.o2_waste = o2_waste;
		this.calories_waste = calories_waste;
		this.created_at = created_at;
	}


	public ExerciseVO(int exercise_idx, String user_id, Float user_weight, int exercise_time, Float exercise_strength,
			Float o2_waste, Float calories_waste, Date created_at) {
		super();
		this.exercise_idx = exercise_idx;
		this.user_id = user_id;
		this.user_weight = user_weight;
		this.exercise_time = exercise_time;
		this.exercise_strength = exercise_strength;
		this.o2_waste = o2_waste;
		this.calories_waste = calories_waste;
		this.created_at = created_at;
	}

	public int getExercise_idx() {
		return exercise_idx;
	}

	public void setExercise_idx(int exercise_idx) {
		this.exercise_idx = exercise_idx;
	}

	public String getUser_id() {
		return user_id;
	}

	public void setUser_id(String user_id) {
		this.user_id = user_id;
	}

	public Float getUser_weight() {
		return user_weight;
	}

	public void setUser_weight(Float user_weight) {
		this.user_weight = user_weight;
	}

	public int getExercise_time() {
		return exercise_time;
	}

	public void setExercise_time(int exercise_time) {
		this.exercise_time = exercise_time;
	}

	public Float getExercise_strength() {
		return exercise_strength;
	}

	public void setExercise_strength(Float exercise_strength) {
		this.exercise_strength = exercise_strength;
	}

	public Float getO2_waste() {
		return o2_waste;
	}

	public void setO2_waste(Float o2_waste) {
		this.o2_waste = o2_waste;
	}

	public Float getCalories_waste() {
		return calories_waste;
	}

	public void setCalories_waste(Float calories_waste) {
		this.calories_waste = calories_waste;
	}

	public Date getCreated_at() {
		return created_at;
	}

	public void setCreated_at(Date created_at) {
		this.created_at = created_at;
	}
    
    
    
	

}
