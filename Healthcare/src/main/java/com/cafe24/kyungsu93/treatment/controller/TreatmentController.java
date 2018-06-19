package com.cafe24.kyungsu93.treatment.controller;

import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.cafe24.kyungsu93.treatment.service.TreatmentRequest;
import com.cafe24.kyungsu93.treatment.service.TreatmentResponse;
import com.cafe24.kyungsu93.treatment.service.TreatmentService;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

@Controller
public class TreatmentController {
	private static final Logger logger = LoggerFactory.getLogger(TreatmentController.class);
	@Autowired TreatmentService treatmentService;
	
	////////////////////// 게시글 작성 후 파일 업로드 //////////////////////
	@RequestMapping(value="/addTreatment", method=RequestMethod.GET)
	public String addTreatment(Model model
								,@RequestParam(value="currentPage", defaultValue="1" ) int currentPage
								,@RequestParam(value="pagePerRow", defaultValue="10" ) int pagePerRow
								,HttpSession session) {
		logger.debug("TreatmentController.addTreatment GET 방식 호출");
		if(session.getAttribute("memberSessionLevel").toString().equals("2")) {
			model.addAttribute("currentPage", currentPage);
			model.addAttribute("pagePerRow", pagePerRow);
			return "treatment/addTreatment";
		} else {
			return "redirect:/";
		}
	}
	
	@RequestMapping(value="/addTreatment", method=RequestMethod.POST)
	public String addTreatment(TreatmentRequest treatmentRequest, HttpSession session, Model model) {
		logger.debug("TreatmentController.addTreatment POST 방식 호출");
		if(session.getAttribute("memberSessionLevel").toString().equals("2")) {
			if(treatmentRequest.getMemberNo() == null) {
				treatmentRequest.setMemberNo(session.getAttribute("memberSessionNo").toString());
			}
			System.out.println(session.getAttribute("memberSessionNo").toString());
			List<MultipartFile> multipartFileList = treatmentRequest.getMultipartFile();
			if(multipartFileList != null) {
				for(MultipartFile multipartFile : multipartFileList) {
					if(multipartFile.getContentType().equals("application/x-msdownload")) {
						model.addAttribute("treatment", treatmentRequest);
						model.addAttribute("exeFileName", multipartFile.getOriginalFilename());
						return "treatment/addTreatment";
					}
				}
			}
			String path = session.getServletContext().getRealPath("/upload");
			logger.debug("TreatmentController.addTreatment.path : " + path);
			treatmentService.addTreatment(treatmentRequest, path+"/");
			return "redirect:/getTreatmentList";
		} else {
			return "redirect:/";
		}
	}
	
	////////////////////// 게시물 리스트 출력 //////////////////////	
	@RequestMapping(value="/getTreatmentList", method=RequestMethod.GET)
	public String getTreatmentList(Model model
									,TreatmentRequest treatmentRequest
									,@RequestParam(value="currentPage", defaultValue="1" ) int currentPage
									,@RequestParam(value="pagePerRow", defaultValue="10" ) int pagePerRow
									,HttpSession session) {		
		logger.debug("TreatmentController.getTreatmentList GET 방식 호출");
		if(session.getAttribute("memberSessionLevel") != null && session.getAttribute("memberSessionLevel").toString().equals("2")) {
			Map map = treatmentService.getTreatmentList(currentPage, pagePerRow, treatmentRequest);
			model.addAttribute("list", map.get("list"));
			model.addAttribute("firstPage", map.get("firstPage"));
			model.addAttribute("lastPage", map.get("lastPage"));
			model.addAttribute("beforePage", map.get("beforePage"));
			model.addAttribute("afterPage", map.get("afterPage"));
			model.addAttribute("currentPage", currentPage);
			model.addAttribute("pagePerRow", pagePerRow);
			return "treatment/getTreatmentList";
		} else {
			return "redirect:/";
		}
	}
	
	////////////////////// 게시물 내용 출력 //////////////////////
	@RequestMapping(value="/getTreatmentContent", method=RequestMethod.GET)
	public String getTreatmentContent(Model model
										,HttpSession session
										,TreatmentRequest treatmentRequest
										,@RequestParam(value="currentPage") int currentPage
										,@RequestParam(value="pagePerRow", defaultValue="10" ) int pagePerRow) {
		logger.debug("TreatmentController.getTreatmentContent GET 방식 호출");
		Map map = treatmentService.getTreatmentContent(treatmentRequest);
		if(((TreatmentResponse) map.get("treatmentResponse")).getMemberNo().equals(session.getAttribute("memberSessionNo").toString())) {
			model.addAttribute("treatmentResponse", map.get("treatmentResponse"));
			model.addAttribute("downloadPath", session.getServletContext().getRealPath("/upload")+"/");
			model.addAttribute("currentPage", currentPage);
			model.addAttribute("pagePerRow", pagePerRow);
			if(map.get("upTreatment") != null) {
				model.addAttribute("upTreatmentId", ((TreatmentRequest) map.get("upTreatment")).getTreatmentNo());
			}
			if(map.get("downTreatment") != null) {
				model.addAttribute("downTreatmentId", ((TreatmentRequest) map.get("downTreatment")).getTreatmentNo());
			}
			return "treatment/getTreatmentContent";
		} else {
			return "redirect:/";
		}
	}
	
	////////////////////// 게시물 삭제 //////////////////////
	
	@RequestMapping(value="/removeTreatment", method=RequestMethod.GET)
	public String removeTreatment(TreatmentRequest treatmentRequest
									,@RequestParam(value="currentPage") int currentPage
									,@RequestParam(value="pagePerRow", defaultValue="10" ) int pagePerRow
									,HttpSession session) {
		logger.debug("TreatmentController.removeTreatment GET 방식 호출");
		if(((TreatmentResponse) (treatmentService.getTreatmentContent(treatmentRequest)).get("treatmentResponse")).getMemberNo().equals(session.getAttribute("memberSessionNo").toString())) {
			treatmentService.removeTreatment(treatmentRequest);
			return "redirect:/getTreatmentList?currentPage=" + currentPage + "&pagePerRow=" + pagePerRow;
		} else {
			return "redirect:/";
		}
	}

	////////////////////// 게시물 수정 //////////////////////	
	@RequestMapping(value="/modifyTreatment", method=RequestMethod.GET)
	public String modifyTreatment(Model model
									,TreatmentRequest treatmentRequest
									,@RequestParam(value="currentPage") int currentPage
									,@RequestParam(value="pagePerRow", defaultValue="10" ) int pagePerRow
									,HttpSession session) {
		logger.debug("TreatmentController.modifyTreatment GET 방식 호출");
		if(((TreatmentResponse) (treatmentService.getTreatmentContent(treatmentRequest)).get("treatmentResponse")).getMemberNo().equals(session.getAttribute("memberSessionNo").toString())) {
			model.addAttribute("treatment",treatmentService.getTreatmentContent(treatmentRequest).get("treatment"));
			model.addAttribute("currentPage", currentPage);
			model.addAttribute("pagePerRow", pagePerRow);
			return "treatment/modifyTreatment";
		} else {
			return "redirect:/";
		}
	}
	
	@RequestMapping(value="/modifyTreatment", method=RequestMethod.POST)
	public String modifyTreatment(Model model
									,HttpSession session
									,TreatmentRequest treatmentRequest
									,@RequestParam(value="currentPage") int currentPage
									,@RequestParam(value="pagePerRow", defaultValue="10" ) int pagePerRow) {
		logger.debug("TreatmentController.modifyTreatment POST 방식 호출");
		if(((TreatmentResponse) (treatmentService.getTreatmentContent(treatmentRequest)).get("treatmentResponse")).getMemberNo().equals(session.getAttribute("memberSessionNo").toString())) {
			List<MultipartFile> multipartFileList = treatmentRequest.getMultipartFile();
			if(multipartFileList != null) {
				for(MultipartFile multipartFile : multipartFileList) {
					if(multipartFile.getContentType().equals("application/x-msdownload")) {
						model.addAttribute("treatment", treatmentRequest);
						model.addAttribute("exeFileName", multipartFile.getOriginalFilename());
						return "redirect:/modifyTreatment?treatmentId=" + treatmentRequest.getTreatmentNo() + "&currentPage=" + currentPage + "&pagePerRow=" + pagePerRow;
					}
				}
			}
			treatmentService.modifyTreatment(treatmentRequest, session.getServletContext().getRealPath("/upload")+"/");
			return "redirect:/getTreatmentContent?treatmentId=" + treatmentRequest.getTreatmentNo() + "&currentPage=" + currentPage + "&pagePerRow=" + pagePerRow;
		} else {
			return "redirect:/";
		}
		
	}
}
