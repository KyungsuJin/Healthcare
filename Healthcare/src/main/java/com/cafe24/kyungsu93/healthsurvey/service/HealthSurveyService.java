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
		//healthSurveyDao.addHealthSurvey(healthSurveyRequest);
	}
}
