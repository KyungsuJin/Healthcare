package com.cafe24.kyungsu93.exercise.controller;

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

import com.cafe24.kyungsu93.exercise.service.ExerciseRegistration;
import com.cafe24.kyungsu93.exercise.service.ExerciseService;
import com.cafe24.kyungsu93.message.controller.rest.MessageRestController;

@Controller
public class ExerciseController {
	@Autowired ExerciseService exerciseService;
	private static final Logger logger = LoggerFactory.getLogger(ExerciseController.class);
	//보증금 등록 폼
	@RequestMapping(value="/exerciseDepositRegistration",method=RequestMethod.GET)
	public String exerciseDepositRegistration() {
		logger.debug("ExerciseRestController.exerciseDepositRegistration get");
		return "exercise/exerciseDepositRegistration";
	}
	//운동매칭 페이지
	@RequestMapping(value="/exerciseMatching",method=RequestMethod.GET)
	public String exerciseMatching() {
		logger.debug("ExerciseRestController.exerciseMatching get");
		return "exercise/exerciseMatching";
	}
	//운동매칭 등록 페이지
	@RequestMapping(value="/addExerciseMatching",method=RequestMethod.GET)
	public String addExerciseMatching() {
		logger.debug("ExerciseRestController.addExerciseMatching get");
		return "exercise/addExerciseMatching";
	}
	//운동매칭 등록 
	@RequestMapping(value = "/addExerciseMatching", method = RequestMethod.POST)
	public String addExerciseMatching(ExerciseRegistration exerciseRegistration) {
		logger.debug("ExerciseRestController.addExerciseMatching POST");
		logger.debug(exerciseRegistration.toString());
		exerciseService.addExerciseMatching(exerciseRegistration);
		return "redirect:/exerciseMatching";
	}
	//운동 장소 선택
	@RequestMapping(value = "/exercisePlace", method = RequestMethod.GET)
	public String exercisePlace() {
		logger.debug("ExerciseRestController.exercisePlace get");
		return "exercise/exercisePlace";
	}
	//운동 장소 리스트 뷰
	@RequestMapping(value = "/exercisePlaceView", method = RequestMethod.GET)
	public String exercisePlaceView() {
		logger.debug("ExerciseRestController.exercisePlaceView get");
		return "exercise/exercisePlaceView";
	}
	//운동 등록한 매칭글 삭제 
	@RequestMapping(value = "/deleteExerciseMatching", method = RequestMethod.GET)
	public String deleteExerciseMatching(@RequestParam(value="exerciseMatchingNo")String exerciseMatchingNo) {
		logger.debug("ExerciseRestController.deleteExerciseMatching get");
		logger.debug("exerciseMatchingNo" + exerciseMatchingNo);
		exerciseService.deleteExerciseMatching(exerciseMatchingNo);
		return "redirect:/exerciseMatching";
	}
	//운동 매칭 내용
	@RequestMapping(value = "/exerciseMatchingContent", method = RequestMethod.GET)
	public String exerciseMatchingContent(Model model,@RequestParam(value = "exerciseMatchingNo") String exerciseMatchingNo) {
		logger.debug("ExerciseRestController.exerciseMatchingContent get");
		logger.debug("exerciseMatchingNo : " + exerciseMatchingNo);
		ExerciseRegistration exercise = exerciseService.exerciseMatchingContent(exerciseMatchingNo);
		logger.debug("컨트롤러 매칭 회원"+exercise.getExerciseMatchingAttendCount());
		model.addAttribute("exercise",exercise);
		return "exercise/exerciseMatchingContent";
	}
	//운동 매칭 등록한글 수정 폼
	@RequestMapping(value = "/modifyExerciseMatching", method = RequestMethod.GET)
	public String modifyExerciseMatching(Model model,@RequestParam(value = "exerciseMatchingNo") String exerciseMatchingNo) {
		logger.debug("ExerciseRestController.modifyExerciseMatching get");
		logger.debug("exerciseMatchingNo" + exerciseMatchingNo);
		ExerciseRegistration modifyExerciseMatching= exerciseService.exerciseMatchingContent(exerciseMatchingNo);
		model.addAttribute("modifyExerciseMatching",modifyExerciseMatching);
		return "exercise/modifyExerciseMatching";
	}
	//운동매칭 수정
	@RequestMapping(value = "/modifyExerciseMatching", method = RequestMethod.POST)
	public String modifyExerciseMatching(ExerciseRegistration exerciseRegistration) {
		logger.debug("ExerciseRestController.modifyExerciseMatching POST");
		logger.debug(exerciseRegistration.toString());
		exerciseService.modifyExerciseMatching(exerciseRegistration);
		return "redirect:/exerciseMatching";
	}
	//운동매칭 페이징
	@RequestMapping(value = "/exerciseMatchingList", method = RequestMethod.GET)
	public String exerciseMatchingList(Model model,@RequestParam(value="currentPage",defaultValue="1")int currentPage) {
		logger.debug("ExerciseRestController.exerciseMatchingList GET");
		model.addAttribute("currentPage",currentPage);
		return "exercise/exerciseMatching";
	}
	//자신의 운동 참가 리스트
	@RequestMapping(value = "/attendExerciseMatching", method = RequestMethod.GET)
	public String attendExerciseMatching(Model model
										,@RequestParam(value="memberNo")String memberNo) {
		logger.debug("ExerciseRestController.attendExerciseMatching GET");
		logger.debug(memberNo);
		List<ExerciseRegistration> attendExerciseMatchingList=exerciseService.attendExerciseMatching(memberNo);
		model.addAttribute("attendExerciseMatchingList",attendExerciseMatchingList);
		return "exercise/attendExerciseMatching";
	}
	//운동매칭 완료
	@RequestMapping(value = "/exerciseComplete", method = RequestMethod.GET)
	public String exerciseComplete(Model model,ExerciseRegistration exerciseRegistration) {
		logger.debug("ExerciseRestController.exerciseComplete");
		logger.debug("memberNo : " + exerciseRegistration.getMemberNo());
		logger.debug("exerciseMatchingNo : " + exerciseRegistration.getExerciseMatchingNo());
		int result = exerciseService.exerciseComplete(exerciseRegistration);
		logger.debug("result : " + result);
		model.addAttribute("memberNo",exerciseRegistration.getMemberNo());
		return "redirect:/attendExerciseMatching";
	}
	//운동매칭 참가 신청 취소
	@RequestMapping(value = "/exerciseMatchingCancel", method = RequestMethod.GET)
	public String exerciseMatchingCancel(Model model,
									ExerciseRegistration exerciseRegistration) {
		logger.debug("ExerciseRestController.exerciseMatchingCancel");
		logger.debug("memberNo : " + exerciseRegistration.getMemberNo());
		logger.debug("exerciseMatchingNo : " + exerciseRegistration.getExerciseMatchingNo());
		exerciseService.exerciseCancel(exerciseRegistration);
		model.addAttribute("memberNo",exerciseRegistration.getMemberNo());
		return "redirect:/attendExerciseMatching";
	}
	
	
}
