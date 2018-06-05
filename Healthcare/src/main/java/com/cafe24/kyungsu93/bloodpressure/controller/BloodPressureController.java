package com.cafe24.kyungsu93.bloodpressure.controller;

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
import com.cafe24.kyungsu93.bloodpressure.service.BloodPressureService;

@Controller
public class BloodPressureController {
	
	@Autowired
	private BloodPressureService bloodPressureService;
	private static final Logger logger = LoggerFactory.getLogger(BloodPressureController.class);
	
/*	@RequestMapping(value="/chartData", method=RequestMethod.POST)
	@ResponseBody
    public List<BloodPressure> chartData(@RequestParam(value="memberId") String memberId) {
        bloodPressureService.selectBloodPressureOne(memberId);
        String[] item = {"test1", "test2", "test3", "test4", "test5", "test6"};
        Random ran = new Random();
        for (int i = 0; i < 6; i++) {
            lists.add(new GoogleChartDto(itme[i], ran.nextInt(50)));
        }
        return item;
    }*/
	
	@RequestMapping(value="/BloodPressureSearch", method=RequestMethod.POST)
    public String search(HttpServletRequest request
    						, Model model
				    		,@RequestParam(value="searchType") String searchType
				    		,@RequestParam(value="searchValue") String searchValue) {
	logger.debug("BloodpressureController - search 리다이렉트 실행");
	Map<String,Object> map = bloodPressureService.getSearch(request, model, searchType, searchValue);
	model.addAttribute("list", map.get("list"));
		return "bloodPressure";
	}
	
	@RequestMapping(value="/modifyBloodPressure", method=RequestMethod.POST)
	public String updateBloodPressure(@RequestParam(value="bloodPressureNo", required=true) String bloodPressureNo) {
		logger.debug("BloodpressureController - updateBloodPressure 리다이렉트 실행");
		bloodPressureService.updateBloodPressure(bloodPressureNo);
		return "redirect:/bloodPressure";
	}
	
	@RequestMapping(value="/modifyBloodPressure", method=RequestMethod.GET)
	public String updateBloodPressureone(Model model
											,@RequestParam(value="bloodPressureNo") String bloodPressureNo) {
		logger.debug("BloodPressureController - updateBloodPressure 포워드 실행");
		BloodPressure bloodPressure = bloodPressureService.selectBloodPressureOne(bloodPressureNo);
		model.addAttribute("bloodPressre", bloodPressure);
		logger.debug("BloodPressureController - bloodPressure :"+ bloodPressure);
		return "modifyBloodPressure";
	}
	
	@RequestMapping(value="/deleteBloodPressure", method= {RequestMethod.POST,RequestMethod.GET})
	public String deleteBloodPressure(@RequestParam(value="bloodPressureNo") String bloodPressureNo) {
		logger.debug("BloodPressureController - deleteBloodPressure 리다이렉트 실행.");
		bloodPressureService.deleteBloodPressure(bloodPressureNo);
		return "redirect:/bloodpressure/bloodPressure";
	}
	
	@RequestMapping(value="/bloodpressure/bloodPressure", method=RequestMethod.GET)
	public String bloodPressureList(Model model
								,@RequestParam(value="currentPage", defaultValue="1") int currentPage
								,@RequestParam(value="pagePerRow", defaultValue="10")int pagePerRow) {
		logger.debug("BloodPressureController - bloodPressureList 포워드 실행");
		Map<String,Object> map = bloodPressureService.bloodPressureList(currentPage, pagePerRow);
		model.addAttribute("lastPage", map.get("lastPage"));
		model.addAttribute("currentPage", currentPage);
		model.addAttribute("list", map.get("list"));
		model.addAttribute("lastBlockPage", map.get("lastBlockPage"));
		model.addAttribute("firstBlockPage", map.get("firstBlockPage"));
		model.addAttribute("totalBlock", map.get("totalBlock"));
		return "bloodpressure/bloodPressure";
	}
		
	@RequestMapping(value="/addBloodPressure", method=RequestMethod.POST)
	public String addBloodPressure(HttpSession session,BloodPressure bloodPressure) {
		logger.debug("BloodpressureController - addBloodPressure 리다이렉트 실행");
		bloodPressureService.addBloodPressure(bloodPressure);
		return "redirect:/bloodpressure/bloodPressure";
	}
	
	@RequestMapping(value="/addBloodPressure", method=RequestMethod.GET)
	public String addBloodPressure() {
		logger.debug("BloodpressureController - addBloodPressure 포워드 실행");
		return "bloodpressure/addBloodPressure";
	}
	
}
