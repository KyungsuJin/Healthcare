package com.cafe24.kyungsu93.bodymassindex.service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.cafe24.kyungsu93.bodymassindex.controller.BodyMassIndexController;

@Service
public class BodyMassIndexService {
	@Autowired BodyMassIndexDao bodyMassIndexDao;
	private static final Logger logger = LoggerFactory.getLogger(BodyMassIndexService.class);
	//체질량 입력후 등록
	public void addBodyMassIndex(BodyMassIndex bodyMassIndex) {
		logger.debug("BodyMassIndexService.addBodyMassIndex");
		int bodyMassIndexEndNo=(bodyMassIndexDao.bodyMassIndexEndNo())+1;
		String bodyMassIndexStrNo="body_mass_index_";
		bodyMassIndex.setBodyMassIndexNo(bodyMassIndexStrNo+bodyMassIndexEndNo);
		bodyMassIndexDao.addBodyMassIndex(bodyMassIndex);
	}
	//체질량을 등록한 리스트
	public Map<String, Object> bodyMassIndexList(String memberNo,int currentPage,int pagePerRow,String bodyMassIndexDateStart,String bodyMassIndexDateEnd) {
		logger.debug("BodyMassIndexService.bodyMassIndexList");
		List<BodyMassIndex> list = new ArrayList<BodyMassIndex>();
		int bodyMassIndexListCount =0;
		Map<String,Object> map = new HashMap<String,Object>();
		int beginRow = (currentPage-1)*10;
		map.put("beginRow", beginRow);
		map.put("pagePerRow", pagePerRow);
		map.put("memberNo", memberNo);
		Map<String,Object> searchMap = new HashMap<String,Object>();
		searchMap.put("beginRow", beginRow);
		searchMap.put("pagePerRow", pagePerRow);
		searchMap.put("memberNo", memberNo);
		searchMap.put("bodyMassIndexDateStart", bodyMassIndexDateStart);
		searchMap.put("bodyMassIndexDateEnd", bodyMassIndexDateEnd);
		if(!bodyMassIndexDateStart.equals("") && !bodyMassIndexDateEnd.equals("")) {
			list=bodyMassIndexDao.bodyMassIndexDateSearchList(searchMap);
			bodyMassIndexListCount=bodyMassIndexDao.bodyMassIndexDateSearchListCount(searchMap);
		}
		if(bodyMassIndexDateStart.equals("")) {
			list=bodyMassIndexDao.bodyMassIndexList(map);
			bodyMassIndexListCount =bodyMassIndexDao.bodyMassIndexListCount(memberNo);
		}
		
		int lastPage = bodyMassIndexListCount/pagePerRow;
		if(bodyMassIndexListCount%pagePerRow>0) {
			lastPage++;
		}
		int startPage = ((currentPage-1)/10)*10+1;
		int endPage = startPage+pagePerRow-1;
		if(endPage>lastPage) {
			endPage=lastPage;
		}
		Map<String,Object> returnMap = new HashMap<String,Object>();
		returnMap.put("startPage", startPage);
		returnMap.put("endPage", endPage);
		returnMap.put("lastPage", lastPage);
		returnMap.put("list", list);
		return returnMap;
		
	}
	//체질량 차트리스트
	public List<BodyMassIndex> bodyMassIndexChart(String memberNo) {
		logger.debug("BodyMassIndexService.bodyMassIndexChart");
		return bodyMassIndexDao.bodyMassIndexChart(memberNo);

	}
	//체질량 삭제
	public int deleteBmi(String bodyMassIndexNo) {
		logger.debug("BodyMassIndexService.deleteBmi");
		int result=bodyMassIndexDao.healthScreenCount(bodyMassIndexNo);
		if(result==0) {
			bodyMassIndexDao.deleteBmi(bodyMassIndexNo);
		}
		return result;

	}
	//체질량 수정전 건강검진표 확인
	public int healtScreenCount(String bodyMassIndexNo) {
		logger.debug("BodyMassIndexService.modifyBmi");
		int result = bodyMassIndexDao.healthScreenCount(bodyMassIndexNo);
		return result;

	}
	//체질량 수정될 정보
	public BodyMassIndex modifyBmiInfo(String bodyMassIndexNo) {
		logger.debug("BodyMassIndexService.modifyBmi");
		return bodyMassIndexDao.modifyBmiInfo(bodyMassIndexNo);

	}
	//체질량 수정
	public void modifyBmi(BodyMassIndex bodyMassIndex) {
		logger.debug("BodyMassIndexService.modifyBmi");
		bodyMassIndexDao.modifyBmi(bodyMassIndex);

	}

}