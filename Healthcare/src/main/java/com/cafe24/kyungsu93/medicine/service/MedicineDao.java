package com.cafe24.kyungsu93.medicine.service;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class MedicineDao {
	private final static Logger logger = LoggerFactory.getLogger(MedicineDao.class);
	@Autowired SqlSessionTemplate sqlSession;
	final String NS = "com.cafe24.kyungsu93.medicine.service.MedicineMapper.";
	
	public int medicineTotalCount(String medicineName) {
		return sqlSession.selectOne(NS+"medicineTotalCount", medicineName);
	}
	
	public List<Medicine> getMedicineList(Map map) {
		return sqlSession.selectList(NS+"getMedicineList", map);
	}
	
	public void addMedicine(Medicine medicine) {
		logger.debug("MedicineDao.medicineInsert 메서드 호출");
		sqlSession.insert(NS + "addMedicine", medicine);
	}
}
