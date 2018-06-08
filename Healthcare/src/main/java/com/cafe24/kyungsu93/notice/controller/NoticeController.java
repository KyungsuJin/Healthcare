package com.cafe24.kyungsu93.notice.controller;

import java.text.DateFormat;
import java.util.Date;
import java.util.Locale;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.cafe24.kyungsu93.bloodpressure.service.BloodPressure;
import com.cafe24.kyungsu93.bloodsugar.service.Bloodsugar;
import com.cafe24.kyungsu93.bloodsugar.service.BloodsugarService;
import com.cafe24.kyungsu93.notice.service.Notice;
import com.cafe24.kyungsu93.notice.service.NoticeService;


@Controller
public class NoticeController {
	
	@Autowired
	private NoticeService noticeService;
	
	private static final Logger logger = LoggerFactory.getLogger(NoticeController.class);
	
	@RequestMapping(value="/addNotice", method = RequestMethod.GET)
	public String addNotice() {
		System.out.println("addNotice 폼 요청");
		return "/notice/addNotice";
	}
	
	@RequestMapping(value="/addNotice", method = RequestMethod.POST)
		public String NoticeList(HttpSession session,Notice notice) {
			System.out.println("NoticeList 추가 후 List");
			System.out.println("NoticeList 추가 후 Notice "+ notice.toString());
			System.out.println("--------------1번"+notice);
			noticeService.addNotice(notice);
			System.out.println("===========6번"+notice);
			return "redirect:/NoticeList";
	}

	@RequestMapping(value="/NoticeList", method=RequestMethod.GET)
	public String bloodsugarList(Model model
								,@RequestParam(value="currentPage", defaultValue="1") int currentPage
								,@RequestParam(value="pagePerRow", defaultValue="10")int pagePerRow) {
		logger.debug("NoticeController 에서 NoticeList 실행");
		Map<String,Object> map = noticeService.noticeList(currentPage, pagePerRow);
		model.addAttribute("lastPage", map.get("lastPage"));
		model.addAttribute("currentPage", currentPage);
		model.addAttribute("list", map.get("list"));
		model.addAttribute("lastBlockPage", map.get("lastBlockPage"));
		model.addAttribute("firstBlockPage", map.get("firstBlockPage"));
		model.addAttribute("totalBlock", map.get("totalBlock"));
		return "notice/NoticeList";
	}
	/*@RequestMapping(value="/modifyNotice", method=RequestMethod.POST)
	public String updateNotice(HttpSession session ,Notice notice) {				
		logger.debug("NoticeController 에서 updateNotice 리다이렉트 실행");
		logger.debug("---------------------------------10번"+notice);
		noticeService.updatenotice(notice);
		logger.debug("==================13번"+notice);
		return "redirect:/modifyNotice";
	}*/
	
	/*@RequestMapping(value="/modifyNotice", method=RequestMethod.GET)
	public String updateNoticeone(Model model
											,@RequestParam(value="noticeno") String noticeno) {
		logger.debug("-------------14번"+noticeno);
		logger.debug("NoticeController 에서 updateNotice 포워드 실행 ");
		Notice notice = noticeService.selectNoticeOne(noticeno);
		logger.debug("===============7번"+noticeno);
		model.addAttribute("notice", notice);
		logger.debug("noticeController - notice :"+ notice);
		logger.debug("+++++++++++++++++988"+notice);
		return "/notice/NoticeList";
	}*/
	
	/*@RequestMapping(value="/deleteBloodsugar", method= {RequestMethod.POST,RequestMethod.GET})
	public String deleteBloodsugar(@RequestParam(value="bloodsugarno") String bloodsugarno) {
		logger.debug("BloodsugarController 에서 deleteBloodsugar 리다이렉트 실행.");
		bloodsugarService.deleteBloodsugar(bloodsugarno);
		logger.debug("ddddddddddddddddddddddd"+bloodsugarno);
		return "redirect:/BloodsugarList";
	}
	
	
    public String search(HttpServletRequest request
    						, Model model
				    		,@RequestParam(value="searchCode") String searchType
				    		,@RequestParam(value="searchValue") String searchValue) {
	logger.debug("BloodsugarSearch controller부분실행");
	Map<String,Object> map = bloodsugarService.getSearch(request, model, searchCode, searchValue);
	model.addAttribute("list", map.get("list"));
		return "/bloodsugar/bloodsugarList";
	}*/
}
