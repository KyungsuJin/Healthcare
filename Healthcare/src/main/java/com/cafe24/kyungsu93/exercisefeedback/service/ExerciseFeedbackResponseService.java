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
	
/*	public Map<String,Object> feedbackFoodSearch(ExerciseFeedbackResult exerciseFeedbackResult){
		logger.debug("ExerciseFeedbackResponseService - feedbackFoodSearch실행");	
		String foodGroup = exerciseFeedbackResult.getFoodGroup();
		String foodName = exerciseFeedbackResult.getFoodName();
		logger.debug("foodGroup:" +foodGroup);	
		logger.debug("foodName:"+foodName);	
		Map<String,Object> returnMap = new HashMap<String,Object>();
		int result = 0;
			List<ExerciseFeedbackResult> foodInfo = exerciseFeedbackResponseDao.feedbackFoodSearch(exerciseFeedbackResult);
		returnMap.put("foodInfo", foodInfo);
		returnMap.put("result", result);
		return returnMap;
	}*/
	
	public Map<String,Object> exerciseFeedResponse(String exerciseFeedbackRequestNo) {
		ExerciseFeedbackRequest exerciseFeedbackRequest = exerciseFeedbackDao.exerciseFeedbackRequestDetail(exerciseFeedbackRequestNo);
		Map<String,Object> returnMap = new HashMap<String,Object>();
		returnMap.put("exerciseFeedbackRequest", exerciseFeedbackRequest);
		return returnMap;
		
	}
}
