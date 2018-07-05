package com.cafe24.kyungsu93.bloodsugar.controller.rest;

import java.io.IOException;
import java.util.List;

import javax.servlet.http.HttpServletResponse;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;

import com.cafe24.kyungsu93.bloodsugar.controller.rest.BloodsugarRestController;
import com.cafe24.kyungsu93.bloodsugar.service.BloodSugar;
import com.cafe24.kyungsu93.bloodsugar.service.BloodSugarService;
import com.google.gson.Gson;

@RestController
public class BloodSugarRestFController {

	@Autowired
	private BloodSugarService bloodSugarService;
	private static final Logger logger = LoggerFactory.getLogger(BloodsugarRestController.class);
	
	
	@RequestMapping(value="/bloodSugarChartF", method=RequestMethod.POST)
	@ResponseBody
	public void chartDataF(HttpServletResponse response,@RequestParam(value="memberNo")String memberNo){
	   logger.debug("BloodSugarRestController - bloodSugarChart chartData ajax 실행");
	   List<BloodSugar>  list = bloodSugarService.selectBloodSugarChartF(memberNo);
	  logger.debug("memberNo : " + memberNo);
	  //배열값 확인
	  logger.debug("list : " +list);
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