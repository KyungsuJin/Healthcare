package com.cafe24.kyungsu93.diet.service;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;


import com.cafe24.kyungsu93.exercise.service.Exercise;
import com.cafe24.kyungsu93.food.service.Food;

@Service
@Transactional
public class DietService {
	@Autowired
	DietDao dietDao;
	@Autowired
	HttpSession session;
	
	private static final Logger logger = LoggerFactory.getLogger(DietService.class);
	
	public CalorieBattle getCalorieInfo(String memberNo) {
		logger.debug("DietService_getCalorieInfo");		
		return dietDao.getCalorieInfo(memberNo);
	}
	public List<BodyMassIndexResponse> getCalorieBattleRankList(String memberId) {
		logger.debug("DietService_getCalorieBattleRankList");
		System.out.println("memberId : "+memberId);
		if(memberId.equals("null")) {
			return dietDao.getCalorieBattleRankList();
		}
		System.out.println("memberId : "+memberId);
		return dietDao.getCalorieBattleRankleList(memberId);
	}
	public int addCalorieBattle(String memberNo) {
		logger.debug("DietService_addCalorieBattle");	
		Date date = new Date();

		SimpleDateFormat transFormat = new SimpleDateFormat("yyyy");
		String year = transFormat.format(date);
		transFormat = new SimpleDateFormat("MM");
		String month = transFormat.format(date);
		transFormat = new SimpleDateFormat("dd");
		String day = transFormat.format(date);
		String today = year+"_" + month + "_" + day;
		System.out.println("today : " + today);

		Map<String, String> map = new HashMap<String, String>();
		dietDao.getIngestCalorieForBattle(memberNo);
		System.out.println(year);
		System.out.println(month);
		System.out.println(date);
		map.put("memberNo", memberNo);
		map.put("pickMonth", month);
		map.put("pickDay", day);
		map.put("pickYear", year);
		map.put("today", today);
		
		CalorieBattle calorieBattle = new CalorieBattle();

		//토탈 칼로리를 구한다.
		List<TotalCalorieResponse> listIngest = dietDao.totalCalorie(map);
		//토탈 소모칼로리를 구한다.
		List<TotalConsumeResponse> listConsume = dietDao.totalConsume(map);
		calorieBattle.setMemberNo(memberNo);
		double kcal = 0;
		double carbohydrate = 0;
		double protein = 0;
		double fat = 0;
		double sugar = 0;
		double natrium = 0;
		double Cholesterol = 0;
		double sfa = 0;
		int ingestWeight = 0;
		int consumeCalorie = 0;
		int consumeTime = 0;
		for(int i=0; i<listConsume.size(); i++) {
			consumeTime = listConsume.get(i).getConsumeTime();
			consumeCalorie += listConsume.get(i).getTotalExerciseCalorie()*consumeTime;
		}
		for(int i=0; i<listIngest.size(); i++) {
			ingestWeight = listIngest.get(i).getIngestWeight();
			kcal += (listIngest.get(i).getTotalKcal()*ingestWeight);
			carbohydrate += (listIngest.get(i).getTotalCarbohydrate()*ingestWeight);
			protein += (listIngest.get(i).getTotalProtein()*ingestWeight);
			fat += (listIngest.get(i).getTotalFat()*ingestWeight);
			sugar +=(listIngest.get(i).getTotalSugar()*ingestWeight);
			natrium += (listIngest.get(i).getTotalNatrium()*ingestWeight);
			Cholesterol += (listIngest.get(i).getTotalCholesterol()*ingestWeight);
			sfa += (listIngest.get(i).getTotalSfa()*ingestWeight);
		}
		calorieBattle.setIngestCalorie(Math.round((kcal)*100)/100.0);
		calorieBattle.setOneDayCalorie(Math.round((kcal - consumeCalorie)*100)/100.0);
		calorieBattle.setCarbohydrate(Math.round((carbohydrate)*100)/100.0);
		calorieBattle.setProtein(Math.round((protein)*100)/100.0);
		calorieBattle.setFat(Math.round((fat)*100)/100.0);
		calorieBattle.setSugar(Math.round((sugar)*100)/100.0);
		calorieBattle.setNatrium(Math.round((natrium)*100)/100.0);
		calorieBattle.setCholesterol(Math.round((Cholesterol)*100)/100.0);
		calorieBattle.setSfa(Math.round((sfa)*100)/100.0);
		calorieBattle.setConsumeCalorie((Math.round((consumeCalorie)*100)/100.0));
		
		System.out.println("시발 왜안되"+calorieBattle.toString());
		
		int cnt= dietDao.selectCalorieBattleNoCount(map);
		System.out.println("cnt : " + cnt);
		if(cnt == 0) {
			int result = dietDao.selectCalorieBattleNo()+1;
			String temp = today+"_calorie_battle_";
			String calorieBattleNo = temp+result;
			calorieBattle.setCalorieBattleNo(calorieBattleNo);
			dietDao.addCalorieBattle(calorieBattle);
		}
		dietDao.updateCalorieBattle(calorieBattle);
		
		return 1;
	}
	public int removeConsumeCalorie(String consumeCalorieNo, String memberNo) {
		logger.debug("DietService_removeConsumeCalorie");
		return dietDao.removeConsumeCalorie(consumeCalorieNo);
	}
	public TotalConsumeResponse totalConsume(String memberNo, String datePicker) {
		logger.debug("DietService_totalConsume");
		Map<String, String> map = new HashMap<String, String>();
		String pickMonth = datePicker.substring(0, 2);
		String pickDay = datePicker.substring(3, 5);
		String pickYear = datePicker.substring(6, 10);
		map.put("memberNo", memberNo);
		map.put("pickMonth", pickMonth);
		map.put("pickDay", pickDay);
		map.put("pickYear", pickYear);
		dietDao.totalConsume(map);
		
		List<TotalConsumeResponse> list = dietDao.totalConsume(map);
		TotalConsumeResponse totalConsumeResponse = new TotalConsumeResponse();
		int consumeTime = 0;
		int exerciseCalorie = 0;
		for(int i=0; i<list.size(); i++) {
			consumeTime = list.get(i).getConsumeTime();
			exerciseCalorie += list.get(i).getTotalExerciseCalorie()*consumeTime;
			if(i+1 == list.size()) {
				totalConsumeResponse.setTotalExerciseCalorie(exerciseCalorie = exerciseCalorie/i);
			}
		}
		System.out.println("!!!!!!!!!!!!!!!!!!!!!!!!!!!:"+totalConsumeResponse.getTotalExerciseCalorie());
		return totalConsumeResponse;	
	}
	public List<ConsumeCalorie> getConsumeCalorie() {
		logger.debug("DietService_getConsumeCalorie");
		String memberNo = (String)session.getAttribute("memberSessionNo");
		if(memberNo == null) {
			return null;
		}
		return dietDao.getConsumeCalorie(memberNo);
	}
	public List<Exercise> selectExerciseSearch(String sv) {
		logger.debug("DietService_selectExerciseSearch");
		
		return dietDao.selectExerciseSearch(sv);
	}
	public int addConsumeCalorie(ConsumeCalorieRequest consumecalorieRequest) {
		logger.debug("DietService_addConsumeCalorie");
		String memberNo = consumecalorieRequest.getMemberNo();
		ConsumeCalorie consumeCalorie = new ConsumeCalorie();
		consumeCalorie.setMemberNo(consumecalorieRequest.getMemberNo());
		
		int addConsumeCalroie=0;
		for(int i=0; i < consumecalorieRequest.getExerciseNo().size(); i++) {
			System.out.println("for문시작");
			consumeCalorie.setExerciseNo(consumecalorieRequest.getExerciseNo().get(i));
			consumeCalorie.setConsumeTime(consumecalorieRequest.getConsumeTime().get(i));
			
			int result = (dietDao.selectConsumeCalorieNo())+1;
			System.out.println("result : "+ result);
			String temp = "consume_calorie_";
			String consumeCalorieNo = temp+result;
			
			consumeCalorie.setConsumeCalorieNo(consumeCalorieNo);
			
			addConsumeCalroie = dietDao.addConsumeCalorie(consumeCalorie);
			System.out.println("addConsumeCalroie : "+ addConsumeCalroie);
		}
		System.out.println("컨슘칼로리등록완료");
		addCalorieBattle(memberNo);
		
		return addConsumeCalroie;
	}
	public TotalCalorieResponse totalCalorie(String memberNo, String datePicker) {
		logger.debug("DietService_totalCalorie");
		Map<String, String> map = new HashMap<String, String>();
		String pickMonth = datePicker.substring(0, 2);
		String pickDay = datePicker.substring(3, 5);
		String pickYear = datePicker.substring(6, 10);
		map.put("memberNo", memberNo);
		map.put("pickMonth", pickMonth);
		map.put("pickDay", pickDay);
		map.put("pickYear", pickYear);
		
		List<TotalCalorieResponse> list = dietDao.totalCalorie(map);
		TotalCalorieResponse totalCalorieResPonse = new TotalCalorieResponse();
		double kcal = 0;
		double carbohydrate = 0;
		double protein = 0;
		double fat = 0;
		double sugar = 0;
		double natrium = 0;
		double Cholesterol = 0;
		double sfa = 0;
		int ingestWeight = 0;
		
		for(int i=0; i<list.size() ;i++) {
			ingestWeight = list.get(i).getIngestWeight();
			kcal += list.get(i).getTotalKcal()*ingestWeight;
			carbohydrate += list.get(i).getTotalCarbohydrate()*ingestWeight;
			protein += list.get(i).getTotalProtein()*ingestWeight;
			fat += list.get(i).getTotalFat()*ingestWeight;
			sugar += list.get(i).getTotalSugar()*ingestWeight;
			natrium += list.get(i).getTotalNatrium()*ingestWeight;
			Cholesterol += list.get(i).getTotalCholesterol()*ingestWeight;
			sfa += list.get(i).getTotalSfa()*ingestWeight;

			if(i+1 == list.size()) {
				totalCalorieResPonse.setTotalKcal(kcal);
				totalCalorieResPonse.setTotalCarbohydrate(carbohydrate = carbohydrate/i);
				totalCalorieResPonse.setTotalProtein(protein = protein/i);
				totalCalorieResPonse.setTotalFat(fat = fat/i);
				totalCalorieResPonse.setTotalSugar(sugar = sugar/i);
				totalCalorieResPonse.setTotalNatrium(natrium = natrium/i);
				totalCalorieResPonse.setTotalCholesterol(Cholesterol = Cholesterol/i);
				totalCalorieResPonse.setTotalSfa(sfa = sfa/i);
			}
		}
		return totalCalorieResPonse;
	}
	public int removeIngestCalorie(String ingestCalorieNo, String memberNo) {
		logger.debug("DietService_removeIngestCalorie");
		String sMemberNo = (String)session.getAttribute("memberSessionNo");
		//현재로그인한 회원과 등록회원을 비교하여 다르다면 0을 return하고 동일하다면 removeIngestCalorie메서드를 실행한다.
		if(sMemberNo != memberNo) {
			return 0;
		}
		return dietDao.removeIngestCalorie(ingestCalorieNo);
	}
	public List<IngestCalorie> getIngestCalorie() {
		logger.debug("DietService_getIngestCalorie");
		String memberNo = (String)session.getAttribute("memberSessionNo");
		if(memberNo == null) {
			return null;
		}
		return dietDao.getIngestCalorie(memberNo);
	}
	public int addIngestCalorie(IngestCalorieRequest ingestCalorieRequest) {
		logger.debug("DietService_addIngestCalorie");
		System.out.println("아시발:"+ingestCalorieRequest.toString());
		String memberNo = ingestCalorieRequest.getMemberNo();
		IngestCalorie ingestCalorie = new IngestCalorie();
		ingestCalorie.setIngestCalorieNo(ingestCalorieRequest.getIngestCalorieNo());
		ingestCalorie.setMemberNo(ingestCalorieRequest.getMemberNo());
		System.out.println("시발로미:"+ingestCalorieRequest.getFoodNo().size());
		int addIngestCalorie = 0;
		for(int i=0; i <ingestCalorieRequest.getFoodNo().size();i++) {
			ingestCalorie.setFoodNo(ingestCalorieRequest.getFoodNo().get(i));
			ingestCalorie.setIngestWeight(ingestCalorieRequest.getIngestWeight().get(i));
			
			int result =(dietDao.selectIngestCalorieNo())+1;
			logger.debug("DietService_ingestCalorie", result);
			String temp = "ingest_calorie_";
			String ingestCalorieNo = temp+result;
			ingestCalorie.setIngestCalorieNo(ingestCalorieNo);
			
			addIngestCalorie = dietDao.addIngestCalorie(ingestCalorie);
		}
		addCalorieBattle(memberNo);
		
		return addIngestCalorie;
	}
	public List<Food> selectFoodSearch(String sv) {
		logger.debug("DietService_selectForAddIngetCalorie");
		return dietDao.selectFoodSearch(sv);
	}
}