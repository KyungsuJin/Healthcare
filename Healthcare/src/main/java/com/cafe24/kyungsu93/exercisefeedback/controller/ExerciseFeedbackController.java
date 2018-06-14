package com.cafe24.kyungsu93.exercisefeedback.controller;

import java.util.List;
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
	
	//운동피드백 답변
	@RequestMapping(value="/exerciseFeedResponse", method=RequestMethod.GET)
	public String exerciseFeedResponse(Model model,@RequestParam(value="exerciseFeedbackRequestNo") String exerciseFeedbackRequestNo) {
		logger.debug("ExerciseFeedbackController - exerciseFeedResponse 포워드 실행.");
		Map<String,Object> map =  exerciseFeedbackResponseService.exerciseFeedResponse(exerciseFeedbackRequestNo);
		model.addAttribute("map", map);
		logger.debug("map : "+map);
		logger.debug("ExerciseFeedbackController - exerciseFeedResponse 포워드 완료");
		return "exercisefeedback/exerciseFeedResponse";
	}	
	
	//운동 피드백 요청 상세 보기
	@RequestMapping(value="/exerciseFeedbackRequestDetail",method=RequestMethod.GET)
	public String exerciseFeedbackRequestDetail(Model model, @RequestParam(value="exerciseFeedbackRequestNo") String exerciseFeedbackRequestNo) {
		logger.debug("ExerciseFeedbackController - exerciseFeedbackRequestDetail 포워드 실행.");
		Map<String,Object> map = exerciseFeedbackService.exerciseFeedbackRequestDetail(exerciseFeedbackRequestNo);
		model.addAttribute("map", map);
		logger.debug("map : "+map);
		logger.debug("ExerciseFeedbackController - exerciseFeedbackRequestDetail 포워드 완료");
		return "exercisefeedback/exerciseFeedbackRequestDetail";
	}
	
	//운동 피드백 거절
	@RequestMapping(value="/deniedExerciseFeedback",method=RequestMethod.GET)
	public String feedbackapprovalDenied(@RequestParam(value="exerciseFeedbackRequestNo") String exerciseFeedbackRequestNo) {
		logger.debug("ExerciseFeedbackController - feedbackapprovalDenied 거절 실행.");
		exerciseFeedbackService.feedbackapprovalAccept(exerciseFeedbackRequestNo);
		logger.debug("ExerciseFeedbackController - feedbackapprovalDenied 거절 완료");
		return "redirect:/exerciseFeedbackRequestDetail?exerciseFeedbackRequestNo="+exerciseFeedbackRequestNo;
	}
	
	//운동 피드백 수락
	@RequestMapping(value="/acceptExerciseFeedback",method=RequestMethod.GET)
	public String acceptExerciseFeedback(@RequestParam(value="exerciseFeedbackRequestNo") String exerciseFeedbackRequestNo) {
		logger.debug("ExerciseFeedbackController - acceptExerciseFeedback 수락 실행.");
		exerciseFeedbackService.feedbackapprovalAccept(exerciseFeedbackRequestNo);
		logger.debug("ExerciseFeedbackController - acceptExerciseFeedback 수락 완료");
		return "redirect:/exerciseFeedbackRequestDetail?exerciseFeedbackRequestNo="+exerciseFeedbackRequestNo;
	}
	
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
		logger.debug("ExerciseFeedbackController - exerciseFeedbackList 포워드 완료");
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
		model.addAttribute("exercisefeedbacklist", map.get("exercisefeedbacklist"));
		model.addAttribute("lastBlockPage", map.get("lastBlockPage"));
		model.addAttribute("firstBlockPage", map.get("firstBlockPage"));
		model.addAttribute("totalBlock", map.get("totalBlock"));
		logger.debug("ExerciseFeedbackController - exerciseFeedbackRequestList 포워드 완료");
		return "exercisefeedback/exerciseFeedbackRequestList";
	}
	
	//운동 피드백 요청 완료 결과 페이지
	@RequestMapping(value="/exerciseFeedbackReqeustResult", method=RequestMethod.GET)
	public String exerciseFeedbackReqeustResult() {
		logger.debug("ExerciseFeedbackController - exerciseFeedbackReqeustResult 포워드 실행.");
		
		return "exercisefeedback/exerciseFeedbackReqeustResult";
	}	
	
	//운동 피드백 요청 완료
	@RequestMapping(value="/exerciseFeedbackRequest",method=RequestMethod.POST)
	public String exerciseFeedbackReqeustResult(ExerciseFeedbackRequest exerciseFeedbackRequest) {
		logger.debug("ExerciseFeedbackController - exerciseFeedbackReqeust 리다이렉트 실행.");
		exerciseFeedbackService.exerciseFeedbackRequest(exerciseFeedbackRequest);
		logger.debug("ExerciseFeedbackController - exerciseFeedbackReqeust 리다이렉트 완료");
		return "redirect:/exerciseFeedbackReqeustResult";
	}
	
	//운동피드백 요청
	@RequestMapping(value="/exerciseFeedbackRequest", method=RequestMethod.GET)
	public String exerciseFeedbackReqeust(Model model,@RequestParam(value="memberNo") String memberNo) {
		logger.debug("ExerciseFeedbackController - exerciseFeedbackReqeust 포워드 실행.");
		Map<String,Object> map = exerciseFeedbackService.exerciseFeedbackPtSelect(memberNo);
		logger.debug("memberNo:"+memberNo);
		model.addAttribute("map", map);
		logger.debug("ExerciseFeedbackController - exerciseFeedbackRequest 포워드 완료");
		return "exercisefeedback/exerciseFeedbackRequest";
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
		model.addAttribute("exercisePtlist", map.get("exercisePtlist"));
		model.addAttribute("lastBlockPage", map.get("lastBlockPage"));
		model.addAttribute("firstBlockPage", map.get("firstBlockPage"));
		model.addAttribute("totalBlock", map.get("totalBlock"));
		logger.debug("ExerciseFeedbackController - exerciseFeedbackPtList 포워드 완료");
		return "exercisefeedback/exerciseFeedbackPtList";
	}
	
}
