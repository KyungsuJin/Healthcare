package com.cafe24.kyungsu93.doctorrequest.controller;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.cafe24.kyungsu93.bloodsugar.controller.BloodsugarController;
import com.cafe24.kyungsu93.bloodsugar.service.BloodSugar;
import com.cafe24.kyungsu93.doctorrequest.service.DoctorRequest;
import com.cafe24.kyungsu93.doctorrequest.service.DoctorRequestService;
import com.cafe24.kyungsu93.member.service.Member;

@Controller
public class DoctorRequestController {
	@Autowired
	private DoctorRequestService doctorRequestService;
	
	private static final Logger logger = LoggerFactory.getLogger(DoctorRequestController.class);
	//일반회원이 자신에게 요청한 의사를 볼 수 있고 제목 내용 등도 같이 보여준다. 요청날짜도 알 수 있다.
	@RequestMapping(value="/doctorRequestList", method=RequestMethod.GET)
	public String doctorRequestList(Model model
								,@RequestParam(value="currentPage", defaultValue="1") int currentPage
								,@RequestParam(value="pagePerRow", defaultValue="10")int pagePerRow) {
		logger.debug("doctorRequestController 에서 doctorRequestList 실행");
		Map<String,Object> map = doctorRequestService.doctorRequestList(currentPage, pagePerRow);
		logger.debug("1번-1"+map);
		logger.debug("1번"+currentPage);
		logger.debug("2번"+pagePerRow);
		model.addAttribute("lastPage", map.get("lastPage"));
		model.addAttribute("currentPage", currentPage);
		model.addAttribute("list", map.get("list"));
		model.addAttribute("lastBlockPage", map.get("lastBlockPage"));
		model.addAttribute("firstBlockPage", map.get("firstBlockPage"));
		model.addAttribute("totalBlock", map.get("totalBlock"));
		logger.debug("30번"+map);
		return "doctorrequest/doctorRequestList";
	}
	//의사가 일반회원 리스트 보는곳
	@RequestMapping(value="/memberListForDoctor", method=RequestMethod.GET)
	public String memberList(Model model
									,@RequestParam(value="memberNo",defaultValue="1")String memberNo) {
		logger.debug("doctorRequestController 에서 memberList 실행");
		logger.debug(memberNo+"<--- memberNo ");
		logger.debug("21번"+memberNo);
		List<Member> list = doctorRequestService.memberList(memberNo);
		logger.debug("24번"+list);
		model.addAttribute("list",list);
		return "doctorrequest/memberListForDoctor";
	}
	//의사가 일반회원에게 정보조회 요청 보내는곳
		@RequestMapping(value="/addrequestDoctor",method=RequestMethod.GET)
		public String requestDoctor() {
			return "doctorrequest/addDoctorRequest";
		}
		@RequestMapping(value="/addDoctorRequest", method = RequestMethod.POST)
		public String addDoctorRequest(HttpSession session,DoctorRequest doctorRequest) {
			System.out.println("addrequestDoctor  요청추가 후 List");
			System.out.println("addrequestDoctor  요청추가 후 addrequestDoctor "+doctorRequest.toString());
			logger.debug("5번"+doctorRequest);
			doctorRequestService.doctorRequest(doctorRequest);
			logger.debug("6번"+doctorRequest);
			return "redirect:/doctorRequestList";
		}
		/*@RequestMapping(value="/requestDoctorList", method=RequestMethod.GET)
		public String requestDoctorList(Model model
									,@RequestParam(value="currentPage", defaultValue="1") int currentPage
									,@RequestParam(value="pagePerRow", defaultValue="10")int pagePerRow 
									,@RequestParam(value="teacherNo") String teacherNo){
			logger.debug("65번"+teacherNo);
			logger.debug("DoctorRequestController 에서 requestDoctorList 실행");
			Map<String,Object> map = doctorRequestService.requestDoctorList(currentPage, pagePerRow,teacherNo);
			model.addAttribute("lastPage", map.get("lastPage"));
			model.addAttribute("currentPage", currentPage);
			model.addAttribute("listforDoctor", map.get("list"));
			model.addAttribute("lastBlockPage", map.get("lastBlockPage"));
			model.addAttribute("firstBlockPage", map.get("firstBlockPage"));
			model.addAttribute("totalBlock", map.get("totalBlock"));
			return "doctorrequest/doctorRequestDetail";
		}
		*/
}
	
	/*//회원이 의사가 한 요청을 거절
	@RequestMapping(value="/deniedExerciseFeedback",method=RequestMethod.GET)
	public String feedbackapprovalDenied(@RequestParam(value="exerciseFeedbackRequestNo") String exerciseFeedbackRequestNo) {
		logger.debug("ExerciseFeedbackController - feedbackapprovalDenied 거절 실행.");
		exerciseFeedbackService.feedbackapprovalDenied(exerciseFeedbackRequestNo);
		logger.debug("ExerciseFeedbackController - feedbackapprovalDenied 거절 완료");
		return "redirect:/exerciseFeedbackRequestDetail?exerciseFeedbackRequestNo="+exerciseFeedbackRequestNo;
	}
	
	//회원이 의사가 한 요청을 수락
	@RequestMapping(value="/acceptExerciseFeedback",method=RequestMethod.GET)
	public String acceptExerciseFeedback(@RequestParam(value="exerciseFeedbackRequestNo") String exerciseFeedbackRequestNo) {
		logger.debug("ExerciseFeedbackController - acceptExerciseFeedback 수락 실행.");
		exerciseFeedbackService.feedbackapprovalAccept(exerciseFeedbackRequestNo);
		logger.debug("ExerciseFeedbackController - acceptExerciseFeedback 수락 완료");
		return "redirect:/exerciseFeedbackRequestDetail?exerciseFeedbackRequestNo="+exerciseFeedbackRequestNo;
	}

	
		//회원이 의사가 한 요청을 거절
		@RequestMapping(value="/doctorRequestDetail",method=RequestMethod.GET)
		public String doctorRequestDenied(@RequestParam(value="exerciseFeedbackRequestNo") String exerciseFeedbackRequestNo) {
			logger.debug("ExerciseFeedbackController - feedbackapprovalDenied 거절 실행.");
			doctorRequestService.doctorRequestDenied(exerciseFeedbackRequestNo);
			logger.debug("ExerciseFeedbackController - feedbackapprovalDenied 거절 완료");
			return "redirect:/exerciseFeedbackRequestDetail?exerciseFeedbackRequestNo="+exerciseFeedbackRequestNo;
		}
		
		//회원이 의사가 한 요청을 수락
		@RequestMapping(value="/acceptExerciseFeedback",method=RequestMethod.GET)
		public String doctorRequestAccept(@RequestParam(value="exerciseFeedbackRequestNo") String exerciseFeedbackRequestNo) {
			logger.debug("ExerciseFeedbackController - acceptExerciseFeedback 수락 실행.");
			doctorRequestService.doctorRequestAccept(exerciseFeedbackRequestNo);
			logger.debug("ExerciseFeedbackController - acceptExerciseFeedback 수락 완료");
			return "redirect:/exerciseFeedbackRequestDetail?exerciseFeedbackRequestNo="+exerciseFeedbackRequestNo;
		}
	*/
	