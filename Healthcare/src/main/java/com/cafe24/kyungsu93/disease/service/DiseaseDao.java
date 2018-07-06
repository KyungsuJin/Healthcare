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
	
	//대분류 질병 삭제
	public int removeDisease(String diseaseNo) {
		logger.debug("DiseaseDao_removeDisease");
		return sqlSession.delete(NS+"deleteDisease", diseaseNo);
	}
	//나의 질병정보를 삭제하기 위한 delete
	public int removeMyDisease(String myDiseaseDetailNo) {
		logger.debug("DiseaseDao_removeMyDisease");
		return sqlSession.delete(NS+"deleteMyDisease", myDiseaseDetailNo);
	}
	//나의질병디테일 pk를 구하기위한 select
	public int selectMyDiseaseDetailNo() {
		logger.debug("DiseaseDao_selectMyDiseaseDetailNo");
		return sqlSession.selectOne(NS+"selectMyDiseaseDetailNo");
	}
	//나의질병을 보기위해 세션에서 회원정보를 받아와서 myDiseaseNo를 확인하기 위한 select
	public MyDisease selectDiseaseNoForGetMyDiseaseList(String memberNo) {
		logger.debug("DiseaseDao_selectDiseaseNoForGetMyDiseaseList");
		return sqlSession.selectOne(NS+"selectDiseaseNoForGetMyDiseaseList", memberNo);
	}
	//myDiseaseNo를 조회하여 나의질병정보를 확인할수 있다.
	public List<MyDiseaseDetail> getMyDiseaseLsit(String myDiseaseNo) {
		logger.debug("DiseaseDao_getMyDiseaseLsit");
		return sqlSession.selectList(NS+"selectMyDiseaseList", myDiseaseNo);
	}
	//대분류질병추가후 소분류 질병을 추가한다.
	public int addMyDiseaseDateil(MyDiseaseDetail myDiseaseDetail) {
		logger.debug("DiseaseDao_addmyDiseaseDetail");
		return sqlSession.insert(NS+"insertMyDiseaseDetail", myDiseaseDetail);
	}
	/*
	 * 한사람이 여러개의 질병을 갖기위해 하나의 myDiseaseNo를 갖는다.
	 * if문을 사용하여 이미 가지고잇으면 질병을 추가하고 없다면 myDiseaseNo를 생성한다.
	 */
	public String selectForMemberCheck(MyDisease myDisease) {
		logger.debug("DiseaseDao_selectMyDiseaseNo");
		return sqlSession.selectOne(NS+"selectForMemberCheck", myDisease);
	}
	//나의질병 pk를 구하기위한 select
	public int selectMyDiseaseNo() {
		logger.debug("DiseaseDao_selectMyDiseaseNo");
		return sqlSession.selectOne(NS+"selectMyDiseaseNo");
	}
	//대분류 질병을 추가한다.
	public int addMyDisease(MyDisease myDisease) {
		logger.debug("DiseaseDao_addMyDisease");
		return sqlSession.insert(NS+"insertMyDisease", myDisease);
	}
	//질병하위분류의 리스트를 볼수 있다.
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
