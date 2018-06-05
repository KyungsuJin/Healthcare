package com.cafe24.kyungsu93.healthsurvey.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.cafe24.kyungsu93.healthscreen.service.HealthScreenRequest;



@Service
public class HealthSurveyService {
	private static final Logger logger = LoggerFactory.getLogger(HealthSurveyService.class);

	@Autowired HealthSurveyDao healthSurveyDao;
	
	public Map<String, Object> getHealthSurveyList (int currentPage, int pagePerRow){
		logger.debug("HealthScreenService.getHealthScreenList 호출");
		int totalRow = healthSurveyDao.healthSurveyTotalCount();
		int firstPage = 1;
		int lastPage = totalRow/pagePerRow;
		if(totalRow%pagePerRow != 0) {
			lastPage++;
		}
		int beforePage = ((currentPage-1)/10)*10;
		int afterPage = ((currentPage-1)/10)*10 +11;
		
		Map pageMap = new HashMap<String, Integer>();
		pageMap.put("beginRow", (currentPage-1)*10);
		pageMap.put("pagePerRow", pagePerRow);
		
		Map map = new HashMap<String, Object>();
		List<HealthSurveyResponse> list = healthSurveyDao.getHealthSurveyList(pageMap);
		map.put("list", list);
		map.put("firstPage", firstPage);
		map.put("lastPage", lastPage);
		map.put("beforePage", beforePage);
		map.put("afterPage", afterPage);
		return map;
	}
	
	public void addHealthSurvey(HealthSurveyRequest healthSurveyRequest, HealthSurveyQuestion healthSurveyQuestion, HealthSurveySelection healthSurveySelection) {
		String healthSurveyRegisterNo = healthSurveyDao.getHealthSurveyNo();
		healthSurveyRequest.setHealthSurveyRegisterNo(healthSurveyRegisterNo);
		healthSurveyQuestion.setHealthSurveyRegisterNo(healthSurveyRegisterNo);
		healthSurveyDao.addHealthSurvey(healthSurveyRequest);
		int count = 0;
		for(int i = 0 ; i < healthSurveyQuestion.getQuestionNoList().length ; i++) {
			String healthSurveyQuestionNo = healthSurveyDao.getHealthSurveyQuestionNo();
			healthSurveyQuestion.setHealthSurveyQuestionNo(healthSurveyQuestionNo);
			healthSurveySelection.setHealthSurveyQuestionNo(healthSurveyQuestionNo);
			healthSurveyQuestion.setQuestionNo(healthSurveyQuestion.getQuestionNoList()[i]);
			healthSurveyQuestion.setHealthSurveyQuestion(healthSurveyQuestion.getHealthSurveyQuestionList()[i]);
			healthSurveyDao.addHealthSurveyQuestion(healthSurveyQuestion);
			int flag = 0;
			for(int j = count ; j < healthSurveySelection.getSelectionNoList().length ; j++) {
				healthSurveySelection.setHealthSurveySelectionNo(healthSurveySelection.getHealthSurveySelectionNo());
				healthSurveySelection.setSelectionNo(healthSurveySelection.getSelectionNoList()[j]);
				healthSurveySelection.setHealthSurveySelection(healthSurveySelection.getHealthSurveySelectionList()[j]);
				healthSurveySelection.setHealthSurveySelectionScore(healthSurveySelection.getHealthSurveySelectionScoreList()[j]);
				/*if(healthSurveySelection.getSelectionNo()) {
					
				}*/
			}
		}
		
		
	}
}
