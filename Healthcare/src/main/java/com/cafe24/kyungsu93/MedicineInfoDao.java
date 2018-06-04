package com.cafe24.kyungsu93;

import org.mybatis.spring.SqlSessionTemplate;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;


@Repository
public class MedicineInfoDao {
	private static final Logger logger = LoggerFactory.getLogger(MedicineInfoDao.class);

	final String NS = "com.cafe24.kyungsu93.MedicineInfoMapper.";
	
	@Autowired SqlSessionTemplate sqlSession;
	public void medicineInfoInsert(MedicineInfo medicineInfo) {
		logger.debug("MedicineInfoDao.medicineInfoInsert 메서드 호출");
		sqlSession.insert(NS + "insertMedicineInfo", medicineInfo);
	}
	
}
