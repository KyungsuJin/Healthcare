package com.cafe24.kyungsu93.bodymassindex.service;

import java.util.List;

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
	public List<BodyMassIndex> bodyMassIndexList(String memberNo) {
		logger.debug("BodyMassIndexService.bodyMassIndexList");
		return bodyMassIndexDao.bodyMassIndexList(memberNo);
		
	}
	//체질량 차트리스트
	public List<BodyMassIndex> bodyMassIndexChart(String memberNo) {
		logger.debug("BodyMassIndexService.bodyMassIndexChart");
		return bodyMassIndexDao.bodyMassIndexChart(memberNo);

	}

}