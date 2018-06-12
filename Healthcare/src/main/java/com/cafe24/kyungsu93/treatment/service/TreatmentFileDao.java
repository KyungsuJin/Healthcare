package com.cafe24.kyungsu93.treatment.service;

import org.mybatis.spring.SqlSessionTemplate;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class TreatmentFileDao {
	private static final Logger logger = LoggerFactory.getLogger(TreatmentFileDao.class);

	final String NS = "com.cafe24.kyungsu93.treatment.service.TreatmentFileMapper.";
	
	@Autowired SqlSessionTemplate sqlSession;
	
	public int getTreatmentFileNo() {
		return sqlSession.selectOne(NS+"getTreatmentFileNo");
	}
	
	public void addTreatmentFile(TreatmentFile treatmentFile) {
		logger.debug("TreatmentFileDao.addTreatmentFile 메서드 호출");
		sqlSession.insert(NS + "addTreatmentFile", treatmentFile);
	}
	
	public int treatmentFileTotalCount(TreatmentRequest treatmentRequest) {
		return sqlSession.selectOne(NS+"treatmentFileTotalCount", treatmentRequest);
	}
	
	public void removeAllTreatmentFile(String treatmentNo) {
		sqlSession.delete(NS+"removeAllTreatmentFile", treatmentNo);
	}
	
	public void removeTreatmentFile(String treatmentFileNo) {
		sqlSession.delete(NS+"removeTreatmentFile", treatmentFileNo);
	}
}
