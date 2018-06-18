package com.cafe24.kyungsu93.exercisefeedback.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

@Service
@Transactional
public class ExerciseFeedbackResponseService {
	@Autowired
	private ExerciseFeedbackResponseDao exerciseFeedbackResponseDao;
	@Autowired
	private ExerciseFeedbackDao exerciseFeedbackDao;
	private static final Logger logger = LoggerFactory.getLogger(ExerciseFeedbackResponseService.class);

	public Map<String,Object> exerciseSearch(){
		logger.debug("ExerciseFeedbackResponseService - exerciseSearch실행");	
		Map<String,Object> returnMap = new HashMap<String,Object>();
		List<ExerciseFeedbackResult> exerciseSearch = exerciseFeedbackResponseDao.exerciseSearch();
		returnMap.put("exerciseSearch", exerciseSearch);
		logger.debug("exerciseSearch:"+exerciseSearch);	
		return returnMap;
	}
	/**
	 * 운동 피드백 음식 검색
	 * @param exerciseFeedbackResult
	 * @return
	 */
	public Map<String,Object> feedbackFoodSearch(ExerciseFeedbackResult exerciseFeedbackResult){
		logger.debug("ExerciseFeedbackResponseService - feedbackFoodSearch실행");	
		Map<String,String> map = new HashMap<String,String>();
		String foodGroup = exerciseFeedbackResult.getFoodGroup();
		String foodName = exerciseFeedbackResult.getFoodName();
		map.put("foodGroup", foodGroup);
		map.put("foodName", foodName);
		logger.debug("foodGroup:" +foodGroup);	
		logger.debug("foodName:"+foodName);	
		List<ExerciseFeedbackResult> foodInfo = exerciseFeedbackResponseDao.foodSearch(map);
		Map<String,Object> returnMap = new HashMap<String,Object>();
		int result = 0;
		if(foodInfo.size()>0) {
			result = foodInfo.size();
			returnMap.put("result", result);
		}else if (foodInfo.size() == 0){
			result = 0;
			returnMap.put("result", result);
		}
		returnMap.put("foodInfo", foodInfo);		
		return returnMap;
	}
	/**
	 * 피드백 요청 답변 회원 검색
	 * @param exerciseFeedbackRequestNo
	 * @return
	 */
	public Map<String,Object> exerciseFeedResponse(String exerciseFeedbackRequestNo) {
		logger.debug("ExerciseFeedbackResponseService - exerciseFeedResponse실행");	
		ExerciseFeedbackRequest exerciseFeedbackRequest = exerciseFeedbackDao.exerciseFeedbackRequestDetail(exerciseFeedbackRequestNo);
		Map<String,Object> returnMap = new HashMap<String,Object>();
		String memberName = exerciseFeedbackRequest.getMemberName();
		returnMap.put("memberName", memberName);
		return returnMap;
		
	}
}
