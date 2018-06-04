package com.cafe24.kyungsu93.disease.service;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;


@Repository
public class DiseaseDao {
	private static final Logger logger = LoggerFactory.getLogger(DiseaseDao.class);
	
	@Autowired
	SqlSessionTemplate sqlSession;
	final String NS = "com.cafe24.kyungsu93.disease.serivce.DiseaseMapper.";
	
	public DiseaseSubCategory diseaseSubCategoryNameChecked(String diseaseSCName) {
		logger.debug("DiseaseDao_diseaseSubCategoryNameChecked");
		return sqlSession.selectOne(NS+"selectDiseaseSubCategoryNameChecked", diseaseSCName);
	}
	public int selectDiseaseSubCategoryNo() {
		logger.debug("DiseaseDao_selectDiseaseSubCategoryNo");
		return sqlSession.selectOne(NS+"selectDiseaseSubCategoryNo");
	}
	public int addDiseaseSubCategory(DiseaseSubCategory diseaseSubCategory) {
		logger.debug("DiseaseDao_addDiseaseSubCategory");
		return sqlSession.insert(NS+"insertDiseaseSubCategory", diseaseSubCategory);
	}
	public List<DiseaseSubCategory> getDiseaseDetail(String diseaseNo) {
		logger.debug("DiseaseDao_getDiseaseDetail");
		List<DiseaseSubCategory> list = sqlSession.selectList(NS+"selectDiseaseDetail", diseaseNo);
		return list;
	}
	public List<Disease> getDiseaseList() {
		logger.debug("DiseaseDao_getDiseaseList");	
		List<Disease> list = sqlSession.selectList(NS+"selectDiseaseList");
		return list;
	}
	public int selectDiseaseNo() {
		logger.debug("DiseaseDao_selectDiseaseNo");
		return sqlSession.selectOne(NS+"selectDiseaseNo");
	}
	public int addDisease(Disease disease) {
		logger.debug("addDisease");
		return sqlSession.insert(NS+"insertDisease",disease);
	}
}
