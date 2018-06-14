package com.cafe24.kyungsu93.exercisefeedback.controller;

import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.cafe24.kyungsu93.exercisefeedback.service.ExerciseFeedbackRequest;
import com.cafe24.kyungsu93.exercisefeedback.service.ExerciseFeedbackResponseService;
import com.cafe24.kyungsu93.exercisefeedback.service.ExerciseFeedbackService;

@Controller
public class ExerciseFeedbackController {
	@Autowired
	private ExerciseFeedbackService exerciseFeedbackService;
	@Autowired
	private ExerciseFeedbackResponseService exerciseFeedbackResponseService;
	private static final Logger logger = LoggerFactory.getLogger(ExerciseFeedbackController.class);
	
	//운동피드백 리스트
	@RequestMapping(value="/exerciseFeedbackList", method=RequestMethod.GET)
	public String exerciseFeedbackList(Model model
								,@RequestParam(value="currentPage", defaultValue="1") int currentPage
								,@RequestParam(value="pagePerRow", defaultValue="10")int pagePerRow) {
		logger.debug("ExerciseFeedbackController - exerciseFeedbackList 포워드 실행");
		Map<String,Object> map = exerciseFeedbackService.exerciseFeedbackList(currentPage, pagePerRow);
		model.addAttribute("lastPage", map.get("lastPage"));
		model.addAttribute("currentPage", currentPage);
		model.addAttribute("list", map.get("list"));
		model.addAttribute("lastBlockPage", map.get("lastBlockPage"));
		model.addAttribute("firstBlockPage", map.get("firstBlockPage"));
		model.addAttribute("totalBlock", map.get("totalBlock"));
		return "exercisefeedback/exerciseFeedbackList";
	}
	
	//운동피드백 요청 리스트
	@RequestMapping(value="/exerciseFeedbackRequestList", method=RequestMethod.GET)
	public String exerciseFeedbackSelect(Model model
								,@RequestParam(value="currentPage", defaultValue="1") int currentPage
								,@RequestParam(value="pagePerRow", defaultValue="10")int pagePerRow) {
		logger.debug("ExerciseFeedbackController - exerciseFeedbackRequestList 포워드 실행");
		Map<String,Object> map = exerciseFeedbackService.exerciseFeedbackRequestList(currentPage, pagePerRow);
		model.addAttribute("lastPage", map.get("lastPage"));
		model.addAttribute("currentPage", currentPage);
		model.addAttribute("list", map.get("list"));
		model.addAttribute("lastBlockPage", map.get("lastBlockPage"));
		model.addAttribute("firstBlockPage", map.get("firstBlockPage"));
		model.addAttribute("totalBlock", map.get("totalBlock"));
		return "exercisefeedback/exerciseFeedbackRequestList";
	}
	
	//운동 피드백 요청 완료
	@RequestMapping(value="/exerciseFeedbackReqeust",method=RequestMethod.POST)
	public String modifyGroup(ExerciseFeedbackRequest exerciseFeedbackRequest) {
		logger.debug("ExerciseFeedbackController - exerciseFeedbackReqeust 리다이렉트 실행.");
		exerciseFeedbackService.exerciseFeedbackRequest(exerciseFeedbackRequest);
		return "redirect:/exerciseFeedbackReqeustResult";
	}
	
	//운동피드백 요청
	@RequestMapping(value="/exerciseFeedbackReqeust", method=RequestMethod.GET)
	public String modifyGroup(Model model,@RequestParam(value="memberNo") String memberNo) {
		logger.debug("ExerciseFeedbackController - exerciseFeedbackReqeust 포워드 실행.");
		ExerciseFeedbackRequest exerciseFeedback = exerciseFeedbackService.exerciseFeedbackPtSelect(memberNo);
		model.addAttribute("exerciseFeedback", exerciseFeedback);
		return "group/exerciseFeedbackReqeust";
	}	
	
	//강사 리스트
	@RequestMapping(value="/exerciseFeedbackPtList", method=RequestMethod.GET)
	public String exerciseFeedbackRequestList(Model model
								,@RequestParam(value="currentPage", defaultValue="1") int currentPage
								,@RequestParam(value="pagePerRow", defaultValue="10")int pagePerRow) {
		logger.debug("ExerciseFeedbackController - exerciseFeedbackPtList 포워드 실행");
		Map<String,Object> map = exerciseFeedbackService.exerciseFeedbackPtList(currentPage, pagePerRow);
		model.addAttribute("lastPage", map.get("lastPage"));
		model.addAttribute("currentPage", currentPage);
		model.addAttribute("exercisefeedbacklist", map.get("exercisefeedbacklist"));
		model.addAttribute("lastBlockPage", map.get("lastBlockPage"));
		model.addAttribute("firstBlockPage", map.get("firstBlockPage"));
		model.addAttribute("totalBlock", map.get("totalBlock"));
		return "exercisefeedback/exerciseFeedbackPtList";
	}
	
}
