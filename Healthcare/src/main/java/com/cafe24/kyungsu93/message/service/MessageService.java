package com.cafe24.kyungsu93.message.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.cafe24.kyungsu93.message.controller.MessageController;

@Service
@Transactional
public class MessageService {
	@Autowired MessageDao messageDao;
	private static final Logger logger = LoggerFactory.getLogger(MessageService.class);
	//메시지 아이디체크
	public Map<String,Object> messageIdChk(String memberId) {
		logger.debug("MessageService.messageIdChk");
		Map<String,Object> map = new HashMap<String,Object>();
		int count =messageDao.messageIdChk(memberId);//아이디가 있는지 체크
		String memberReceiveNo =messageDao.memberReceiveNo(memberId);//받은 아이디의 memberNo를 구함
		logger.debug("count : "+count);
		logger.debug("memberReceiveNo : "+memberReceiveNo);
		map.put("count", count);
		map.put("memberReceiveNo",memberReceiveNo);
		return map;
	}
	//메시지 전송
	public String sendMessage(Message message) {
		logger.debug("MessageService.sendMessage");
		int result = (messageDao.messageNo())+1;//메시지의 no 를 구함
		String messageNo = "message_";
		message.setSendMessageNo(messageNo+result);
		logger.debug("messageNo : "+message.getSendMessageNo());
		messageDao.sendMessage(message);//send_Message 테이블 에 데이트를 셋
		messageDao.sendMessageContent(message);//발신자 테이블에 데이터 셋
		messageDao.receiveMessageContent(message);//수신자 테이블에 데이터 셋
		return "";
	}
	//받은 메시지함 리스트 출력
	public Map<String, Object> messageReceiveList(String memberNo,int currentPage,int pagePerRow) {
		logger.debug("MessageService.messageReceiveList");
		Map<String,Object> map = new HashMap<String,Object>();
		int beginRoW=(currentPage-1)/10*10;
		map.put("beginRoW", beginRoW);
		map.put("pagePerRow", pagePerRow);
		map.put("memberNo", memberNo);
		List<Message> list=messageDao.messageReceiveList(map);
		int messageReceiveTotal =  messageDao.messageReceiveTotal(memberNo);
		logger.debug("messageReceiveTotal + : "+messageReceiveTotal);
		int lastPage=messageReceiveTotal/pagePerRow;
		if(messageReceiveTotal%pagePerRow>0) {
			lastPage++;
		}
		int startPage = ((currentPage-1)/10)*10+1;
		int endPage = startPage+pagePerRow-1;
		if(endPage>lastPage) {
			endPage=lastPage;
		}
		Map<String,Object> returnMap = new HashMap<String,Object>();
		returnMap.put("startPage", startPage);
		returnMap.put("endPage", endPage);
		returnMap.put("lastPage", lastPage);
		returnMap.put("list", list);
		return returnMap;
	}
	//메시지 읽음 표시
	public void messageContent(String messageNo) {
		logger.debug("MessageService.messageContent");
		int result =messageDao.selectMessageContent(messageNo);
		if(result==0) {
			messageDao.messageContent(messageNo);
		}
	}
	//보낸메시지 리스트 출력 함
	public List<Message> sendMessageList(String memberNo) {
		logger.debug("MessageService.sendMessageList");
		List<Message> list=messageDao.sendMessageList(memberNo);
		for(Message list1 : list) {
			logger.debug(list1.getMemberReceiveNo());
			list1.setMemberReceiveId(messageDao.ReceivemessageId(list1.getMemberReceiveNo()));
		}
		return list;
	}
	//받은 메시지 삭제
	public void ReceiveMessageDelete(String deleteMessageNo) {
		logger.debug("MessageService.ReceiveMessageDelete");
		messageDao.ReceiveMessageDelete(deleteMessageNo);
	}
	//받은 메시지 여러개 삭제
	public void deleteMessageList(List<String> sendMessageNo) {
		logger.debug("MessageService.deleteMessageList");
		for(String i : sendMessageNo) {
			String result =i;
			messageDao.ReceiveMessageDelete(result);
		}
	}
	//보낸 메시지 삭제
	public void SendMessageDelete(String deleteMessageNo) {
		logger.debug("MessageService.SendMessageDelete");
		messageDao.SendMessageDelete(deleteMessageNo);
	}
	// 받은 메시지 여러개 삭제
	public void deleteSendMessageList(List<String> sendMessageNo) {
		logger.debug("MessageService.deleteSendMessageList");
		for (String i : sendMessageNo) {
			String result = i;
			messageDao.SendMessageDelete(result);
		}
	}
}
