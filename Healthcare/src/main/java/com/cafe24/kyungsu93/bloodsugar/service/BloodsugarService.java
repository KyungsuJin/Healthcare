package com.cafe24.kyungsu93.bloodsugar.service;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.cafe24.kyungsu93.bloodsugar.controller.BloodsugarController;

@Service
public class BloodsugarService {
	private static final Logger logger = LoggerFactory.getLogger(BloodsugarController.class);
	
	@Autowired
	private BloodsugarDao bloodsugarDao;
	
	public void addBloodsugar (Bloodsugar bloodsugar) {
		bloodsugarDao.addBloodsugar(bloodsugar);
	}
}
