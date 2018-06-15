package com.cafe24.kyungsu93.food.service;

public class Food {
	private String foodNo;
	private String foodGroup;
	private String foodName;
	private int foodOnce;
	private double foodKcal;
	private double foodCarbohydrate;
	private double foodProtein;
	private double foodFat;
	private double foodSugar;
	private double foodNatrium;
	private double foodCholesterol;
	private double foodSfa;
	private double foodTransfat;
	private int foodBuildYear;
	
	public String getFoodNo() {
		return foodNo;
	}
	public void setFoodNo(String foodNo) {
		this.foodNo = foodNo;
	}
	public String getFoodGroup() {
		return foodGroup;
	}
	public void setFoodGroup(String foodGroup) {
		this.foodGroup = foodGroup;
	}
	public String getFoodName() {
		return foodName;
	}
	public void setFoodName(String foodName) {
		this.foodName = foodName;
	}
	public int getFoodOnce() {
		return foodOnce;
	}
	public void setFoodOnce(int foodOnce) {
		this.foodOnce = foodOnce;
	}
	public double getFoodKcal() {
		return foodKcal;
	}
	public void setFoodKcal(double foodKcal) {
		this.foodKcal = foodKcal;
	}
	public double getFoodCarbohydrate() {
		return foodCarbohydrate;
	}
	public void setFoodCarbohydrate(double foodCarbohydrate) {
		this.foodCarbohydrate = foodCarbohydrate;
	}
	public double getFoodProtein() {
		return foodProtein;
	}
	public void setFoodProtein(double foodProtein) {
		this.foodProtein = foodProtein;
	}
	public double getFoodFat() {
		return foodFat;
	}
	public void setFoodFat(double foodFat) {
		this.foodFat = foodFat;
	}
	public double getFoodSugar() {
		return foodSugar;
	}
	public void setFoodSugar(double foodSugar) {
		this.foodSugar = foodSugar;
	}
	public double getFoodNatrium() {
		return foodNatrium;
	}
	public void setFoodNatrium(double foodNatrium) {
		this.foodNatrium = foodNatrium;
	}
	public double getFoodCholesterol() {
		return foodCholesterol;
	}
	public void setFoodCholesterol(double foodCholesterol) {
		this.foodCholesterol = foodCholesterol;
	}
	public double getFoodSfa() {
		return foodSfa;
	}
	public void setFoodSfa(double foodSfa) {
		this.foodSfa = foodSfa;
	}
	public double getFoodTransfat() {
		return foodTransfat;
	}
	public void setFoodTransfat(double foodTransfat) {
		this.foodTransfat = foodTransfat;
	}
	public int getFoodBuildDate() {
		return foodBuildYear;
	}
	public void setFoodBuildDate(int foodBuildYear) {
		this.foodBuildYear = foodBuildYear;
	}
	@Override
	public String toString() {
		return "Food [foodNo=" + foodNo + ", foodGroup=" + foodGroup + ", foodName=" + foodName
				+ ", foodOnce=" + foodOnce + ", foodKcal=" + foodKcal + ", foodCarbohydrate=" + foodCarbohydrate
				+ ", foodProtein=" + foodProtein + ", foodFat=" + foodFat + ", foodSugar=" + foodSugar
				+ ", foodNatrium=" + foodNatrium + ", foodCholesterol=" + foodCholesterol + ", foodSfa=" + foodSfa
				+ ", foodTransfat=" + foodTransfat + ", foodBuildYear=" + foodBuildYear + "]";
	}
}
