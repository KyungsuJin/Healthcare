package com.cafe24.kyungsu93.medicine.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.cafe24.kyungsu93.medicine.service.MedicineService;

@Controller
public class MedicineController {
	private final static Logger logger = LoggerFactory.getLogger(MedicineController.class);
	
	@Autowired MedicineService medicineService; 
	
	@RequestMapping(value="/searchMedicineForm", method=RequestMethod.GET)
	public String searchMedicineForm() {
		return "medicine/searchMedicineForm";
	}
	
	@RequestMapping(value="/getMedicineList", method=RequestMethod.GET)
	public String getMedicineList() {
		return "medicine/getMedicineList";
	}
	
	@RequestMapping(value="/getMedicineList", method=RequestMethod.POST)
	public String getMedicineList(Model model, @RequestParam(value="medicineName") String medicineName) {
		model.addAttribute("list", medicineService.getMedicineList(medicineName));
		return "medicine/getMedicineList";
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
