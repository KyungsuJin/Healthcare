package com.cafe24.kyungsu93.medication.service;

import java.io.File;
import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import com.cafe24.kyungsu93.medication.service.MedicationRequest;
import com.cafe24.kyungsu93.medication.service.MedicationResponse;
import com.cafe24.kyungsu93.medication.service.MedicationRequest;

@Service
public class MedicationService {
	private static final Logger logger = LoggerFactory.getLogger(MedicationService.class);
	@Autowired MedicationDao medicationDao;
	
	public Map<String, Object> getMedicationList(int currentPage, int pagePerRow, MedicationRequest medicationRequest){
		logger.debug("MedicationService.getMedicationList 호출");
		int totalRow = medicationDao.medicationTotalCount();
		int firstPage = 1;
		int lastPage = totalRow/pagePerRow;
		if(totalRow%pagePerRow != 0) {
			lastPage++;
		}
		int beforePage = ((currentPage-1)/10)*10;
		int afterPage = ((currentPage-1)/10)*10 +11;
		
		Map pageMap = new HashMap<String, Object>();
		pageMap.put("beginRow", (currentPage-1)*10);
		pageMap.put("pagePerRow", pagePerRow);
		pageMap.put("memberNo", medicationRequest.getMemberNo());
		Map map = new HashMap<String, Object>();
		List<MedicationResponse> list = medicationDao.getMedicationList(pageMap);
		map.put("list", list);
		map.put("firstPage", firstPage);
		map.put("lastPage", lastPage);
		map.put("beforePage", beforePage);
		map.put("afterPage", afterPage);
		logger.debug("MedicationService.getMedicationList.list : " + list);
		logger.debug("MedicationService.getMedicationList.firstPage : " + firstPage);
		logger.debug("MedicationService.getMedicationList.lastPage : " + lastPage);
		logger.debug("MedicationService.getMedicationList.beforePage : " + beforePage);
		logger.debug("MedicationService.getMedicationList.afterPage : " + afterPage);
		return map;
	}
	
	public void addMedication(MedicationRequest medicationRequest) {
		logger.debug("MedicationService.addMedication 메서드 호출");
		logger.debug("MedicationService.addMedication.medicationRequest : " + medicationRequest.toString());
		String medicationNo = "medication_" + (medicationDao.getMedicationNo()+1);
		medicationRequest.setMedicationNo(medicationNo);
		System.out.println("service : " + medicationRequest.getMedicationNo());
		medicationDao.addMedication(medicationRequest);
	}
	
	public MedicationResponse getMedicationContent(MedicationRequest medicationRequest) {
		MedicationResponse medicationResponse = medicationDao.getMedicationContent(medicationRequest);
		medicationResponse.setMedicationStartDate(medicationResponse.getMedicationStartDate().split(" ")[0]);
		medicationResponse.setMedicationEndDate(medicationResponse.getMedicationEndDate().split(" ")[0]);
		return medicationResponse;
	}
	
	public void removeMedication(MedicationRequest medicationRequest) {
		medicationDao.removeMedicationRecord(medicationRequest);
		medicationDao.removeMedication(medicationRequest);
	}
	
	public void modifyMedication(MedicationRequest medicationRequest) {
		medicationDao.modifyMedication(medicationRequest);
	}
}
