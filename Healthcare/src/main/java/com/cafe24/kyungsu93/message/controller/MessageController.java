package com.cafe24.kyungsu93.message.controller;

import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.cafe24.kyungsu93.message.service.Message;
import com.cafe24.kyungsu93.message.service.MessageService;
@Controller
public class MessageController {
	@Autowired MessageService messageService;
	private static final Logger logger = LoggerFactory.getLogger(MessageController.class);
	//메시지 작성 클릭시 화면
	@RequestMapping(value="/message",method=RequestMethod.GET)
	public String message() {
		logger.debug("messageController.message");
		return "message/message";
	}
	//메시지리스트 화면
	@RequestMapping(value="/messageList",method=RequestMethod.GET)
	public String messageList() {
		logger.debug("messageController.messageList");
		return "message/messageList";
	}
	//메시지  전송
	@RequestMapping(value="/sendMessage",method=RequestMethod.POST)
	public String sendMessage(Message message) {
		logger.debug("messageController.sendMessage");
		logger.debug("보내는사람아이디 : "+message.getSendMessageId());
		logger.debug("보내는사람 : "+message.getMemberSendNo());
		logger.debug("받는사람 : "+message.getMemberReceiveNo());
		messageService.sendMessage(message);
	return "message/message";
	}
	//수신메시지 내용 보기및 읽음 표시 
	@RequestMapping(value="/messageReceiveContent",method=RequestMethod.GET)
	public String messageReceiveContent(Model model,Message message) {
		logger.debug("messageController.messageReceiveContent");
		logger.debug("messageNo : "+message.toString());
		messageService.messageContent(message.getSendMessageNo());
		model.addAttribute("message",message);
	return "message/messageReceiveContent";
	}
	//발신메시지 내용 보기
	@RequestMapping(value="/messageSendContent",method=RequestMethod.GET)
	public String messageSendContent(Model model,Message message) {
		logger.debug("messageController.messageSendContent");
		logger.debug("messageNo : "+message.toString());
		model.addAttribute("message",message);
	return "message/messageSendContent";
	}
	//받은 메시지 단일 삭제
	@RequestMapping(value="/ReceiveMessageDelete",method=RequestMethod.POST)
	public String ReceiveMessageDelete(@RequestParam(value="deleteMessageNo")String deleteMessageNo) {
		logger.debug("messageController.ReceiveMessageDelete");
		logger.debug("sendMessageNo :"+deleteMessageNo);
		messageService.ReceiveMessageDelete(deleteMessageNo);
	return "message/messageList";
	}
	//보낸 메시지 단일 삭제
	@RequestMapping(value="/SendMessageDelete",method=RequestMethod.POST)
	public String SendMessageDelete(@RequestParam(value="deleteMessageNo")String deleteMessageNo) {
		logger.debug("messageController.SendMessageDelete");
		logger.debug("sendMessageNo :"+deleteMessageNo);
		messageService.SendMessageDelete(deleteMessageNo);
	return "message/messageList";
	}
/*	@RequestMapping(value="/des",method=RequestMethod.GET)
	public String des(@RequestParam(value="currentPage")int currentPage) {
		logger.debug("messageController.des");
		logger.debug("currentPage :" +currentPage);
	return "message/messageList";
	}*/
/*	//받은 메시지 리스트
		@RequestMapping(value = "/messageReceiveList1", method = RequestMethod.GET)
		public String messageReceiveList1(Model model,
								@RequestParam(value = "memberReceiveNo") String memberNo
													,@RequestParam(value="currentPage",defaultValue="1")int currentPage
													,@RequestParam(value="pagePerRow",defaultValue="10")int pagePerRow){
			logger.debug("MessageRestController.messageReceiveList");
			logger.debug("memberNo: "+memberNo);
			Map<String, Object> map=messageService.messageReceiveList(memberNo,currentPage,pagePerRow);
			model.addAttribute("currentPage",currentPage);
			model.addAttribute("startPage",map.get("startPage"));
			model.addAttribute("endPage",map.get("endPage"));
			model.addAttribute("lastPage",map.get("lastPage"));
			model.addAttribute("list",map.get("list"));
			return "message/messageList";
		}*/

}
