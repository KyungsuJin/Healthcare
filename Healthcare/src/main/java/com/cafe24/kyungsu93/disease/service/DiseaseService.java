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
	
	public DiseaseSubCategory diseaseSubCategoryNameChecked(String diseaseSCName) {
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
		logger.debug("DiseaseService_addDisease");
		String disease_temp = "disease_";
		String diseaseNo = disease_temp+result;
		disease.setDiseaseNo(diseaseNo);
		
		
		return diseaseDao.addDisease(disease);
	}
}
