package com.cafe24.kyungsu93.message.controller;

import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
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
	//메시지폼
	@RequestMapping(value="/message",method=RequestMethod.GET)
	public String message() {
		logger.debug("messageController.message");
		return "message/message";
	}
	//메시지폼
	@RequestMapping(value="/messageList",method=RequestMethod.GET)
	public String messageList() {
		logger.debug("messageController.messageList");
		return "message/messageList";
	}
	//메시지폼
	@RequestMapping(value="/sendMessage",method=RequestMethod.POST)
	public String sendMessage(Message message) {
		logger.debug("messageController.sendMessage");
		logger.debug("보내는사람아이디 : "+message.getSendMessageId());
		logger.debug("보내는사람 : "+message.getMemberSendNo());
		logger.debug("받는사람 : "+message.getMemberReceiveNo());
		messageService.sendMessage(message);
	return "message/message";
	}

}
