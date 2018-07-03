package com.cafe24.kyungsu93.notice.controller;

import java.text.DateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Locale;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import com.cafe24.kyungsu93.notice.service.Notice;
import com.cafe24.kyungsu93.notice.service.NoticeService;


@Controller
public class NoticeController {
	
	@Autowired
	private NoticeService noticeService;
	
	private static final Logger logger = LoggerFactory.getLogger(NoticeController.class);
	
	//addNotice
	//공지를 등록하는 메서드 이다. addnotice 폼을 요청하여, post형식으로 값을 보내서 입력받는다.
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
	//noticeList 공지의 제목만 보이는 리스트를 처리하는 곳이다.
	//notice_no가 있어야 noticeDetail에 접근해서 내용을 볼 수 있다.
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
	//noticeCountUp 공지의 조회수를 올리고 다시 noticeListDetail로 redirect 해주는 메서드이다.
	@RequestMapping(value ="/noticeCountUp")
	public String noticeCountUp (Model model
									,@RequestParam(value="noticeCount", defaultValue="1") int noticeCount
									 ,@RequestParam(value="noticeNo") String noticeNo) {
		logger.debug("NoticeController 에서 noticeCount실행");
		Map<String,Object> map = noticeService.noticeCountUp(noticeCount,noticeNo);
		logger.debug("21번"+map);
		model.addAttribute("noticeCount",noticeCount);
		model.addAttribute("noticeNo",noticeNo);
		model.addAttribute("map",map);
		logger.debug("22번"+map);
		return "redirect:/noticeListDetail";
	}
	//modifyNotice 커맨드객체를 사용하여 값을 받아 왔다. 이미 입력한 값을 불러와서 수정 할 수 있도록 했다.
	@RequestMapping(value="/modifyNotice", method=RequestMethod.POST)
	public String updateNotice(Model model,HttpSession session ,Notice notice) {				
		logger.debug("NoticeController 에서 updateNotice 리다이렉트 실행");
		logger.debug("---------------------------------10번"+notice);
		noticeService.updatenotice(notice);
		String noticeNo = notice.getNoticeNo();
		System.out.println("80번"+notice.toString());
		model.addAttribute("noticeNo",noticeNo);
		logger.debug("==================13번"+notice);
		return "redirect:/noticeListDetail";
	}
	@RequestMapping(value="/modifyNotice", method=RequestMethod.GET)	 
	public String updateNoticeone(Model model
											,@RequestParam(value="noticeNo") String noticeNo) {
		logger.debug("-------------14번"+noticeNo);
		logger.debug("NoticeController 에서 updateNotice 포워드 실행 ");
		Notice notice = noticeService.selectNoticeOne(noticeNo);
		logger.debug("===============7번"+notice);
		model.addAttribute("notice", notice);
		logger.debug("noticeController - notice :");
		logger.debug("+++++++++++++++++988"+notice);
		return "notice/modifyNotice";
	}
	//deleteNotice @RequestParam 사용하여 앵커태그로 보낸 noticeNo를 받아와 사용한다.
	//noticeNo를 가지고 레이블을 불러와서 삭제하고 noticeList로 redirect한다.
	@RequestMapping(value="/deleteNotice", method= RequestMethod.GET)
	public String deleteNotice(Model model,@RequestParam(value="noticeNo") String noticeNo) {
		logger.debug("NoticeController 에서 deleteBloodsugar 리다이렉트 실행.");
		logger.debug("999번"+noticeNo);
		noticeService.deleteNotice(noticeNo);
		model.addAttribute("noticeNo", noticeNo);
		logger.debug("ddddddddddddddddddddddd"+model);
		return "redirect:/noticeList";
	}
	//noticeListDetail @RequestParam 사용해 noticeNo를 받아오고, currentPage, pagePerRow 페이징을 위해 설정해준다.
	//Service에서 Map형에 담아주고, list형 데이터를 map에서 get 해와서 Model을 사용해 addAttribute 해준다.
	//jsp에서 그 값을 다시 뿌려준다.
	@RequestMapping(value="/noticeListDetail", method=RequestMethod.GET)
	public String noticeListDetailList(Model model
								,@RequestParam(value="currentPage", defaultValue="1") int currentPage
								,@RequestParam(value="pagePerRow", defaultValue="10")int pagePerRow
								,@RequestParam(value="noticeNo") String noticeNo) {
		logger.debug("NoticeController 에서 noticeListDetail 실행");
	
		Map<String,Object> map = noticeService.noticeListDetail(currentPage, pagePerRow,noticeNo);
		/*List<Notice>noticeService.noticeDetail(noticeNo);*/
		logger.debug("9번"+map);
		model.addAttribute("lastPage", map.get("lastPage"));
		model.addAttribute("currentPage", currentPage);
		model.addAttribute("list", map.get("list"));
		model.addAttribute("lastBlockPage", map.get("lastBlockPage"));
		model.addAttribute("firstBlockPage", map.get("firstBlockPage"));
		model.addAttribute("totalBlock", map.get("totalBlock"));
		model.addAttribute("noticeNo",map.get(noticeNo));
		logger.debug("5번"+model);
		return "notice/noticeListDetail";
	}
}

























/*@RequestMapping(value="/noticeCountView", method= {RequestMethod.POST,RequestMethod.GET})
public String noticeCountView(@RequestParam(value="noticeNo") int noticeNo) {
	logger.debug("NoticeController 에서 updateNotice 포워딩 실행.");
	noticeService.noticeCountView(noticeNo);
	logger.debug("ddddddddddddddddddddddd"+noticeNo);
	return "notice/NoticeList";
}*/