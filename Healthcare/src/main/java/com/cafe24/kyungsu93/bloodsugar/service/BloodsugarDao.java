package com.cafe24.kyungsu93.bloodsugar.service;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class BloodsugarDao {
	@Autowired
	private SqlSessionTemplate sqlSession;
	final String NS = "com.cafe24.kyungsu93.group.service.BloodsugarMapper.";
	
	public int addBloodsugar(Bloodsugar bloodsugar) {
		
		int row = sqlSession.insert(NS+"addBloodsugar" , bloodsugar);
		
		return row;
		
				
		
	}

	
}
