package com.cafe24.kyungsu93.bodymassindex.service;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class BodyMassIndexDao {
	@Autowired SqlSessionTemplate sqlSession;
	private static final Logger logger = LoggerFactory.getLogger(BodyMassIndexDao.class);
	final String NS = "com.cafe24.kyungsu93.BodyMassIndexMapper.";
	//체질량 입력후 등록
	public void addBodyMassIndex(BodyMassIndex bodyMassIndex) {
		logger.debug("BodyMassIndexDao.addBodyMassIndex");	
		sqlSession.insert(NS+"addBodyMassIndex",bodyMassIndex);
	}
	//체질량 등록번호 max 구하기
	public int bodyMassIndexEndNo() {
		logger.debug("BodyMassIndexDao.bodyMassIndexEndNo");
		return sqlSession.selectOne(NS + "bodyMassIndexEndNo");
	}
	//체질량을 등록한 리스트
	public List<BodyMassIndex> bodyMassIndexList(Map<String,Object> map) {
		logger.debug("BodyMassIndexDao.bodyMassIndexList");
		return sqlSession.selectList(NS + "bodyMassIndexList",map);
	}
	//체질량을 등록한 리스트의 카운트
	public int bodyMassIndexListCount(String memberNo) {
		logger.debug("BodyMassIndexDao.bodyMassIndexListCount");
		return sqlSession.selectOne(NS + "bodyMassIndexListCount", memberNo);
	}
	//체질량 날짜 검색  리스트
	public List<BodyMassIndex> bodyMassIndexDateSearchList(Map<String, Object> map) {
		logger.debug("BodyMassIndexDao.bodyMassIndexDateSearchList");
		return sqlSession.selectList(NS + "bodyMassIndexDateSearchList", map);
	}
	//체질량 날짜별 검색 카운트
	public int bodyMassIndexDateSearchListCount(Map<String, Object> map) {
		logger.debug("BodyMassIndexDao.bodyMassIndexDateSearchListCount");
		return sqlSession.selectOne(NS + "bodyMassIndexDateSearchListCount", map);
	}
	//체질량 차트리스트
	public List<BodyMassIndex> bodyMassIndexChart(String memberNo) {
		logger.debug("BodyMassIndexDao.bodyMassIndexChart");
		return sqlSession.selectList(NS + "bodyMassIndexChart", memberNo);
	}
	//건강검진표에 체질량정보를 사용했나 count
	public int healthScreenCount(String bodyMassIndexNo) {
		logger.debug("BodyMassIndexDao.healthScreenCount");
		return sqlSession.selectOne(NS + "healthScreenCount", bodyMassIndexNo);
	}
	//체질량 리스트 삭제
	public void deleteBmi(String bodyMassIndexNo) {
		logger.debug("BodyMassIndexDao.deleteBmi");
		sqlSession.delete(NS + "deleteBmi", bodyMassIndexNo);
	}
	//체질량 수정될 정보
	public BodyMassIndex modifyBmiInfo(String bodyMassIndexNo) {
		logger.debug("BodyMassIndexDao.modifyBmiInfo");
		return sqlSession.selectOne(NS + "modifyBmiInfo", bodyMassIndexNo);
	}
	//체질량 수정될 정보
	public void modifyBmi(BodyMassIndex bodyMassIndex) {
		logger.debug("BodyMassIndexDao.modifyBmi");
		sqlSession.update(NS + "modifyBmi", bodyMassIndex);
	}
}