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
		int beginRoW=(currentPage-1)*10;
		map.put("beginRoW", beginRoW);
		map.put("pagePerRow", pagePerRow);
		map.put("memberNo", memberNo);
		List<Message> list=messageDao.messageReceiveList(map);
		for(Message readList : list) {
			logger.debug(readList.getSendMessageNo());
			readList.setReadMessageChk(messageDao.readMessageChk(readList.getSendMessageNo()));
		}
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
	public Map<String,Object> sendMessageList(String memberNo,int currentPage,int pagePerRow) {
		logger.debug("MessageService.sendMessageList");
		Map<String,Object> map = new HashMap<String,Object>();
		int beginRoW=(currentPage-1)*10;
		map.put("beginRoW", beginRoW);
		map.put("pagePerRow", pagePerRow);
		map.put("memberNo", memberNo);
		List<Message> list=messageDao.sendMessageList(map);
		int messageSendTotal =  messageDao.messageSendTotal(memberNo);
		for(Message list1 : list) {//memberNo 를 memberId 로 전환
			logger.debug(list1.getMemberReceiveNo());
			list1.setMemberReceiveId(messageDao.receivemessageId(list1.getMemberReceiveNo()));
		}
		for(Message list2 : list) {//메시지의 수신여부를 확인
			logger.debug(list2.getSendMessageNo());
			list2.setSendMessageChk(messageDao.sendMessageChk(list2.getSendMessageNo()));
		}
		
		int lastPage=messageSendTotal/pagePerRow;
		if(messageSendTotal%pagePerRow>0) {
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
	//받은 메시지 삭제
	public void receiveMessageDelete(String deleteMessageNo) {
		logger.debug("MessageService.ReceiveMessageDelete");
		messageDao.receiveMessageDelete(deleteMessageNo);
	}
	//받은 메시지 여러개 삭제
	public void deleteMessageList(List<String> sendMessageNo) {
		logger.debug("MessageService.deleteMessageList");
		for(String i : sendMessageNo) {
			String result =i;
			messageDao.receiveMessageDelete(result);
		}
	}
	//보낸 메시지 삭제
	public void sendMessageDelete(String deleteMessageNo) {
		logger.debug("MessageService.sendMessageDelete");
		messageDao.sendMessageDelete(deleteMessageNo);
	}
	// 받은 메시지 여러개 삭제
	public void deleteSendMessageList(List<String> sendMessageNo) {
		logger.debug("MessageService.deleteSendMessageList");
		for (String i : sendMessageNo) {
			String result = i;
			messageDao.sendMessageDelete(result);
		}
	}
	//받은 메시지 신고 처리
	public int messageComplain(String complainReason,String messageNo) {
		logger.debug("MessageService.messageComplain");
		Message message = messageDao.complainMessageContent(messageNo);
		int complainEndNo = (messageDao.messageComplainNo())+1;
		String complaingString = "complain_";
		String complainNo = complaingString+complainEndNo;
		Map<String,String> messageComplain = new HashMap<String,String>();
		messageComplain.put("complainReason", complainReason);
		messageComplain.put("messageNo", messageNo);
		messageComplain.put("messageTitle", message.getMessageTitle());
		messageComplain.put("messageContent", message.getMessageContent());
		messageComplain.put("complainNo", complainNo);
		int result = messageDao.alreadyComplain(messageNo);
		if(result==0) {
			messageDao.messageComplain(messageComplain);
		}
		return result;
	}
	//신고받은 메시지 리스트
	public Map<String,Object> messageComplainList(int currentPage,int pagePerRow) {
		logger.debug("MessageService.messageComplainList");
		int beginRow = ((currentPage-1)/10)*10;
		Map<String,Integer> map = new HashMap<String,Integer>();
		map.put("beginRow", beginRow);
		map.put("pagePerRow", pagePerRow);
		List<MessageComplain> messageComplainList=messageDao.messageComplainList(map);
		int complainListCount = messageDao.complainListCount();
		int lastPage=complainListCount/pagePerRow;
		if(complainListCount%pagePerRow>0) {
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
		returnMap.put("messageComplainList", messageComplainList);
		return returnMap;

	}
	//신고받은 메시지 세부 내용
	public MessageComplain messageComplainContent(String sendMessageNo) {
		logger.debug("MessageService.messageComplainContent");
		return messageDao.messageComplainContent(sendMessageNo);

	}
	//관리자 메시지 삭제
	public void deleteMessageAll(String sendMessageNo) {
		logger.debug("MessageService.deleteMessageAll");
		 messageDao.receiveMessageDelete(sendMessageNo);
		 messageDao.sendMessageDelete(sendMessageNo);

	}
}
