/*package com.cafe24.kyungsu93.noticeRest.controller;
import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletResponse;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;

import com.cafe24.kyungsu93.bloodpressure.service.BloodPressure;
import com.cafe24.kyungsu93.bloodpressure.service.BloodPressureService;
import com.cafe24.kyungsu93.notice.service.NoticeService;
import com.google.gson.Gson;


@RestController
public class NoticeRestController {

	@Autowired
	private NoticeService noticeService;
	private static final Logger logger = LoggerFactory.getLogger(NoticeRestController.class);
	
	@RequestMapping(value="/noticeSearch", method=RequestMethod.POST)
	@ResponseBody
	public String searchList(Model model,@RequestParam(value="startDate") String startDate
				                           ,@RequestParam(value="endDate")String endDate) {
		logger.debug("20번"+startDate);
		logger.debug("21번"+endDate);
		
		logger.debug("NoticeRestController 에서 searchList noticeSearch ajax 실행");
	      Map<String, Object> map = noticeService.noticeSearchDate(startDate, endDate);
	      logger.debug("30번"+map);
	      map.get("list");
	      map.put("startDate", startDate);
	      map.put("endDate", endDate);
	      model.addAttribute("list", map.get("list"));

	      return "notice/NoticeList"; 
	   }
	
	 @RequestMapping(value="/bloodPressureChart", method=RequestMethod.POST)
	 @ResponseBody
	 public void chartData(HttpServletResponse response,@RequestParam(value="memberNo")String memberNo){
		 logger.debug("BloodPressureRestController - bloodPressureChart chartData ajax 실행");
		 List<BloodPressure> list = bloodPressureService.selectBloodPressureChart(memberNo);
		logger.debug("memberNo : " + memberNo);
		//배열값 확인
		logger.debug("list : " + list);
		//javaScript 타입을 gson을 이용해 ajax에서 사용가능하게 데이터 타입을 변환.
		Gson gson = new Gson();
		String json = "";
		json = gson.toJson(list);
		response.setContentType("application/json");
		response.setCharacterEncoding("utf-8");
		try {
			response.getWriter().print(json);
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
}
*/