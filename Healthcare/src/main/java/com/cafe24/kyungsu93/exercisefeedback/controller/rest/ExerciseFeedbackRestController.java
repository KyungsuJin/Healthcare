package com.cafe24.kyungsu93.exercisefeedback.controller.rest;

import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;

import com.cafe24.kyungsu93.exercisefeedback.service.ExerciseFeedbackResponseService;
import com.cafe24.kyungsu93.exercisefeedback.service.ExerciseFeedbackResult;
import com.cafe24.kyungsu93.exercisefeedback.service.ExerciseFeedbackService;

@RestController
public class ExerciseFeedbackRestController {
	@Autowired
	private ExerciseFeedbackService exerciseFeedbackService;
	@Autowired
	private ExerciseFeedbackResponseService exerciseFeedbackResponseService;
	private static final Logger logger = LoggerFactory.getLogger(ExerciseFeedbackRestController.class);
	
/*	@RequestMapping(value="/feedbackFoodSearch", method=RequestMethod.GET)
	@ResponseBody
    public Map<String, Object> feedbackFoodSearch(ExerciseFeedbackResult exerciseFeedbackResult) {
		logger.debug("GroupController - checkGroupName ajax 실행");
		Map<String,Object> map = exerciseFeedbackResponseService.feedbackFoodSearch(exerciseFeedbackResult);
		logger.debug("result:"+map.get("result"));
		return map;
    }*/
}
