package com.cafe24.kyungsu93.diet.service;

public class TotalCalorieResponse {
	private String memberNo;
	private String foodName;
	private int ingestWeight;
	private double totalOnce;
	private double totalKcal;
	private double totalCarbohydrate;
	private double totalProtein;
	private double totalFat;
	private double totalSugar;
	private double totalNatrium;
	private double totalCholesterol;
	private double totalSfa;
	public String getMemberNo() {
		return memberNo;
	}
	public void setMemberNo(String memberNo) {
		this.memberNo = memberNo;
	}
	public String getFoodName() {
		return foodName;
	}
	public void setFoodName(String foodName) {
		this.foodName = foodName;
	}
	public int getIngestWeight() {
		return ingestWeight;
	}
	public void setIngestWeight(int ingestWeight) {
		this.ingestWeight = ingestWeight;
	}
	public double getTotalOnce() {
		return totalOnce;
	}
	public void setTotalOnce(double totalOnce) {
		this.totalOnce = totalOnce;
	}
	public double getTotalKcal() {
		return totalKcal;
	}
	public void setTotalKcal(double totalKcal) {
		this.totalKcal = totalKcal;
	}
	public double getTotalCarbohydrate() {
		return totalCarbohydrate;
	}
	public void setTotalCarbohydrate(double totalCarbohydrate) {
		this.totalCarbohydrate = totalCarbohydrate;
	}
	public double getTotalProtein() {
		return totalProtein;
	}
	public void setTotalProtein(double totalProtein) {
		this.totalProtein = totalProtein;
	}
	
	public double getTotalFat() {
		return totalFat;
	}
	public void setTotalFat(double totalFat) {
		this.totalFat = totalFat;
	}
	public double getTotalSugar() {
		return totalSugar;
	}
	public void setTotalSugar(double totalSugar) {
		this.totalSugar = totalSugar;
	}
	public double getTotalNatrium() {
		return totalNatrium;
	}
	public void setTotalNatrium(double totalNatrium) {
		this.totalNatrium = totalNatrium;
	}
	public double getTotalCholesterol() {
		return totalCholesterol;
	}
	public void setTotalCholesterol(double totalCholesterol) {
		this.totalCholesterol = totalCholesterol;
	}
	public double getTotalSfa() {
		return totalSfa;
	}
	public void setTotalSfa(double totalSfa) {
		this.totalSfa = totalSfa;
	}
	@Override
	public String toString() {
		return "TotalCalorieResponse [memberNo=" + memberNo + ", foodName=" + foodName + ", ingestWeight="
				+ ingestWeight + ", totalOnce=" + totalOnce + ", totalKcal=" + totalKcal + ", totalCarbohydrate="
				+ totalCarbohydrate + ", totalProtein=" + totalProtein + ", totalFat=" + totalFat + ", totalSugar="
				+ totalSugar + ", totalNatrium=" + totalNatrium + ", totalCholesterol=" + totalCholesterol
				+ ", totalSfa=" + totalSfa + "]";
	}
	
	
}
