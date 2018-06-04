package com.cafe24.kyungsu93.healthscreen.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;


@Service
public class HealthScreenService {
	private static final Logger logger = LoggerFactory.getLogger(HealthScreenService.class);

	@Autowired HealthScreenDao healthScreenDao;
	
	public Map<String,Object> getHealthScreenList(int currentPage, int pagePerRow, HealthScreen heatlhScreen){
		logger.debug("HealthScreenService.getHealthScreenList 호출");
		int totalRow = healthScreenDao.healthScreenTotalCount(heatlhScreen);
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
		List<HealthScreen> list = healthScreenDao.getHealthScreenList(pageMap);
		map.put("list", list);
		map.put("firstPage", firstPage);
		map.put("lastPage", lastPage);
		map.put("beforePage", beforePage);
		map.put("afterPage", afterPage);
		return map;
	}
	
	public void addHealthScreen(HealthScreen healthScreen) {
		healthScreenDao.addHealthScreen(healthScreen);
	}
	
	public void removeHealthScreen(HealthScreen healthScreen) {
		
	}
	
	public HealthScreen getHealthScreenOne(HealthScreen healthScreen) {
		return getHealthScreenOne(healthScreen);
	}
	
	public void modifyHealthScreen(HealthScreen healthScreen) {
		
	}
	
	
}
