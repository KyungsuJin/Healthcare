package com.cafe24.kyungsu93.diet.service;

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
		ConsumeCalorie consumeCalorie = new ConsumeCalorie();
		consumeCalorie.setMemberNo(consumecalorieRequest.getMemberNo());
		System.out.println("!!!!!!!!!!!!!!!!!!!!!"+ consumecalorieRequest.getExerciseNo().size());
		int addConsumeCalroie=0;
		for(int i=0; i<consumecalorieRequest.getExerciseNo().size(); i++) {
			consumeCalorie.setExerciseNo(consumecalorieRequest.getExerciseNo().get(i));
			consumeCalorie.setConsumeTime(consumecalorieRequest.getConsumeTime().get(i));
			
			int result = (dietDao.selectConsumeCalorieNo())+1;
			System.out.println("result : "+ result);
			String temp = "consume_calorie_";
			String consumeCalorieNo = temp+result;
			
			consumeCalorie.setConsumeCalorieNo(consumeCalorieNo);
			
			addConsumeCalroie = dietDao.addConsumeCalorie(consumeCalorie);
		}
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
		logger.debug("DietService_ingestCalorie");
		IngestCalorie ingestCalorie = new IngestCalorie();
		ingestCalorie.setIngestCalorieNo(ingestCalorieRequest.getIngestCalorieNo());
		ingestCalorie.setMemberNo(ingestCalorieRequest.getMemberNo());
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
		return addIngestCalorie;
	}
	public List<Food> selectFoodSearch(String sv) {
		logger.debug("DietService_selectForAddIngetCalorie");
		return dietDao.selectFoodSearch(sv);
	}
}