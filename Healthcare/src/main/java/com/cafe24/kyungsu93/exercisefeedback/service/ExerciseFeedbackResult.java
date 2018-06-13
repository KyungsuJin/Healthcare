package com.cafe24.kyungsu93.exercisefeedback.service;

public class ExerciseFeedbackResult {
	private String exerciseFeedbackRequestNo;
	private String exerciseFeedbackTitle;
	private String exerciseFeedbackContent;
	private String exerciseFeedbackResultDate;
	private String foodInfoNo;
	private int ingestionAmount;
	private String foodFeedbackDate;
	private String exerciseNo;
	private int exerciseTime;
	private String exerciseFeedbackDate;
	private int exerciseFeedbackEvaluationGrade;
	private String exerciseFeedbackEvaluationDate;
	private String foodGroup;
	private String foodName;
	private int foodOnece;
	private Double foodKcal;
	private Double foodCarbohydrate;
	private Double foodProtein;
	private Double foodFat;
	private Double foodSugar;
	private Double foodNatrium;
	private Double foodCholesterol;
	private Double foodTransfat;
	public String getExerciseFeedbackRequestNo() {
		return exerciseFeedbackRequestNo;
	}
	public void setExerciseFeedbackRequestNo(String exerciseFeedbackRequestNo) {
		this.exerciseFeedbackRequestNo = exerciseFeedbackRequestNo;
	}
	public String getExerciseFeedbackTitle() {
		return exerciseFeedbackTitle;
	}
	public void setExerciseFeedbackTitle(String exerciseFeedbackTitle) {
		this.exerciseFeedbackTitle = exerciseFeedbackTitle;
	}
	public String getExerciseFeedbackContent() {
		return exerciseFeedbackContent;
	}
	public void setExerciseFeedbackContent(String exerciseFeedbackContent) {
		this.exerciseFeedbackContent = exerciseFeedbackContent;
	}
	public String getExerciseFeedbackResultDate() {
		return exerciseFeedbackResultDate;
	}
	public void setExerciseFeedbackResultDate(String exerciseFeedbackResultDate) {
		this.exerciseFeedbackResultDate = exerciseFeedbackResultDate;
	}
	public String getFoodInfoNo() {
		return foodInfoNo;
	}
	public void setFoodInfoNo(String foodInfoNo) {
		this.foodInfoNo = foodInfoNo;
	}
	public int getIngestionAmount() {
		return ingestionAmount;
	}
	public void setIngestionAmount(int ingestionAmount) {
		this.ingestionAmount = ingestionAmount;
	}
	public String getFoodFeedbackDate() {
		return foodFeedbackDate;
	}
	public void setFoodFeedbackDate(String foodFeedbackDate) {
		this.foodFeedbackDate = foodFeedbackDate;
	}
	public String getExerciseNo() {
		return exerciseNo;
	}
	public void setExerciseNo(String exerciseNo) {
		this.exerciseNo = exerciseNo;
	}
	public int getExerciseTime() {
		return exerciseTime;
	}
	public void setExerciseTime(int exerciseTime) {
		this.exerciseTime = exerciseTime;
	}
	public String getExerciseFeedbackDate() {
		return exerciseFeedbackDate;
	}
	public void setExerciseFeedbackDate(String exerciseFeedbackDate) {
		this.exerciseFeedbackDate = exerciseFeedbackDate;
	}
	public int getExerciseFeedbackEvaluationGrade() {
		return exerciseFeedbackEvaluationGrade;
	}
	public void setExerciseFeedbackEvaluationGrade(int exerciseFeedbackEvaluationGrade) {
		this.exerciseFeedbackEvaluationGrade = exerciseFeedbackEvaluationGrade;
	}
	public String getExerciseFeedbackEvaluationDate() {
		return exerciseFeedbackEvaluationDate;
	}
	public void setExerciseFeedbackEvaluationDate(String exerciseFeedbackEvaluationDate) {
		this.exerciseFeedbackEvaluationDate = exerciseFeedbackEvaluationDate;
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
	public int getFoodOnece() {
		return foodOnece;
	}
	public void setFoodOnece(int foodOnece) {
		this.foodOnece = foodOnece;
	}
	public Double getFoodKcal() {
		return foodKcal;
	}
	public void setFoodKcal(Double foodKcal) {
		this.foodKcal = foodKcal;
	}
	public Double getFoodCarbohydrate() {
		return foodCarbohydrate;
	}
	public void setFoodCarbohydrate(Double foodCarbohydrate) {
		this.foodCarbohydrate = foodCarbohydrate;
	}
	public Double getFoodProtein() {
		return foodProtein;
	}
	public void setFoodProtein(Double foodProtein) {
		this.foodProtein = foodProtein;
	}
	public Double getFoodFat() {
		return foodFat;
	}
	public void setFoodFat(Double foodFat) {
		this.foodFat = foodFat;
	}
	public Double getFoodSugar() {
		return foodSugar;
	}
	public void setFoodSugar(Double foodSugar) {
		this.foodSugar = foodSugar;
	}
	public Double getFoodNatrium() {
		return foodNatrium;
	}
	public void setFoodNatrium(Double foodNatrium) {
		this.foodNatrium = foodNatrium;
	}
	public Double getFoodCholesterol() {
		return foodCholesterol;
	}
	public void setFoodCholesterol(Double foodCholesterol) {
		this.foodCholesterol = foodCholesterol;
	}
	public Double getFoodTransfat() {
		return foodTransfat;
	}
	public void setFoodTransfat(Double foodTransfat) {
		this.foodTransfat = foodTransfat;
	}
	@Override
	public String toString() {
		return "ExerciseFeedbackResult [exerciseFeedbackRequestNo=" + exerciseFeedbackRequestNo
				+ ", exerciseFeedbackTitle=" + exerciseFeedbackTitle + ", exerciseFeedbackContent="
				+ exerciseFeedbackContent + ", exerciseFeedbackResultDate=" + exerciseFeedbackResultDate
				+ ", foodInfoNo=" + foodInfoNo + ", ingestionAmount=" + ingestionAmount + ", foodFeedbackDate="
				+ foodFeedbackDate + ", exerciseNo=" + exerciseNo + ", exerciseTime=" + exerciseTime
				+ ", exerciseFeedbackDate=" + exerciseFeedbackDate + ", exerciseFeedbackEvaluationGrade="
				+ exerciseFeedbackEvaluationGrade + ", exerciseFeedbackEvaluationDate=" + exerciseFeedbackEvaluationDate
				+ ", foodGroup=" + foodGroup + ", foodName=" + foodName + ", foodOnece=" + foodOnece + ", foodKcal="
				+ foodKcal + ", foodCarbohydrate=" + foodCarbohydrate + ", foodProtein=" + foodProtein + ", foodFat="
				+ foodFat + ", foodSugar=" + foodSugar + ", foodNatrium=" + foodNatrium + ", foodCholesterol="
				+ foodCholesterol + ", foodTransfat=" + foodTransfat + "]";
	}
}
