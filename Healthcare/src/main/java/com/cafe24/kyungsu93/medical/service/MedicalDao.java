package com.cafe24.kyungsu93.medical.service;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class MedicalDao {
	@Autowired SqlSessionTemplate sqlSession;
	final String NS ="com.cafe24.kyungsu93.medical.service.MedicalMapper.";
	public int getMedicalNo() {
		int number = sqlSession.selectOne(NS+"getMedicalNo");
		System.out.println("number : " + number);
		return number;
	}
	
	public void addMedical(Medical medical) {
		sqlSession.insert(NS+"addMedical", medical);
	}
	
	public List<Medical> getMedicalAddressList(Map<String, Object> map){
		System.out.println("dao rest : " + map);
		return sqlSession.selectList(NS+"getMedicalAddressList", map);
	}
	
	public int medicalTotalCount(Medical medical) {
		return sqlSession.selectOne(NS+"medicalTotalCount", medical);
	}
}
