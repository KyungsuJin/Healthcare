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
	final String NS = "com.cafe24.kyungsu93.service.HealthScreenMapper.";
	@Autowired private SqlSessionTemplate sqlSession;
	
	//건강검진표 데이터의 총 개수를 알아야 게시판화 할 수 있기때문에 총 ROW수를 구한다.
	public int healthScreenTotalCount(HealthScreen healthScreen) {
		return sqlSession.selectOne(NS+"healthScreenTotalCount", healthScreen);
	}
	
	public List<HealthScreen> getHealthScreenList(Map map){
		logger.debug("ArticleDao.getArticleList 메서드 호출");
		List<HealthScreen> list = sqlSession.selectList(NS+"getHealthScreenList", map);
		return list;
	}
	
	public void addHealthScreen(HealthScreen healthScreen) {
		sqlSession.insert(NS+"addHealthScreen", healthScreen);
	}
	
	public void removeHealthScreen(HealthScreen healthScreen) {
		sqlSession.delete(NS+"removeHealthScreen", healthScreen);
	}
	
	public HealthScreen getHealthScreenOne(HealthScreen healthScreen) {
		return sqlSession.selectOne(NS+"getHealthScreenOne", healthScreen);
	}
	
	public void modifyHealthScreen(HealthScreen healthScreen) {
		sqlSession.update(NS+"modifyHealthScreen", healthScreen);
	}
}
