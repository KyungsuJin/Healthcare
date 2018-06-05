package com.cafe24.kyungsu93.healthscreen.service;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;


@Repository
public class HealthScreenDao {
	private static final Logger logger = LoggerFactory.getLogger(HealthScreenDao.class);
	final String NS = "com.cafe24.kyungsu93.healthscreen.service.HealthScreenMapper.";
	@Autowired private SqlSessionTemplate sqlSession;
	
	//건강검진표 데이터의 총 개수를 알아야 게시판화 할 수 있기때문에 총 ROW수를 구한다.
	public int healthScreenTotalCount(HealthScreenRequest healthScreenRequest) {
		return sqlSession.selectOne(NS+"healthScreenTotalCount", healthScreenRequest);
	}
	
	public List<HealthScreenResponse> getHealthScreenList(Map<String, Integer> map){
		logger.debug("ArticleDao.getArticleList 메서드 호출");
		List<HealthScreenResponse> list = sqlSession.selectList(NS+"getHealthScreenList", map);
		return list;
	}
	
	public int getHealthScreenNo() {
		return sqlSession.selectOne(NS+"getHealthScreenNo");
	}
	
	public void addHealthScreen(HealthScreenRequest healthScreenRequest) {
		System.out.println(healthScreenRequest.toString());
		sqlSession.insert(NS+"addHealthScreen", healthScreenRequest);
	}
	
	public HealthScreenResponse getHealthScreenResult(HealthScreenRequest healthScreenRequest) {
		return sqlSession.selectOne(NS+"getHealthScreenResult", healthScreenRequest);
	}
	
	public void removeHealthScreen(HealthScreenRequest healthScreenRequest) {
		sqlSession.delete(NS+"removeHealthScreen", healthScreenRequest);
	}
	
	public HealthScreenResponse getHealthScreenOne(HealthScreenRequest healthScreenRequest) {
		return sqlSession.selectOne(NS+"getHealthScreenOne", healthScreenRequest);
	}
	
	public void modifyHealthScreen(HealthScreenRequest healthScreenRequest) {
		sqlSession.update(NS+"modifyHealthScreen", healthScreenRequest);
	}
}
