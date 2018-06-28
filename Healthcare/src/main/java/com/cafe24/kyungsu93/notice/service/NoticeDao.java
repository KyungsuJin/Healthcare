package com.cafe24.kyungsu93.notice.service;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class NoticeDao {
	private static final Logger logger = LoggerFactory.getLogger(NoticeDao.class);
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

	public int updateNotice(Notice notice) {
		logger.debug("16번"+notice);
		logger.debug("BloodsugarDao 에서 updateBloodsugar 실행------------------3번"+notice);
		logger.debug("-------------12번"+notice);
		return sqlSession.update(NS+"updateNotice",notice);
    }
	
	public Notice selectNoticeOne(String noticeNo) {
		logger.debug("BloodsugarDao 에서 selectBloodsugarOne 실행"+noticeNo);
		logger.debug("------------3번"+noticeNo);
		return sqlSession.selectOne(NS+"noticeOne",noticeNo);
	}
	
	public int deletenoticeCount(String noticeNo) {
		logger.debug("NoticeDao 에서 deleteNoticeCount 실행");
		logger.debug("876번"+noticeNo);
		return sqlSession.delete(NS+"deletenotice",noticeNo);
	}
	
	public int noticeSearchCount(Map<String, Object> map) {
		logger.debug("35번"+map);
		logger.debug("NoticeDao 에서 noticeCount 실행");
		return sqlSession.selectOne(NS+"noticeSearchCount",map);
	}
	
	public List<Notice> noticeSearchDate(Map<String, Object> map) {
		logger.debug("NoticeDao 에서 noticeSearchDate 실행");
		logger.debug("26번"+map);
		List<Notice> list = sqlSession.selectList(NS+"noticeSearchDate",map);
		logger.debug("27번"+map);
		logger.debug("27번-1"+list);
		return list;
	}
		
	public List<Notice> noticeSearchAll(Map<String, Object> map) {
		logger.debug("NoticeDao 에서 noticeSearchAll 실행");
		logger.debug("38번"+map);
		List<Notice> list = sqlSession.selectList(NS+"noticeSearchAll",map);
		return list;
	}
	
	/*public int noticeCountView(int noticeNo) {
		logger.debug("BloodsugarDao 에서 updateBloodsugar 실행------------------3번"+noticeNo);
		logger.debug("-------------12번"+noticeNo);
		return sqlSession.update(NS+"noticeCountView",noticeNo);
    }*/
	
	public List<Notice> noticeListDetail(Map<String,Object> map) {
		logger.debug("NoticeDao 에서 NoticeList 실행");
		logger.debug("4번"+map);
		List<Notice> list = sqlSession.selectList(NS+"noticeListDetail",map);
		return list;
	}
	
	public int noticeDetailCount() {
		logger.debug("NoticeDao 에서 noticeDetailCount 실행");
		return sqlSession.selectOne(NS+"noticeDetailCount");
	}
	
	/*public List<Notice> noticeDetail(Map<String,Integer> map) {
		logger.debug("NoticeDao 에서 noticeDetailCount 실행");
		List<Notice> list = sqlSession.selectOne(NS+"noticeDetailCount",map);
		return list;*/
	public int selectNoticNo() {
	logger.debug("NoticeDao - selectNoticeNo 실행");
	int row = sqlSession.selectOne(NS+"selectNoticNo");
	return row;
	}
}