package com.cafe24.kyungsu93.medication.controller.rest;



import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

import com.cafe24.kyungsu93.medication.service.MedicationRecord;
import com.cafe24.kyungsu93.medication.service.MedicationRequest;
import com.cafe24.kyungsu93.medication.service.MedicationService;

@RestController
public class MedicationRestController {
	@Autowired MedicationService medicationService;
	
	@RequestMapping(value="/getMedicationRecordList", method=RequestMethod.POST)
	public Map<String, Object> getMedicationRecordList(MedicationRequest medicationRequest) {
		System.out.println("rest 들어옴 : " + medicationRequest.toString());
		Map<String, Object> map = medicationService.getMedicationRecordList(medicationRequest);
		System.out.println(map);
		return map;
	}
	
	@RequestMapping(value="/addMedicationRecord", method=RequestMethod.POST)
	public void addMedicationRecord(MedicationRecord medicationRecord) {
		medicationService.addMedicationRecord(medicationRecord);
	}
	
	@RequestMapping(value="/removeMedicationRecordDate", method=RequestMethod.POST)
	public void removeMedicationRecordDate(MedicationRecord medicationRecord) {
		medicationService.removeMedicationRecordDate(medicationRecord);
	}
}
