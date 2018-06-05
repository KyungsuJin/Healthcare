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
	
	public Map<String,Object> getHealthScreenList(int currentPage, int pagePerRow, HealthScreenRequest heatlhScreenRequest){
		logger.debug("HealthScreenService.getHealthScreenList 호출");
		int totalRow = healthScreenDao.healthScreenTotalCount(heatlhScreenRequest);
		int firstPage = 1;
		int lastPage = totalRow/pagePerRow;
		if(totalRow%pagePerRow != 0) {
			lastPage++;
		}
		int beforePage = ((currentPage-1)/10)*10;
		int afterPage = ((currentPage-1)/10)*10 +11;
		
		Map pageMap = new HashMap<String, Object>();
		pageMap.put("memberNo", heatlhScreenRequest.getMemberNo());
		pageMap.put("beginRow", (currentPage-1)*10);
		pageMap.put("pagePerRow", pagePerRow);
		
		Map map = new HashMap<String, Object>();
		List<HealthScreenResponse> list = healthScreenDao.getHealthScreenList(pageMap);
		map.put("list", list);
		map.put("firstPage", firstPage);
		map.put("lastPage", lastPage);
		map.put("beforePage", beforePage);
		map.put("afterPage", afterPage);
		return map;
	}
	
	public void addHealthScreen(HealthScreenRequest healthScreenRequest) {
		//여기에서 체질량, 혈당, 혈압을 먼저 insert 한다음 key값을 healthScreenRequest에 넣고, insert 한다.
		
		
		int number = healthScreenDao.getHealthScreenNo() +1;
		healthScreenRequest.setHealthScreenNo("health_screen_"+number);
		healthScreenDao.addHealthScreen(healthScreenRequest);
	}
	
	public HealthScreenResponse getHealthScreenResult(HealthScreenRequest healthScreenRequest) {
		return healthScreenDao.getHealthScreenResult(healthScreenRequest);
	}
	
	public void removeHealthScreen(HealthScreenRequest healthScreenRequest) {
		healthScreenDao.removeHealthScreen(healthScreenRequest);
	}
	
	public HealthScreenResponse getHealthScreenOne(HealthScreenRequest healthScreenRequest) {
		return healthScreenDao.getHealthScreenOne(healthScreenRequest);
	}
	
	public void modifyHealthScreen(HealthScreenRequest healthScreenRequest) {
		healthScreenDao.modifyHealthScreen(healthScreenRequest);
	}
	
	
}
