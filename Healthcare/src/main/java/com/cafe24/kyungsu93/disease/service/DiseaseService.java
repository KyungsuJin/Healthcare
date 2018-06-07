package com.cafe24.kyungsu93.disease.service;

import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;


@Service
@Transactional
public class DiseaseService {
	@Autowired
	DiseaseDao diseaseDao;
	private static final Logger logger = LoggerFactory.getLogger(DiseaseService.class);
	
	
	public List<MyDiseaseDetail> getMyDiseaseLsit(String memberNo) {
		logger.debug("DiseaseService_getMyDiseaseLsit");
		MyDisease myDisease =  diseaseDao.selectDiseaseNoForGetMyDiseaseList(memberNo);
		System.out.println("1111111etmyDiseaseNo : " + myDisease.getMyDiseaseNo());
		List<MyDiseaseDetail>list = diseaseDao.getMyDiseaseLsit(myDisease.getMyDiseaseNo());
		return list;
	}
	public int addMyDisease(MyDisease myDisease, MyDiseaseDetail myDiseaseDetail) {	
		logger.debug("DiseaseService_addMyDisease");
		String myDiseaseNo = diseaseDao.selectForMemberCheck(myDisease);
		System.out.println("myDiseaseNo : "+myDiseaseNo);
		if( myDiseaseNo == null) {
			int result = (diseaseDao.selectMyDiseaseNo())+1;
			logger.debug("DiseaseService_addMyDisease", result);
			String myDisease_temp = "my_disease_";
			myDiseaseNo = myDisease_temp+result;
			myDisease.setMyDiseaseNo(myDiseaseNo);
			
			diseaseDao.addMyDisease(myDisease);
		}
			myDiseaseDetail.setMyDiseaseNo(myDiseaseNo);
		return diseaseDao.addMyDiseaseDateil(myDiseaseDetail);
	}
	//ajax 다중셀렉트 대분류가 선택되면 No값을 받아와 소분류를 뿌려준다.
	public List<DiseaseSubCategory> selectBoxDisease(String diseaseNo) {
		logger.debug("DiseaseService_selectBoxDisease");
		List<DiseaseSubCategory> list = diseaseDao.selectBoxDisease(diseaseNo);
		return list;
	}
	public List<Disease> selectListForAdd() {
		logger.debug("DiseaseService_selectListForAdd");
		List<Disease> list = diseaseDao.selectListForAdd();
		return list;
	}
	public int removeDiseaseSubCategory(String diseaseSubCategoryNo) {
		logger.debug("DiseaseService_removeDiseaseSubCategory");
		return diseaseDao.removeDiseaseSubCategory(diseaseSubCategoryNo);
	}
	public int diseaseSubCategoryNameChecked(String diseaseSCName) {
		logger.debug("DiseaseService_diseaseSubCategoryNameChecked");
		return diseaseDao.diseaseSubCategoryNameChecked(diseaseSCName);
	}
	public int addDiseaseSubCategory(DiseaseSubCategory diseaseSubCategory) {
		logger.debug("DiseaseService_addDiseaseSubCategory");
		int result = (diseaseDao.selectDiseaseSubCategoryNo())+1;
		logger.debug("DiseaseService_addDiseaseSubCategory", result);
		String disease_sub_temp = "disease_sub_";
		String diseaseSubCategoryNo = disease_sub_temp+result;
		diseaseSubCategory.setDiseaseSubCategoryNo(diseaseSubCategoryNo);
		
		return diseaseDao.addDiseaseSubCategory(diseaseSubCategory);
	}
	public List<DiseaseSubCategory> getDiseaseDetail(String diseaseNo) {
		logger.debug("DiseaseService_getDiseaseDetail");
		List<DiseaseSubCategory> list = diseaseDao.getDiseaseDetail(diseaseNo);
		return list;
	}
	public List<Disease> getDiseaseList() {
		logger.debug("DiseaseService_getDiseaseList");
		List<Disease> list = diseaseDao.getDiseaseList();		
		System.out.println("--------------" +list.get(0).getDiseaseNo());
		
		return list;
	}
	public int addDisease(Disease disease) {
		logger.debug("DiseaseService_addDisease");
		int result = (diseaseDao.selectDiseaseNo())+1;
		logger.debug("DiseaseService_addDisease", result);
		String disease_temp = "disease_";
		String diseaseNo = disease_temp+result;
		disease.setDiseaseNo(diseaseNo);
		
		
		return diseaseDao.addDisease(disease);
	}
}
