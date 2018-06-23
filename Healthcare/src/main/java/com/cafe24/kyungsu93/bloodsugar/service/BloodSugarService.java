/*package com.cafe24.kyungsu93.bloodsugar.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import com.cafe24.kyungsu93.bloodpressure.service.BloodPressure;
import com.cafe24.kyungsu93.bloodsugar.controller.BloodsugarController;

@Service
public class BloodSugarService {
	private static final Logger logger = LoggerFactory.getLogger(BloodsugarController.class);
	
	@Autowired
	private BloodSugarDao bloodsugarDao;
	
	public  Map<String, Object> bloodsugarList(int currentPage, int pagePerRow) {
		logger.debug("Bloodsugar service BloodsugarList 실행 부분");
		Map<String,Integer> map = new HashMap<String,Integer>();
		logger.debug("4번"+map);
		int beginRow = (currentPage-1)*pagePerRow;
		map.put("beginRow", beginRow);
		map.put("pagePerRow", pagePerRow);
		List<BloodSugar> list = bloodsugarDao.bloodsugarList(map);
		logger.debug("5번"+list);
		int total = bloodsugarDao.bloodsugarCount();
		logger.debug("7번"+total);
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

	public void addBloodsugar (BloodSugar bloodsugar) {
		logger.debug("addBloodsugar BloodsugarService");
		
		bloodsugarDao.addBloodsugar(bloodsugar);	
	}
	
	
	public BloodSugar selectBloodsugarOne(String bloodsugarno) {
		logger.debug("BloodsugarService 에서 selectBloodsugarOne 실행");
		return bloodsugarDao.selectBloodsugarOne(bloodsugarno);
		
	}
	
	public void updateBloodsugar (BloodSugar bloodsugar) {
		logger.debug("updateBloodsugar BloodsugarService");
		logger.debug("88888888888888888888888888"+bloodsugar);
		bloodsugarDao.updateBloodsugar(bloodsugar);
	}
	
	public int deleteBloodsugar(String bloodsugarno) {
		logger.debug("BloodPressureService 에서 deleteBloodsugar 실행");
		return bloodsugarDao.deletesugarCount(bloodsugarno);
	}
}
*/
package com.cafe24.kyungsu93.bloodsugar.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class BloodSugarService {
	private static final Logger logger = LoggerFactory.getLogger(BloodSugarService.class);
	
	@Autowired
	private BloodSugarDao bloodSugarDao;
	
	public  Map<String, Object> bloodSugarList(int currentPage, int pagePerRow) {
		logger.debug("BloodSugar service BloodSugarList 실행");
		Map<String,Integer> map = new HashMap<String,Integer>();
		int beginRow = (currentPage-1)*pagePerRow;
		map.put("beginRow", beginRow);
		map.put("pagePerRow", pagePerRow);
		List<BloodSugar> list = bloodSugarDao.bloodSugarList(map);
		logger.debug("5번"+list);
		int total = bloodSugarDao.bloodSugarCount();
		logger.debug("7번"+total);
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
       
        int pagePerBlock = 10; //보여줄 블럭수
        int block = currentPage/pagePerBlock;
        int totalBlock = total/pagePerBlock;//총 블럭수
        
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
		logger.debug("혈당 리스트 list :"+list);
		returnMap.put("lastPage", lastPage);
		returnMap.put("firstBlockPage", firstBlockPage);
		returnMap.put("lastBlockPage", lastBlockPage);
		returnMap.put("totalBlock", totalBlock);
		return returnMap;
	}

	public void addBloodSugar (BloodSugar bloodSugar) {
		bloodSugar.setBloodSugarNo("blood_sugar_"+(bloodSugarDao.selectBloodSugarNo()+1));
		logger.debug("addBloodSugar BloodSugarService");
		bloodSugarDao.addBloodSugar(bloodSugar);	
	}
	
	
	public BloodSugar selectBloodSugarOne(String bloodSugarNo) {
		logger.debug("BloodSugarService 에서 selectBloodSugarOne 실행");
		return bloodSugarDao.selectBloodSugarOne(bloodSugarNo);
		
	}
	
	public void updateBloodSugar (BloodSugar bloodSugar) {
		logger.debug("updateBloodSugar BloodSugarService");
		bloodSugarDao.updateBloodSugar(bloodSugar);
	}
	
	public int deleteBloodSugar(String bloodSugarNo) {
		logger.debug("BloodPressureService 에서 deleteBloodSugar 실행");
		return bloodSugarDao.deleteSugarCount(bloodSugarNo);
	
	}
}


