package com.cafe24.kyungsu93.address.service;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class AddressDao {
	@Autowired SqlSessionTemplate sqlSession;
	final String NS = "com.cafe24.kyungsu93.address.service.AddressMapper.";
	
	public int getAddressNo() {
		return sqlSession.selectOne(NS+"getAddressNo");
	}
	
	public void addCity(Address address) {
		sqlSession.insert(NS+"addCity", address);
	}
	
	public void addDistrict(Address address) {
		sqlSession.insert(NS+"addDistrict", address);
	}
	
	public List<Address> getCityList(){
		return sqlSession.selectList(NS+"getCityList");
	}
	
	public List<Address> getDistrictList(Address address){
		return sqlSession.selectList(NS+"getDistrictList", address);
	}
	public String getAddressNo(Address address) {
		return sqlSession.selectOne(NS+"getAddressNoForDistrict", address);
	}
}
