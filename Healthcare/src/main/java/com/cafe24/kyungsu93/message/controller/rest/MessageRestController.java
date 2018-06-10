package com.cafe24.kyungsu93.message.controller.rest;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;

import com.cafe24.kyungsu93.message.controller.MessageController;
import com.cafe24.kyungsu93.message.service.Message;
import com.cafe24.kyungsu93.message.service.MessageService;

@RestController
public class MessageRestController {
	@Autowired MessageService messageService;
	private static final Logger logger = LoggerFactory.getLogger(MessageRestController.class);
	
	//메시지 아이디체크
	@RequestMapping(value = "/messageIdChk", method = RequestMethod.POST)
	public Map<String, Object> messageIdChk(@RequestParam(value = "memberReceiveId") String memberId) {
		logger.debug("MessageRestController.messageIdChk");
		Map<String, Object> map = messageService.messageIdChk(memberId);
		return map;
	}
	//받은 메시지 리스트
	@RequestMapping(value = "/messageReceiveList", method = RequestMethod.POST)
	public Map<String, Object> messageReceiveList(@RequestParam(value = "memberReceiveNo") String memberNo
												,@RequestParam(value="currentPage",defaultValue="1")int currentPage
												,@RequestParam(value="pagePerRow",defaultValue="10")int pagePerRow){
		logger.debug("MessageRestController.messageReceiveList");
		logger.debug("memberNo: "+memberNo);
		Map<String, Object> map=messageService.messageReceiveList(memberNo,currentPage,pagePerRow);
		map.put("currentPage", currentPage);
		return map;
	}
	//보낸 메시지 리스트
	@RequestMapping(value = "/sendMessageList", method = RequestMethod.POST)
	public Map<String, Object> sendMessageList(@RequestParam(value = "sendMemberNo") String memberNo) {
		logger.debug("MessageRestController.sendMessageList");
		logger.debug("memberNo: "+memberNo);
		List<Message> list=messageService.sendMessageList(memberNo);
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("list", list);
		return map;
	}
	//받은메시지 다중 삭제
	@RequestMapping(value = "/deleteMessageList", method = RequestMethod.POST)
	public String deleteMessageList(@RequestParam(value = "valueArrayTest[]") List<String> sendMessageNo) {
		logger.debug("MessageRestController.deleteMessageList");
		for(String i : sendMessageNo) {
			String result =i;
			logger.debug("반복"+result);
		}
		messageService.deleteMessageList(sendMessageNo);
		return "success";
	}

	// 보낸메시지 다중 삭제
	@RequestMapping(value = "/deleteSendMessageList", method = RequestMethod.POST)
	public String deleteSendMessageList(@RequestParam(value = "valueArrayTest[]") List<String> sendMessageNo) {
		logger.debug("MessageRestController.deleteSendMessageList");
		for (String i : sendMessageNo) {
			String result = i;
			logger.debug("반복" + result);
		}
		messageService.deleteSendMessageList(sendMessageNo);
		return "success123";
	}
}
