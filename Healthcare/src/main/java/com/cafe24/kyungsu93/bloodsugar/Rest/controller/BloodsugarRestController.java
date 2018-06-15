/*package com.cafe24.kyungsu93.bloodsugar.Rest.controller;

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

import com.cafe24.kyungsu93.bloodpressure.service.BloodPressure;
import com.cafe24.kyungsu93.bloodpressure.service.BloodPressureService;
import com.cafe24.kyungsu93.bloodsugar.service.Bloodsugar;
import com.google.gson.Gson;


@RestController
public class BloodsugarRestController {

	@Autowired
	private BloodPressureService bloodsugarService;
	private static final Logger logger = LoggerFactory.getLogger(BloodsugarRestController.class);
	
	 @RequestMapping(value="/bloodsugarChart", method=RequestMethod.POST)
	 @ResponseBody
	 public void chartData(HttpServletResponse response,@RequestParam(value="memberno")String memberno){
		 logger.debug("BloodsugarRestController 에서 bloodsugarChart chartData ajax 실행");
		 List<Bloodsugar> list = bloodsugarService.selectBloodsugarChart(memberno);
		logger.debug("memberno : " + memberno);
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