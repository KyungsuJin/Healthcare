/*package com.cafe24.kyungsu93.notice.controller;

import java.text.DateFormat;
import java.util.ArrayList;
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
import com.cafe24.kyungsu93.bloodsugar.service.BloodSugar;
import com.cafe24.kyungsu93.bloodsugar.service.BloodSugarService;
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
		return "notice/addNotice";
	}
	
	@RequestMapping(value="/addNotice", method = RequestMethod.POST)
		public String NoticeList(HttpSession session,Notice notice) {
			System.out.println("NoticeList 추가 후 List");
			System.out.println("NoticeList 추가 후 Notice "+ notice.toString());
			System.out.println("--------------1번"+notice);
			noticeService.addNotice(notice);
			System.out.println("===========6번"+notice);
			return "redirect:/noticeList";
	}

	@RequestMapping(value="/noticeList", method=RequestMethod.GET)
	public String noticeList(Model model
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
		return "notice/noticeList";
	}
	@RequestMapping(value="/modifyNotice", method=RequestMethod.POST)
	public String updateNotice(HttpSession session ,Notice notice) {				
		logger.debug("NoticeController 에서 updateNotice 리다이렉트 실행");
		logger.debug("---------------------------------10번"+notice);
		noticeService.updatenotice(notice);
		logger.debug("==================13번"+notice);
		return "redirect:/noticeList";
	}
	
	@RequestMapping(value="/modifyNotice", method=RequestMethod.GET)
	public String updateNoticeone(Model model
											,@RequestParam(value="noticeNo") String noticeNo) {
		logger.debug("-------------14번"+noticeNo);
		logger.debug("NoticeController 에서 updateNotice 포워드 실행 ");
		Notice notice = noticeService.selectNoticeOne(noticeNo);
		logger.debug("===============7번"+noticeNo);
		model.addAttribute("notice", notice);
		logger.debug("noticeController - notice :"+ notice);
		logger.debug("+++++++++++++++++988"+notice);
		return "notice/modifyNotice";
	}
	
	@RequestMapping(value="/deleteNotice", method= {RequestMethod.POST,RequestMethod.GET})
	public String deleteNotice(@RequestParam(value="noticeno") String noticeNo) {
		logger.debug("NoticeController 에서 deleteBloodsugar 리다이렉트 실행.");
		noticeService.deleteNotice(noticeNo);
		logger.debug("ddddddddddddddddddddddd"+noticeNo);
		return "redirect:/NoticeList";
	}
	@RequestMapping(value="/noticeCountView", method= {RequestMethod.POST,RequestMethod.GET})
	public String noticeCountView(@RequestParam(value="noticeNo") int noticeNo) {
		logger.debug("NoticeController 에서 updateNotice 포워딩 실행.");
		noticeService.noticeCountView(noticeNo);
		logger.debug("ddddddddddddddddddddddd"+noticeNo);
		return "notice/NoticeList";
	}
	
	@RequestMapping(value="/noticeListDetail", method=RequestMethod.GET)
	public String noticeListDetailList(Model model
								,@RequestParam(value="currentPage", defaultValue="1") int currentPage
								,@RequestParam(value="pagePerRow", defaultValue="10")int pagePerRow) {
		logger.debug("NoticeController 에서 noticeListDetail 실행");
		Map<String,Object> map = noticeService.noticeListDetail(currentPage, pagePerRow);
		model.addAttribute("lastPage", map.get("lastPage"));
		model.addAttribute("currentPage", currentPage);
		model.addAttribute("list", map.get("list"));
		model.addAttribute("lastBlockPage", map.get("lastBlockPage"));
		model.addAttribute("firstBlockPage", map.get("firstBlockPage"));
		model.addAttribute("totalBlock", map.get("totalBlock"));
		return "notice/noticeListDetail";
	}
}



*/