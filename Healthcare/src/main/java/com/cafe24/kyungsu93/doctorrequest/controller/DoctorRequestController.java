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
	//doctorRequestList
	//일반회원이 자신의 건강정보 열람을 요청한 의사의 정보를 보는곳이다.
	//current page , pageperrow 기본값 정해줘서 페이징을 위한 준비를 해놓고, map메서드 put 함수를 통해 데이터 넣어주고, 
	//Model addAttribute를 통해 모델에 담아 jsp로 뿌려준다.

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
	//memberListForDoctor
	//의사회원이 일반회원에게 건강정보 조회 요청을 위해 모든 일반회원 리스트 보는 곳이다.
	//memberNo를 Service,Dao를 거쳐 Mapper에서 일반회원 전체 리스트만 뽑아와서 jsp에서 보여준다.
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
	//addrequestDoctor 
	//의사회원이 일반회원에게 건강정보 조회 요청을 하는 곳이다.
	//커맨드객체 사용해서 doctorRequest형을 선언해주고, Service Dao Mapper 거쳐서 doctorRequestList로 리다이렉트 해준다.
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
	