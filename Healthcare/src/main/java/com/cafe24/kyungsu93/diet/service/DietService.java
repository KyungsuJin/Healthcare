package com.cafe24.kyungsu93.diet.service;

import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.cafe24.kyungsu93.Food;

@Service
@Transactional
public class DietService {
	@Autowired
	DietDao dietDao;
	
	private static final Logger logger = LoggerFactory.getLogger(DietService.class);
	
	public List<IngestCalorie> getIngestCalorie() {
		logger.debug("DietService_getIngestCalorie");
		return dietDao.getIngestCalorie();
	}
	public int addIngestCalorie(IngestCalorieRequest ingestCalorieRequest) {
		logger.debug("DietService_ingestCalorie");
		IngestCalorie ingestCalorie = new IngestCalorie();
		ingestCalorie.setIngestCalorieNo(ingestCalorieRequest.getIngestCalorieNo());
		ingestCalorie.setMemberNo(ingestCalorieRequest.getMemberNo());
		System.out.println("푸드넘버 : "+ingestCalorieRequest.getFoodNo().get(0));
		System.out.println("푸드넘버 : "+ingestCalorieRequest.getFoodNo().get(1));
		int addIngestCalorie = 0;
		for(int i=0; i <ingestCalorieRequest.getFoodNo().size();i++) {
			ingestCalorie.setFoodNo(ingestCalorieRequest.getFoodNo().get(i));
			ingestCalorie.setIngestWeight(ingestCalorieRequest.getIngestWeight().get(i));
			
			int result =(dietDao.selectIngestCalorieNo())+1;
			logger.debug("DietService_ingestCalorie", result);
			String temp = "ingest_calorie_";
			String ingestCalorieNo = temp+result;
			ingestCalorie.setIngestCalorieNo(ingestCalorieNo);
			
			addIngestCalorie = dietDao.addIngestCalorie(ingestCalorie);
		}
		return addIngestCalorie;
	}
	public List<Food> selectFoodSearch(String sv) {
		logger.debug("DietService_selectForAddIngetCalorie");
		return dietDao.selectFoodSearch(sv);
	}
}