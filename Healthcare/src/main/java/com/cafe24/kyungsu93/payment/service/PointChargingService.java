package com.cafe24.kyungsu93.payment.service;

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
public class PointChargingService {

	@Autowired
	private PointChargingDao pointChargingDao;
	private static final Logger logger = LoggerFactory.getLogger(PointChargingService.class);
	
	/**
	 * 포인트 결제 신청 등록
	 * @param pointCharging
	 */
	public void addPointCharging(PointCharging pointCharging) {
		logger.debug("PointChargingService - addPointCharging실행");		
		String pointChargingNo = pointCharging.getPointChargingNo();
		logger.debug("pointChargingNo:"+pointChargingNo);
		String pointChargingSum = pointCharging.getPointChargingSum();
		logger.debug("pointChargingSum:"+pointChargingSum);
		try {
			if(pointChargingNo == null) {
				//포인트 결제 전체 검색
				int count = 0;
				count = pointChargingDao.pointChargingTotalCount();
				if(count > 0) {
					int result = 0;
					String pointChargingNo_temp = "point_charging_";
					//포인트 결제 번호 최대값 검색
					result = pointChargingDao.PointChargingNo();
					if(result > 0) {
						if(1 <= result) {
							result++;
						}
						pointChargingNo = pointChargingNo_temp + result; 
					}
				}else {
					pointChargingNo = "point_charging_1";
				}
			}
			pointCharging.setPointChargingNo(pointChargingNo);
			pointCharging.setPointChargingSum(pointChargingSum);
		}catch(NullPointerException e) {
			e.printStackTrace();
		}
		pointChargingDao.addPointCharging(pointCharging);
		}
	
	/**
	 * 포인트 결제 승인 완료 리스트
	 * @param currentPage
	 * @param pagePerRow
	 * @return
	 */
	public Map<String, Object> pointChargingApprovalList(int currentPage, int pagePerRow){
		logger.debug("pointChargingService - pointChargingList 실행");
		Map<String,Integer> map = new HashMap<String,Integer>();
		int beginRow = (currentPage-1)*pagePerRow;
		map.put("beginRow", beginRow);
		map.put("pagePerRow", pagePerRow);
		//포인트 결제 승인 리스트
		List<PointCharging> list = pointChargingDao.pointChargingApprovalList(map);
		//게시판 전체 게시물 수
		int total = pointChargingDao.pointChargingApprovalTotalCount();
		int lastPage = total/pagePerRow;
        if(total % pagePerRow != 0) {
            lastPage++;
        }
        logger.debug("list:"+list);
        logger.debug("lastPage:"+lastPage);
        logger.debug("currentPage:"+currentPage);
        logger.debug("beginRow:"+beginRow);
        logger.debug("pagePerRow:"+pagePerRow);
        logger.debug("====================== page block =========================");
       
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
		logger.debug("====================== page block =========================");
		Map<String,Object> returnMap = new HashMap<String,Object>();
		returnMap.put("list", list);
		returnMap.put("lastPage", lastPage);
		returnMap.put("firstBlockPage", firstBlockPage);
		returnMap.put("lastBlockPage", lastBlockPage);
		returnMap.put("totalBlock", totalBlock);
		return returnMap;
	}

	/**
	 * 포인트 결제 승인 대기 리스트
	 * @param currentPage
	 * @param pagePerRow
	 * @return
	 */
	public Map<String, Object> pointChargingList(int currentPage, int pagePerRow){
		logger.debug("pointChargingService - pointChargingList 실행");
		Map<String,Integer> map = new HashMap<String,Integer>();
		int beginRow = (currentPage-1)*pagePerRow;
		map.put("beginRow", beginRow);
		map.put("pagePerRow", pagePerRow);
		//포인트 결제 승인 대기 리스트
		List<PointCharging> list = pointChargingDao.pointChargingList(map);
		//게시판 전체 게시물 수
		int total = pointChargingDao.pointChargingTotalCount();
		int lastPage = total/pagePerRow;
        if(total % pagePerRow != 0) {
            lastPage++;
        }
        logger.debug("list:"+list);
        logger.debug("lastPage:"+lastPage);
        logger.debug("currentPage:"+currentPage);
        logger.debug("beginRow:"+beginRow);
        logger.debug("pagePerRow:"+pagePerRow);
        logger.debug("====================== page block =========================");
       
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
		logger.debug("====================== page block =========================");
		Map<String,Object> returnMap = new HashMap<String,Object>();
		returnMap.put("list", list);
		returnMap.put("lastPage", lastPage);
		returnMap.put("firstBlockPage", firstBlockPage);
		returnMap.put("lastBlockPage", lastBlockPage);
		returnMap.put("totalBlock", totalBlock);
		return returnMap;
	}
}
