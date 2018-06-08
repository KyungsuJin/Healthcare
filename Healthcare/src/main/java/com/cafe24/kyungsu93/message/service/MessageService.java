package com.cafe24.kyungsu93.message.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.cafe24.kyungsu93.message.controller.MessageController;

@Service
public class MessageService {
	@Autowired MessageDao messageDao;
	private static final Logger logger = LoggerFactory.getLogger(MessageService.class);
	//메시지 아이디체크
	public Map<String,Object> messageIdChk(String memberId) {
		logger.debug("MessageService.messageIdChk");
		Map<String,Object> map = new HashMap<String,Object>();
		int count =messageDao.messageIdChk(memberId);
		String memberReceiveNo =messageDao.memberReceiveNo(memberId);
		logger.debug("count : "+count);
		logger.debug("memberReceiveNo : "+memberReceiveNo);
		map.put("count", count);
		map.put("memberReceiveNo",memberReceiveNo);
		return map;
	}
	//메시지 전송
	public String sendMessage(Message message) {
		logger.debug("MessageService.sendMessage");
		int result = (messageDao.messageNo())+1;
		String messageNo = "message_";
		message.setSendMessageNo(messageNo+result);
		logger.debug("messageNo : "+message.getSendMessageNo());
		messageDao.sendMessage(message);
		messageDao.sendMessageContent(message);
		messageDao.receiveMessageContent(message);
		return "";
	}
	public List<Message> messageReceiveList(String memberNo) {
		logger.debug("MessageService.messageReceiveList");
		return messageDao.messageReceiveList(memberNo);
	}
	public String messageContext(String messageNo) {
		logger.debug("MessageService.messageContext");
		messageDao.messageContext(messageNo);
		return "";
	}

}
