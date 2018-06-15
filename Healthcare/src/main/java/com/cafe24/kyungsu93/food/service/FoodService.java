package com.cafe24.kyungsu93.food.service;

import java.io.IOException;
import java.io.InputStreamReader;
import java.io.UnsupportedEncodingException;
import java.net.URL;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.json.simple.JSONValue;
import org.springframework.beans.factory.annotation.Autowired;

public class FoodService {
	@Autowired FoodDao foodDao;
	
	public void addFood() {
		URL url = null;
		String urlValue = "http://openapi.foodsafetykorea.go.kr/api/a50c027b0ae7404c8cae/I0750/json/1/999";
		InputStreamReader isr = null;
		try {
			url = new URL(urlValue);
			isr = new InputStreamReader(url.openConnection().getInputStream(), "UTF-8");
		} catch (UnsupportedEncodingException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}

		JSONObject object = (JSONObject)JSONValue.parse(isr);
		object = (JSONObject)object.get("I0750");
		JSONArray bodyArray = (JSONArray) object.get("row");
		System.out.println("size : "+bodyArray.size());
		//받은 json타입의 객체를 잘라서 Food타입으로 저장한 후 하나씩 db에 insert 한다. transaction 처리도 해준다.
		for(int i = 0 ; i < bodyArray.size(); i++){
			JSONObject data = (JSONObject) bodyArray.get(i);
			Food food = new Food();
			food.setFoodNo("food_"+data.get("NUM").toString());
			food.setFoodGroup(data.get("FDGRP_NM").toString());
			food.setFoodName(data.get("DESC_KOR").toString());
			food.setFoodOnce(myParseInt(data.get("SERVING_WT").toString()));
			food.setFoodKcal(myParseDouble(data.get("NUTR_CONT1").toString()));
			food.setFoodCarbohydrate(myParseDouble(data.get("NUTR_CONT2").toString()));
			food.setFoodProtein(myParseDouble(data.get("NUTR_CONT3").toString()));
			food.setFoodFat(myParseDouble(data.get("NUTR_CONT4").toString()));
			food.setFoodSugar(myParseDouble(data.get("NUTR_CONT5").toString()));
			food.setFoodNatrium(myParseDouble(data.get("NUTR_CONT6").toString()));
			food.setFoodCholesterol(myParseDouble(data.get("NUTR_CONT7").toString()));
			food.setFoodSfa(myParseDouble(data.get("NUTR_CONT8").toString()));
			food.setFoodTransfat(myParseDouble(data.get("NUTR_CONT9").toString()));
			food.setFoodBuildDate(myParseInt(data.get("BGN_YEAR").toString()));
			foodDao.addFood(food);
		}


	}
	
	
	public double myParseDouble(String data) {
		if(data.equals("N/A")) {
			data = "0";
		} else if(data.equals("TRACE")) {
			data = "0.005";
		}
		
		return Double.parseDouble(data);
	}
	
	public int myParseInt(String data) {
		if(data.equals("N/A")) {
			data = "0";
		}
		return Integer.parseInt(data);
	}
}
