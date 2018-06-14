package com.cafe24.kyungsu93.bodymassindex.service;

import java.util.List;

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
	public List<BodyMassIndex> bodyMassIndexList(String memberNo) {
		logger.debug("BodyMassIndexDao.bodyMassIndexList");
		return sqlSession.selectList(NS + "bodyMassIndexList",memberNo);
	}
}
