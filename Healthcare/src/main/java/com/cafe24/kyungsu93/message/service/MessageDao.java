package com.cafe24.kyungsu93.message.service;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class MessageDao {
	@Autowired SqlSessionTemplate sqlSession;
	private static final Logger logger = LoggerFactory.getLogger(MessageDao.class);
	final String NS = "com.cafe24.kyungsu93.MessageMapper.";
	//메시지 아이디체크
	public int messageIdChk(String memberId) {
		logger.debug("MessageDao.messageIdChk");
		return sqlSession.selectOne(NS+"messageIdChk",memberId);
	}
	//메시지 No
	public String memberReceiveNo(String memberId) {
		logger.debug("MessageDao.memberReceiveNo");
		return sqlSession.selectOne(NS+"memberReceiveNo",memberId);
	}
	//메시지 회원 번호
	public int messageNo() {
		logger.debug("MessageDao.messageNo");
		return sqlSession.selectOne(NS+"messageNo");
	}
	//메시지 번호
	public int sendMessage(Message message) {
		logger.debug("MessageDao.sendMessage");
		return sqlSession.insert(NS+"sendMessage",message);
	}
	//메시지  발신함 내용
	public int sendMessageContent(Message message) {
		logger.debug("MessageDao.sendMessageContent");
		return sqlSession.insert(NS+"sendMessageContent",message);
	}
	//메시지  받은 내용
	public int receiveMessageContent(Message message) {
		logger.debug("MessageDao.receiveMessageContent");
		return sqlSession.insert(NS+"receiveMessageContent",message);
	}
	public List<Message> messageReceiveList(String memberNo) {
		logger.debug("MessageDao.messageReceiveList");
		return sqlSession.selectList(NS+"messageReceiveList",memberNo);
	}

}
