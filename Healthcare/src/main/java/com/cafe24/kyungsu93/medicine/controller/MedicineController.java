package com.cafe24.kyungsu93.medicine.controller;

import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.cafe24.kyungsu93.medicine.service.MedicineService;
import com.cafe24.kyungsu93.treatment.service.TreatmentRequest;

@Controller
public class MedicineController {
	private final static Logger logger = LoggerFactory.getLogger(MedicineController.class);
	
	@Autowired MedicineService medicineService;
	@RequestMapping(value="/getMedicineList", method=RequestMethod.GET)
	public String getMedicineList(Model model
			,@RequestParam(value="windowPop", defaultValue="0") String windowPop
			,@RequestParam(value="medicineNo", defaultValue="1") String medicineNo
			,@RequestParam(value="medicineName", defaultValue="") String medicineName
			,@RequestParam(value="currentPage", defaultValue="1" ) int currentPage
			,@RequestParam(value="pagePerRow", defaultValue="10" ) int pagePerRow) {
		Map map = medicineService.getMedicineList(currentPage, pagePerRow, medicineName);
		model.addAttribute("medicineName", medicineName);
		model.addAttribute("list", map.get("list"));
		model.addAttribute("firstPage", map.get("firstPage"));
		model.addAttribute("lastPage", map.get("lastPage"));
		model.addAttribute("beforePage", map.get("beforePage"));
		model.addAttribute("afterPage", map.get("afterPage"));
		model.addAttribute("currentPage", currentPage);
		model.addAttribute("pagePerRow", pagePerRow);
		if(windowPop.equals("1")) {
			return "medicine/getPopMedicineList";
		} else {
			return "medicine/getMedicineList";
		}
		
	}
	
	@RequestMapping(value="/getMedicineList", method=RequestMethod.POST)
	public String getMedicineList(Model model
				,@RequestParam(value="windowPop", defaultValue="0") String windowPop
				,@RequestParam(value="medicineName") String medicineName
				,@RequestParam(value="currentPage", defaultValue="1" ) int currentPage
				,@RequestParam(value="pagePerRow", defaultValue="10" ) int pagePerRow) {
		Map map = medicineService.getMedicineList(currentPage, pagePerRow, medicineName);
		model.addAttribute("medicineName", medicineName);
		model.addAttribute("list", map.get("list"));
		model.addAttribute("firstPage", map.get("firstPage"));
		model.addAttribute("lastPage", map.get("lastPage"));
		model.addAttribute("beforePage", map.get("beforePage"));
		model.addAttribute("afterPage", map.get("afterPage"));
		model.addAttribute("currentPage", currentPage);
		model.addAttribute("pagePerRow", pagePerRow);
		if(windowPop.equals("1")) {
			return "medicine/getPopMedicineList";
		} else {
			return "medicine/getMedicineList";
		}
	}
	
	@RequestMapping(value = "/addMedicine", method = RequestMethod.GET)
	public String addMedicine() {
		logger.debug("MedicineController.addMedicine 메서드 실행");
		for(int i = 1 ; i < 11 ; i++) {
			medicineService.addMedicine(i);
		}
		return "addMedicine";
	}
}
