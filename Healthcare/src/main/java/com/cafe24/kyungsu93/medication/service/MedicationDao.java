package com.cafe24.kyungsu93.medication.service;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.cafe24.kyungsu93.medication.service.MedicationResponse;
import com.cafe24.kyungsu93.medication.service.MedicationRequest;


@Repository
public class MedicationDao {
	private static final Logger logger = LoggerFactory.getLogger(MedicationDao.class);

	@Autowired private SqlSessionTemplate sqlSession;
	final String NS = "com.cafe24.kyungsu93.medication.service.MedicationMapper.";
	
	public int medicationTotalCount() {
		return sqlSession.selectOne(NS+"medicationTotalCount");
	}
	
	public List<MedicationResponse> getMedicationList(Map map){
		logger.debug("MedicationDao.getMedicationList.map : " + map);
		List<MedicationResponse> list = sqlSession.selectList(NS+"getMedicationList", map);
		return list;
	}
	
	public int getMedicationNo() {
		return sqlSession.selectOne(NS+"getMedicationNo");
	}
	
	public void addMedication(MedicationRequest medicationRequest) {
		sqlSession.selectOne(NS+"addMedication", medicationRequest);
	}
	
	public MedicationResponse getMedicationContent(MedicationRequest medicationRequest) {
		return sqlSession.selectOne(NS+"getMedicationContent", medicationRequest);
	}
	
	public void removeMedicationRecord(MedicationRequest medicationRequest) {
		sqlSession.delete(NS+"removeMedicationRecord", medicationRequest);
	}
	
	public void removeMedication(MedicationRequest medicationRequest) {
		sqlSession.delete(NS+"removeMedication", medicationRequest);
	}
	
	public void modifyMedication(MedicationRequest medicationRequest) {
		sqlSession.update(NS+"modifyMedication", medicationRequest);
	}
	
	public List<MedicationRecord> getMedicationRecordList(MedicationRequest medicationRequest) {
		return sqlSession.selectList(NS+"getMedicationRecordList", medicationRequest);
	}
	
	public void addMedicationRecord(MedicationRecord medicationRecord) {
		sqlSession.insert(NS+"addMedicationRecord", medicationRecord);
	}
	public void removeMedicationRecordDate(MedicationRecord medicationRecord) {
		sqlSession.delete(NS+"removeMedicationRecordDate", medicationRecord);
	}
	public int getMedicationRecordNo() {
		return sqlSession.selectOne(NS+"getMedicationRecordNo");
	}
}
