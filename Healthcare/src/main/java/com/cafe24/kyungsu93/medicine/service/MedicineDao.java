package com.cafe24.kyungsu93.medicine.service;

import java.util.List;

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
	
	public List<Medicine> getMedicineList(String medicineName) {
		return sqlSession.selectList(NS+"getMedicineList", "%"+medicineName+"%");
	}
	
	public void addMedicine(Medicine medicine) {
		logger.debug("MedicineDao.medicineInsert 메서드 호출");
		sqlSession.insert(NS + "addMedicine", medicine);
	}
}
