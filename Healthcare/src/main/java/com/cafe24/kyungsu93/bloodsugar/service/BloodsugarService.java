package com.cafe24.kyungsu93.bloodsugar.service;

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
public class BloodsugarService {
	private static final Logger logger = LoggerFactory.getLogger(BloodsugarController.class);
	
	@Autowired
	private BloodsugarDao bloodsugarDao;
	
	/*public Map<String,Object> getSearch(HttpServletRequest request, Model model,String searchCode,String searchValue){		
		searchCode = request.getParameter(searchCode);
		searchValue = request.getParameter(searchValue);
		Map<String,Object> map = new HashMap<String,Object>();
		map.put("searchCode", searchCode); 
		map.put("searchValue", searchValue);
		model.addAttribute("map", map);
		List<Bloodsugar> list = this.bloodsugarDao.searchBloodsugar(map);
		Map<String,Object> returnMap = new HashMap<String,Object>();
		returnMap.put("list", list);
		return returnMap;
	
	}*/
	
	public  Map<String, Object> bloodsugarList(int currentPage, int pagePerRow) {
		logger.debug("Bloodsugar service BloodsugarList 실행 부분");
		Map<String,Integer> map = new HashMap<String,Integer>();
		int beginRow = (currentPage-1)*pagePerRow;
		map.put("beginRow", beginRow);
		map.put("pagePerRow", pagePerRow);
		List<Bloodsugar> list = bloodsugarDao.bloodsugarList(map);
		int total = bloodsugarDao.bloodsugarCount();
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

	public void addBloodsugar (Bloodsugar bloodsugar) {
		logger.debug("addBloodsugar BloodsugarService");
		
		bloodsugarDao.addBloodsugar(bloodsugar);
		
	}
	
	
	
}
