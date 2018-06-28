package com.cafe24.kyungsu93.doctorrequest.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.cafe24.kyungsu93.bloodsugar.controller.BloodsugarController;
import com.cafe24.kyungsu93.bloodsugar.service.BloodSugar;
import com.cafe24.kyungsu93.bloodsugar.service.BloodSugarDao;
import com.cafe24.kyungsu93.member.service.Member;

@Service
public class DoctorRequestService {
		private static final Logger logger = LoggerFactory.getLogger(DoctorRequestService.class);	
		@Autowired
		private DoctorRequestDao doctorRequestDao;
		
public  Map<String, Object> doctorRequestList(int currentPage, int pagePerRow) {
	logger.debug("doctorRequest service doctorRequestList 실행 부분");
	Map<String,Integer> map = new HashMap<String,Integer>();
	int beginRow = (currentPage-1)*pagePerRow;
	map.put("beginRow", beginRow);
	map.put("pagePerRow", pagePerRow);
	List<DoctorRequest> list = doctorRequestDao.doctorRequestList(map);
	logger.debug("5번"+list);
	int total = doctorRequestDao.doctorRequestCount();
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
	public List<Member> memberList(String memberNo) {
		List<Member> resultlistmember = doctorRequestDao.memberNo(memberNo);
		logger.debug("22번"+resultlistmember);
		return resultlistmember;
	}
	public void doctorRequest(DoctorRequest doctorRequest) {
		doctorRequest.setRequestHealthInformationNo("request_health_information_"+(doctorRequestDao.selectdoctorRequest()+1));
		doctorRequestDao.doctorRequest(doctorRequest);
		logger.debug("27번"+doctorRequest);
/*	}
	public  Map<String, Object> requestDoctorList(int currentPage, int pagePerRow,String teacherNo) {
		logger.debug("doctorRequest service doctorRequestList 실행 부분");
		Map<String,Object> map = new HashMap<String,Object>();
		int beginRow = (currentPage-1)*pagePerRow;
		map.put("beginRow", beginRow);
		map.put("pagePerRow", pagePerRow);
		map.put("teacherNo", teacherNo);
		List<DoctorRequest> list = doctorRequestDao.requestDoctorList(map);
		logger.debug("5번"+list);
		int total = doctorRequestDao.requestDoctorCount();
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
		return returnMap;*/
		}
}
	/*public void addBloodSugar (BloodSugar bloodSugar) {
		bloodSugar.setBloodSugarNo("blood_sugar_"+(BloodSugarDao.selectBloodSugarNo()+1));
		logger.debug("addBloodSugar BloodSugarService");
		bloodSugarDao.addBloodSugar(bloodSugar);	
	}
*/