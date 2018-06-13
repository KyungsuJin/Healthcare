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

	/**
	 * 혈압 차트
	 * @param memberNo
	 * @return
	 */
	public List<BloodPressure> selectBloodPressureChart(String memberNo) {
		logger.debug("BloodPressureService - selectBloodPressureChart 실행");
		return bloodPressureDao.selectBloodPressureChart(memberNo);
	}
	
	/**
	 * 혈압 기간별 검색
	 * @param startDate
	 * @param endDate
	 * @return
	 */
	public List<BloodPressure> bloodPressureSearchDate(String startDate, String endDate) {
		logger.debug("BloodPressureService - bloodPressureSearchDate 실행");
		
		Map<String,Object> map = new HashMap<String,Object>();
		map.put("startDate", startDate);
		map.put("endDate", endDate);
		logger.debug("가져온 데이터:"+startDate+","+endDate);
		
		List<BloodPressure> list = bloodPressureDao.bloodPressureSearchDate(map);
		
		return list;
	}
	
	/**
	 * 혈압 수정
	 * @param bloodPressureNo
	 */
	public void updateBloodPressure(String bloodPressureNo) {
		logger.debug("BloodPressureService - updateBloodPressure 실행");
		BloodPressure bloodPressure = new BloodPressure();
		int diastolicPressure = bloodPressure.getDiastolicPressure();
		int systolicPressure = bloodPressure.getSystolicPressure();
		bloodPressure.setDiastolicPressure(diastolicPressure);
		bloodPressure.setSystolicPressure(systolicPressure);
		bloodPressure.setBloodPressureNo(bloodPressureNo);
		bloodPressureDao.updateBloodPressure(bloodPressure);		
	}
	
	/**
	 * 하나의 혈압 선택
	 * @param bloodPressureNo
	 * @return
	 */
	public BloodPressure selectBloodPressureOne(String bloodPressureNo) {
		logger.debug("BloodPressureService - selectBloodPressureOne 실행");
		BloodPressure bloodPressure = bloodPressureDao.selectBloodPressureOne(bloodPressureNo);
		return bloodPressure;
	}

	/**
	 * 혈압 삭제
	 * @param bloodPressureNo
	 * @return
	 */
	public int deleteBloodPressure(String bloodPressureNo) {
		logger.debug("BloodPressureService - deleteBloodPressure 실행");
		return bloodPressureDao.deletePressureCount(bloodPressureNo);
	}
	
	/**
	 * 혈압 리스트
	 * @param currentPage
	 * @param pagePerRow
	 * @return
	 */
	public Map<String, Object> bloodPressureList(int currentPage, int pagePerRow) {
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
	
	/**
	 * 혈압 등록
	 * @param bloodPressure
	 */
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
