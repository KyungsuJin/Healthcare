package com.cafe24.kyungsu93.diet.service;

import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.cafe24.kyungsu93.Food;

@Service
@Transactional
public class DietService {
	@Autowired
	DietDao dietDao;
	private static final Logger logger = LoggerFactory.getLogger(DietService.class);
	public List<Food> selectForAddIngetCalorie() {
		logger.debug("DietService_selectForAddIngetCalorie");
		return dietDao.selectForAddIngetCalorie();
	}
}
