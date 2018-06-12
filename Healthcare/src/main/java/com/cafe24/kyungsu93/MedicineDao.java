package com.cafe24.kyungsu93;

import org.mybatis.spring.SqlSessionTemplate;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;


@Repository
public class MedicineDao {
	private static final Logger logger = LoggerFactory.getLogger(MedicineDao.class);

	final String NS = "com.cafe24.kyungsu93.MedicineMapper.";
	
	@Autowired SqlSessionTemplate sqlSession;
	public void medicineInsert(Medicine medicine) {
		logger.debug("MedicineDao.medicineInsert 메서드 호출");
		sqlSession.insert(NS + "insertMedicine", medicine);
	}
	
}
