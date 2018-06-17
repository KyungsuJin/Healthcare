package com.cafe24.kyungsu93.message.service;

import java.util.List;
import java.util.Map;

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
	//메시지회원번호
	public String memberReceiveNo(String memberId) {
		logger.debug("MessageDao.memberReceiveNo");
		return sqlSession.selectOne(NS+"memberReceiveNo",memberId);
	}
	//메시지 No
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
	//받은 메시지 리스트
	public List<Message> messageReceiveList(Map<String,Object> map) {
		logger.debug("MessageDao.messageReceiveList");
		return sqlSession.selectList(NS+"messageReceiveList",map);
	}
	//받은 메시지 총 total
	public int messageReceiveTotal(String memberNo) {
		logger.debug("MessageDao.messageReceiveTotal");
		return sqlSession.selectOne(NS + "messageReceiveTotal", memberNo);
	}
	//받은 보낸메시지 총 total
	public int messageSendTotal(String memberNo) {
		logger.debug("MessageDao.messageSendTotal");
		return sqlSession.selectOne(NS + "messageSendTotal", memberNo);
	}
	public void messageContent(String messageNo) {
		logger.debug("MessageDao.messageContent");
		sqlSession.insert(NS+"messageContent",messageNo);
	}
	public int selectMessageContent(String messageNo) {
		logger.debug("MessageDao.selectMessageContent");
		return sqlSession.selectOne(NS+"selectMessageContent",messageNo);
	}
	//보낸메시지 리스트
	public List<Message> sendMessageList(Map<String,Object> map) {
		logger.debug("MessageDao.sendMessageList");
		return sqlSession.selectList(NS+"sendMessageList",map);
	}
	//받는 회원 no -> id 전환 
	public String receivemessageId(String ReceivemessageId) {
		logger.debug("MessageDao.receivemessageId");
		return sqlSession.selectOne(NS+"receivemessageId",ReceivemessageId);
	}
	//받은메시지 단일 삭제
	public void receiveMessageDelete(String deleteMessageNo) {
		logger.debug("MessageDao.receiveMessageDelete");
		sqlSession.delete(NS + "receiveMessageDelete", deleteMessageNo);
	}
	//보낸메시지 단일 삭제
	public void sendMessageDelete(String deleteMessageNo) {
		logger.debug("MessageDao.sendMessageDelete");
		sqlSession.delete(NS + "sendMessageDelete", deleteMessageNo);
	}
	//보낸메시지 읽었나 확인
	public int sendMessageChk(String sendMessageNo) {
		logger.debug("MessageDao.sendMessageChk");
		return sqlSession.selectOne(NS + "sendMessageChk", sendMessageNo);
	}
	//받은메시지 읽었나 확인
	public int readMessageChk(String sendMessageNo) {
		logger.debug("MessageDao.readMessageChk");
		return sqlSession.selectOne(NS + "readMessageChk", sendMessageNo);
	}
	//신고된 메시지  내용 가져오기 
	public Message complainMessageContent(String messageNo) {
		logger.debug("MessageDao.complainMessageContent");
		return sqlSession.selectOne(NS + "complainMessageContent", messageNo);
	}
	//신고된 내용 입력/신고처리
	public void messageComplain(Map<String,String> messageComplain) {
		logger.debug("MessageDao.complainMessageContet");
		sqlSession.insert(NS + "complainMessageContet", messageComplain);
	}
	//신고 번호 구해오기
	public int messageComplainNo() {
		logger.debug("MessageDao.messageComplainNo");
		return sqlSession.selectOne(NS + "messageComplainNo");
	}
	//이미 신고되었는지 확인
	public int alreadyComplain(String messageNo) {
		logger.debug("MessageDao.alreadyComplain");
		return sqlSession.selectOne(NS + "alreadyComplain",messageNo);
	}
	//신고받은 리스트
	public List<MessageComplain> messageComplainList(Map<String,Integer> map) {
		logger.debug("MessageDao.messageComplainList");
		return sqlSession.selectList(NS + "messageComplainList",map);
	}
	//신고받은 리스트
	public int complainListCount() {
		logger.debug("MessageDao.complainListCount");
		return sqlSession.selectOne(NS + "complainListCount");
	}
	//신고된 메시지 세부 내용
	public MessageComplain messageComplainContent(String sendMessageNo) {
		logger.debug("MessageDao.messageComplainContent");
		return sqlSession.selectOne(NS + "messageComplainContent",sendMessageNo);
	}

}
