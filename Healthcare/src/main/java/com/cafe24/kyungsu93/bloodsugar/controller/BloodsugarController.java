/*package com.cafe24.kyungsu93.bloodsugar.controller;

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


@Controller
public class BloodsugarController {
	
	@Autowired
	private BloodsugarService bloodsugarService;
	
	private static final Logger logger = LoggerFactory.getLogger(BloodsugarController.class);
	
	@RequestMapping(value="/addBloodsugar", method = RequestMethod.GET)
	public String addBloodsugar() {
		System.out.println("addBloodsugar 폼 요청");
		return "/bloodsugar/addBloodsugar";
	}
	
	@RequestMapping(value="/addBloodsugar", method = RequestMethod.POST)
		public String BloodsugarList(HttpSession session,Bloodsugar bloodsugar) {
			System.out.println("BloodsugarList 추가 후 List");
			System.out.println("BloodsugarList 추가 후 bloodsugar "+bloodsugar.toString());
			bloodsugarService.addBloodsugar(bloodsugar);
			return "redirect:/BloodsugarList";
	}

	@RequestMapping(value="/BloodsugarList", method=RequestMethod.GET)
	public String bloodsugarList(Model model
								,@RequestParam(value="currentPage", defaultValue="1") int currentPage
								,@RequestParam(value="pagePerRow", defaultValue="10")int pagePerRow) {
		logger.debug("BloodsugarController 에서 BloodsugarList 실행");
		Map<String,Object> map = bloodsugarService.bloodsugarList(currentPage, pagePerRow);
		logger.debug("1번"+currentPage);
		logger.debug("2번"+pagePerRow);
		model.addAttribute("lastPage", map.get("lastPage"));
		model.addAttribute("currentPage", currentPage);
		model.addAttribute("list", map.get("list"));
		model.addAttribute("lastBlockPage", map.get("lastBlockPage"));
		model.addAttribute("firstBlockPage", map.get("firstBlockPage"));
		model.addAttribute("totalBlock", map.get("totalBlock"));
		return "bloodsugar/BloodsugarList";
	}
	@RequestMapping(value="/modifyBloodsugar", method=RequestMethod.POST)
	public String updateBloodsugar(HttpSession session ,Bloodsugar bloodsugar) {				
		logger.debug("BloodsugarController 에서 updateBloodPressure 리다이렉트 실행");
		logger.debug("---------------------------------1번"+bloodsugar);
		bloodsugarService.updateBloodsugar(bloodsugar);
		return "redirect:/BloodsugarList";
	}
	
	@RequestMapping(value="/modifyBloodsugar", method=RequestMethod.GET)
	public String updateBloodsugarone(Model model
											,@RequestParam(value="bloodsugarno") String bloodsugarno) {
		
		logger.debug("BloodsugarController 에서 updateBloodsugar 포워드 실행 ");
		Bloodsugar bloodsugar = bloodsugarService.selectBloodsugarOne(bloodsugarno);
		model.addAttribute("bloodsugar", bloodsugar);
		logger.debug("bloodsugarController - bloodbloodsugar :"+ bloodsugar);
		logger.debug("+++++++++++++++++988"+bloodsugar);
		return "/bloodsugar/modifyBloodsugar";
	}
	
	@RequestMapping(value="/deleteBloodsugar", method= {RequestMethod.POST,RequestMethod.GET})
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
	}
}

*/

package com.cafe24.kyungsu93.bloodsugar.controller;

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
import com.cafe24.kyungsu93.bloodsugar.service.BloodSugar;
import com.cafe24.kyungsu93.bloodsugar.service.BloodSugarService;


@Controller
public class BloodsugarController {
	
	
	@Autowired
	private BloodSugarService bloodSugarService;
	
	private static final Logger logger = LoggerFactory.getLogger(BloodsugarController.class);
	//addBloodSugar
	//혈당을 입력해주는 기능의 메서드이다. jsp에서 get방식으로 받아서 바로 다시  포워딩 시켜준뒤,
	//addbloodsugar.jsp에서 폼을 가져와 입력받고 다시 post 방식으로 받아서 list로 리다이렉트 한다.
	@RequestMapping(value="/addBloodSugar", method = RequestMethod.GET)
	public String addBloodSugar() {
		logger.debug("addBloodSugar 폼 요청");
		return "bloodsugar/addBloodSugar";
	}
	
	@RequestMapping(value="/addBloodSugar", method = RequestMethod.POST)
		public String addBloodSugar(HttpSession session,BloodSugar bloodSugar) {
			System.out.println("bloodSugarList  추가 후 List");
			System.out.println("bloodSugarList  추가 후 bloodSugar "+bloodSugar.toString());
			logger.debug("5번"+bloodSugar);
			bloodSugarService.addBloodSugar(bloodSugar);
			return "redirect:/bloodSugarList";
	}
	//bloodSugarList
	//자신이 입력한 혈당의 리스트를 보는 곳이다. 페이징 작업을 하기 위해 currentpage와 pageperrow 가 디폴트값이 설정되어 입력되어 있다.
	//Service에서 Map형으로 바꿔서 Mapper에서 맵형리턴값 받고, Controller에서 Map형에 담아줘서 Model에 addAttribute 해서 jsp에 뿌려준다.
	//페이징은 Put 메서드 활용해서 Map 에 리스트와 currentpage와 pageperrow ,PK값 담아줬다.
	@RequestMapping(value="/bloodSugarList", method=RequestMethod.GET)
	public String bloodSugarList(Model model
								,@RequestParam(value="currentPage", defaultValue="1") int currentPage
								,@RequestParam(value="pagePerRow", defaultValue="10")int pagePerRow) {
		logger.debug("bloodSugarController 에서 bloodSugarList 실행");
		Map<String,Object> map = bloodSugarService.bloodSugarList(currentPage, pagePerRow);
		model.addAttribute("lastPage", map.get("lastPage"));
		model.addAttribute("currentPage", currentPage);
		model.addAttribute("list", map.get("list"));
		model.addAttribute("lastBlockPage", map.get("lastBlockPage"));
		model.addAttribute("firstBlockPage", map.get("firstBlockPage"));
		model.addAttribute("totalBlock", map.get("totalBlock"));
		return "bloodsugar/bloodSugarList";
	}
	//modifyBloodsugar 
	//자신이 입력한 혈당의 리스트를 수정하는 곳이다. select문을 이용해서 입력된 값을 불러오고, 다시 update문을 이용해 값을 업데이트 한다.
	//get 방식에서는 앵커태그와 param 사용해서 PK값을 가져와서 model에 담아서 보냈고 post 에서는 커맨드객체 활용해서 리다이렉트 시켰다.
	@RequestMapping(value="/modifyBloodSugar", method=RequestMethod.POST)
	public String updateBloodSugar(HttpSession session ,BloodSugar bloodSugar) {				
		logger.debug("BloodSugarController 에서 updateBloodPressure 리다이렉트 실행");
		logger.debug("---------------------------------11번"+bloodSugar);
		bloodSugarService.updateBloodSugar(bloodSugar);
		return "redirect:/bloodSugarList";
	}
	
	@RequestMapping(value="/modifyBloodSugar", method=RequestMethod.GET)
	public String updateBloodSugarone(Model model
											,@RequestParam(value="bloodSugarNo") String bloodSugarNo) {
		
		logger.debug("BloodSugarController 에서 updateBloodSugar 실행 ");
		logger.debug("9번"+bloodSugarNo);
		BloodSugar bloodSugar = bloodSugarService.selectBloodSugarOne(bloodSugarNo);
		model.addAttribute("bloodSugar", bloodSugar);
		logger.debug("bloodSugarController - bloodbloodSugar :"+ bloodSugar);
		logger.debug("+++++++++++++++++988"+bloodSugar);
		return "bloodsugar/modifyBloodSugar";
	}
	//deleteBloodSugar
	//자신이 입력한 혈당의 리스트 삭제하는 곳이다. slect문과 delete문을 이용하여 pk 값으로 레이블 찾아서 삭제했다.
	//따로 jsp는 필요하지 않기에 만들지 않았다.  
	@RequestMapping(value="/deleteBloodSugar", method= RequestMethod.GET)
	public String deleteBloodSugar(@RequestParam(value="bloodSugarNo") String bloodSugarNo) {
		logger.debug("BloodSugarController 에서 deleteBloodSugar  리다이렉트 실행");
		bloodSugarService.deleteBloodSugar(bloodSugarNo);
		logger.debug("ddddddddddddddddddddddd"+bloodSugarNo);
		return "redirect:/bloodSugarList";
	}
}



