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
	
	public MyDisease selectDiseaseNoForGetMyDiseaseList(String memberNo) {
		logger.debug("DiseaseDao_selectDiseaseNoForGetMyDiseaseList");
		return sqlSession.selectOne(NS+"selectDiseaseNoForGetMyDiseaseList", memberNo);
	}
	public List<MyDiseaseDetail> getMyDiseaseLsit(String myDiseaseNo) {
		logger.debug("DiseaseDao_getMyDiseaseLsit");
		return sqlSession.selectList(NS+"selectMyDiseaseList", myDiseaseNo);
	}
	public int addMyDiseaseDateil(MyDiseaseDetail myDiseaseDetail) {
		logger.debug("DiseaseDao_addmyDiseaseDetail");
		return sqlSession.insert(NS+"insertMyDiseaseDetail", myDiseaseDetail);
	}
	//나의질병 pk를 구하기위한 select
	public String selectForMemberCheck(MyDisease myDisease) {
		logger.debug("DiseaseDao_selectMyDiseaseNo");
		return sqlSession.selectOne(NS+"selectForMemberCheck", myDisease);
	}
	public int selectMyDiseaseNo() {
		logger.debug("DiseaseDao_selectMyDiseaseNo");
		return sqlSession.selectOne(NS+"selectMyDiseaseNo");
	}
	public int addMyDisease(MyDisease myDisease) {
		logger.debug("DiseaseDao_addMyDisease");
		return sqlSession.insert(NS+"insertMyDisease", myDisease);
	}
	
	public List<DiseaseSubCategory> selectBoxDisease(String diseaseNo) {
		logger.debug("DiseaseDao_selectBoxDisease");
		List<DiseaseSubCategory> list = sqlSession.selectList(NS+"selectDiseaseSubCategory", diseaseNo);
		return list;
	}
	//selectBox 대분류 리스트
	public List<Disease> selectListForAdd() {
		logger.debug("DiseaseDao_selectListForAdd");
		List<Disease> list = sqlSession.selectList(NS+"selectDiseaseList");
		return list;
	}
	//질병소분류 삭제
	public int removeDiseaseSubCategory(String diseaseSubCategoryNo) {
		logger.debug("DiseaseDao_removeDiseaseSubCategory");
		return sqlSession.delete(NS+"deleteDiseaseSubCategory", diseaseSubCategoryNo);
	}
	//질병소분류 추가할때 중복확인
	public int diseaseSubCategoryNameChecked(String diseaseSCName) {
		logger.debug("DiseaseDao_diseaseSubCategoryNameChecked");
		return sqlSession.selectOne(NS+"selectDiseaseSubCategoryNameChecked", diseaseSCName);
	}
	//PK등록을위해 max값을 구하기위한 select
	public int selectDiseaseSubCategoryNo() {
		logger.debug("DiseaseDao_selectDiseaseSubCategoryNo");
		return sqlSession.selectOne(NS+"selectDiseaseSubCategoryNo");
	}
	//질병소분류 등록
	public int addDiseaseSubCategory(DiseaseSubCategory diseaseSubCategory) {
		logger.debug("DiseaseDao_addDiseaseSubCategory");
		return sqlSession.insert(NS+"insertDiseaseSubCategory", diseaseSubCategory);
	}
	//질병소분류 리스트
	public List<DiseaseSubCategory> getDiseaseDetail(String diseaseNo) {
		logger.debug("DiseaseDao_getDiseaseDetail");
		List<DiseaseSubCategory> list = sqlSession.selectList(NS+"selectDiseaseSubCategory", diseaseNo);
		return list;
	}
	//질병 리스트
	public List<Disease> getDiseaseList() {
		logger.debug("DiseaseDao_getDiseaseList");	
		List<Disease> list = sqlSession.selectList(NS+"selectDiseaseList");
		return list;
	}
	//PK등록을위해 max값을 구하기위한 select
	public int selectDiseaseNo() {
		logger.debug("DiseaseDao_selectDiseaseNo");
		return sqlSession.selectOne(NS+"selectDiseaseNo");
	}
	//질병등록
	public int addDisease(Disease disease) {
		logger.debug("addDisease");
		return sqlSession.insert(NS+"insertDisease",disease);
	}
}
