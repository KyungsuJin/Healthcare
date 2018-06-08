package com.cafe24.kyungsu93.notice.service;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.cafe24.kyungsu93.bloodpressure.service.BloodPressure;
import com.cafe24.kyungsu93.bloodsugar.controller.BloodsugarController;

@Repository
public class NoticeDao {
	private static final Logger logger = LoggerFactory.getLogger(BloodsugarController.class);
	@Autowired
	private SqlSessionTemplate sqlSession;
	final String NS = "com.cafe24.kyungsu93.notice.service.NoticeMapper.";

	public List<Notice> noticeList(Map<String,Integer> map) {
		logger.debug("NoticeDao 에서 NoticeList 실행");
		return sqlSession.selectList(NS+"noticeList",map);
	}
	
	public int noticeCount() {
		logger.debug("NoticeDao 에서 noticeCount 실행");
		return sqlSession.selectOne(NS+"noticeCount");
	}
	
	public int addNotice(Notice notice) {
		logger.debug("--------------3번"+notice);
		int row = sqlSession.insert(NS+"addnotice",notice);
		logger.debug("===========4번"+notice);
		return row;
	}
/*	
	public int updateNotice(Notice notice) {
		logger.debug("BloodsugarDao 에서 updateBloodsugar 실행------------------3번"+notice);
		logger.debug("-------------12번"+notice);
		return sqlSession.update(NS+"updateNotice",notice);
    }
	
	public Notice selectNoticeOne(String noticeno) {
		logger.debug("BloodsugarDao 에서 selectBloodsugarOne 실행"+noticeno);
		logger.debug("------------3번"+noticeno);
		return sqlSession.selectOne(NS+"NoticeOne",noticeno);
	}*/
	/*
	public int deletesugarCount(String bloodsugarno) {
		logger.debug("BloodPressureDao 에서 deletePressureCount 실행");
		return sqlSession.delete(NS+"deleteBloodsugar",bloodsugarno);
	}*/
}
