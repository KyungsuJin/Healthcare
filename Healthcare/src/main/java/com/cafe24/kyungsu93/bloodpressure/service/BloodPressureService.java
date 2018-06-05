package com.cafe24.kyungsu93.bloodpressure.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.Model;

@Service
@Transactional
public class BloodPressureService {
	@Autowired
	private BloodPressureDao bloodPressureDao;
	private static final Logger logger = LoggerFactory.getLogger(BloodPressureService.class);
	
	public Map<String,Object> getSearch(HttpServletRequest request, Model model,String searchType,String searchValue){		
		searchType = request.getParameter(searchType);
		searchValue = request.getParameter(searchValue);
		Map<String,Object> map = new HashMap<String,Object>();
		map.put("searchType", searchType); 
		map.put("searchValue", searchValue);
		model.addAttribute("map", map);
		List<BloodPressure> list = this.bloodPressureDao.searchBloodPressure(map);
		Map<String,Object> returnMap = new HashMap<String,Object>();
		returnMap.put("list", list);
		return returnMap;
	}
	
	public void updateBloodPressure(String bloodPressureNo) {
		logger.debug("BloodPressureService - updateBloodPressure 실행");
		BloodPressure bloodPressure = new BloodPressure();
		int systolicBloodPressure = bloodPressure.getSystolicBloodPressure();
		int relaxerBloodPressure = bloodPressure.getRelaxerBloodPressure();

		bloodPressure.setRelaxerBloodPressure(relaxerBloodPressure);
		bloodPressure.setSystolicBloodPressure(systolicBloodPressure);
		
		bloodPressure.setBloodPressureNo(bloodPressureNo);
		bloodPressureDao.updateBloodPressure(bloodPressure);		
	}
	
	public BloodPressure selectBloodPressureOne(String bloodPressureNo) {
		logger.debug("BloodPressureService - selectBloodPressureOne 실행");
		bloodPressureDao.selectBloodPressureOne(bloodPressureNo);
		BloodPressure bloodPressure = new BloodPressure();
		int systolicBloodPressure = bloodPressure.getSystolicBloodPressure();
		int relaxerBloodPressure = bloodPressure.getRelaxerBloodPressure();

		bloodPressure.setRelaxerBloodPressure(relaxerBloodPressure);
		bloodPressure.setSystolicBloodPressure(systolicBloodPressure);
		
		bloodPressure.setBloodPressureNo(bloodPressureNo);
		return bloodPressure;
	}
	public int deleteBloodPressure(String bloodPressureNo) {
		logger.debug("BloodPressureService - deleteBloodPressure 실행");
		return bloodPressureDao.deletePressureCount(bloodPressureNo);
	}
	
	public  Map<String, Object> bloodPressureList(int currentPage, int pagePerRow) {
		logger.debug("BloodPressureService - bloodPressureList 실행");
		Map<String,Integer> map = new HashMap<String,Integer>();
		int beginRow = (currentPage-1)*pagePerRow;
		map.put("beginRow", beginRow);
		map.put("pagePerRow", pagePerRow);
		List<BloodPressure> list = bloodPressureDao.bloodPressureList(map);
		int total = bloodPressureDao.bloodPressureCount();
		int lastPage = total/pagePerRow;
        if(total % pagePerRow != 0) {
            lastPage++;
        }
        logger.debug("list:"+list);
        logger.debug("lastPage:"+lastPage);
        logger.debug("currentPage:"+currentPage);
        logger.debug("beginRow:"+beginRow);
        logger.debug("pagePerRow:"+pagePerRow);
        logger.debug("======================page block=========================");
       
        int pagePerBlock = 10; //보여줄 블록 수 
        int block = currentPage/pagePerBlock;
        int totalBlock = total/pagePerBlock;//총 블록수
        
        if(currentPage % pagePerBlock != 0) {
        	block ++;
        }
        int firstBlockPage = (block-1)*pagePerBlock+1;
        int lastBlockPage = block*pagePerBlock;
        
		if(lastPage > 0) {			
			if(lastPage % pagePerBlock != 0) {
				totalBlock++;
			}
		}
		if(lastBlockPage >= totalBlock) {
			lastBlockPage = totalBlock;
		}
		logger.debug("firstBlockPage:"+firstBlockPage);
		logger.debug("lastBlockPage:"+lastBlockPage);
		logger.debug("block:"+block);
		logger.debug("totalBlock:"+totalBlock);
		logger.debug("======================page block=========================");
		Map<String,Object> returnMap = new HashMap<String,Object>();
		returnMap.put("list", list);
		returnMap.put("lastPage", lastPage);
		returnMap.put("firstBlockPage", firstBlockPage);
		returnMap.put("lastBlockPage", lastBlockPage);
		returnMap.put("totalBlock", totalBlock);
		return returnMap;
	}
	
	public void addBloodPressure(BloodPressure bloodPressure) {
		logger.debug("BloodPressureService - addBloodPressure실행");		
		String bloodPressureNo = bloodPressure.getBloodPressureNo();
		try {
		if(bloodPressureNo == null) {
			int count = 0;
			count = bloodPressureDao.bloodPressureCount();
			if(count > 0) {
				int result = 0;
				String bloodPressureNo_temp = "blood_pressure_";
				result = bloodPressureDao.selectBloodPressureId(bloodPressureNo);
				if(result > 0) {
						if(1 <= result) {
							result++;
						}			
					bloodPressureNo = bloodPressureNo_temp + result; 
				}
			}else {
				bloodPressureNo = "blood_pressure_1";
			}
		}
		bloodPressure.setBloodPressureNo(bloodPressureNo);
		}catch(NullPointerException e) {
			e.printStackTrace();
		}
		
		bloodPressureDao.addBloodPressure(bloodPressure);
	}
}