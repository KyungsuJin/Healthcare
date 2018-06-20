package com.cafe24.kyungsu93.healthsurvey.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import com.cafe24.kyungsu93.disease.service.Disease;
import com.cafe24.kyungsu93.disease.service.DiseaseDao;
import com.cafe24.kyungsu93.healthscreen.service.HealthScreenRequest;
import com.cafe24.kyungsu93.member.service.Member;
import com.sun.xml.internal.fastinfoset.algorithm.HexadecimalEncodingAlgorithm;



@Service
public class HealthSurveyService {
	private static final Logger logger = LoggerFactory.getLogger(HealthSurveyService.class);

	@Autowired HealthSurveyDao healthSurveyDao;
	@Autowired DiseaseDao diseaseDao; 
	
	public Map<String, Object> getHealthSurveyList (int currentPage, int pagePerRow){
		logger.debug("HealthScreenService.getHealthScreenList 호출");
		int totalRow = healthSurveyDao.healthSurveyTotalCount();
		int firstPage = 1;
		int lastPage = totalRow/pagePerRow;
		if(totalRow%pagePerRow != 0) {
			lastPage++;
		}
		int beforePage = ((currentPage-1)/10)*10;
		int afterPage = ((currentPage-1)/10)*10 +11;
		
		Map pageMap = new HashMap<String, Integer>();
		pageMap.put("beginRow", (currentPage-1)*10);
		pageMap.put("pagePerRow", pagePerRow);
		
		Map map = new HashMap<String, Object>();
		List<HealthSurveyResponse> list = healthSurveyDao.getHealthSurveyList(pageMap);
		map.put("list", list);
		map.put("firstPage", firstPage);
		map.put("lastPage", lastPage);
		map.put("beforePage", beforePage);
		map.put("afterPage", afterPage);
		return map;
	}
	
	public HealthSurveyResponse getHealthSurveyContent(HealthSurveyRequest healthSurveyRequest) {
		return healthSurveyDao.getHealthSurveyContent(healthSurveyRequest);
	}
	
	public void addHealthSurvey(HealthSurveyRequest healthSurveyRequest, HealthSurveyQuestion healthSurveyQuestion, HealthSurveySelection healthSurveySelection) {
		String healthSurveyRegisterNo = "health_survey_register_" + (healthSurveyDao.getHealthSurveyNo()+1);
		healthSurveyRequest.setHealthSurveyRegisterNo(healthSurveyRegisterNo);
		healthSurveyQuestion.setHealthSurveyRegisterNo(healthSurveyRegisterNo);
		healthSurveyDao.addHealthSurvey(healthSurveyRequest);
		int count = -1;
		for(int i = 0 ; i < healthSurveyQuestion.getQuestionNoList().length ; i++) {
			String healthSurveyQuestionNo = "health_survey_question_" + (healthSurveyDao.getHealthSurveyQuestionNo()+1);
			healthSurveyQuestion.setHealthSurveyQuestionNo(healthSurveyQuestionNo);
			healthSurveySelection.setHealthSurveyQuestionNo(healthSurveyQuestionNo);
			healthSurveyQuestion.setQuestionNo(healthSurveyQuestion.getQuestionNoList()[i]);
			healthSurveyQuestion.setHealthSurveyQuestion(healthSurveyQuestion.getHealthSurveyQuestionList()[i]);
			healthSurveyDao.addHealthSurveyQuestion(healthSurveyQuestion);
			int flag = 0;
			for(int j = count+1 ; j < healthSurveySelection.getSelectionNoList().length ; j++) {
				healthSurveySelection.setHealthSurveySelectionNo("health_survey_selection_" + (healthSurveyDao.getHealthSurveySelectionNo()+1));
				System.out.println("마지막오류"+healthSurveySelection.toString());
				healthSurveySelection.setSelectionNo(healthSurveySelection.getSelectionNoList()[j]);
				healthSurveySelection.setHealthSurveySelection(healthSurveySelection.getHealthSurveySelectionList()[j]);
				healthSurveySelection.setHealthSurveySelectionScore(healthSurveySelection.getHealthSurveySelectionScoreList()[j]);
				healthSurveyDao.addHealthSurveySelection(healthSurveySelection);
				count = j;
				if((healthSurveySelection.getSelectionNoList().length == (j+1)) || (healthSurveySelection.getSelectionNoList()[j+1] == 1)) {
					break;
				}
			}
		}
		healthSurveyDao.addHealthSurveyAverageGrade(healthSurveyRegisterNo);
	}
	
	public Map<String, Object> getHealthSurveyQuestion(HealthSurveyRequest healthSurveyRequest){
		Map map = new HashMap<String, Object>();
		
		List<HealthSurveyQuestion> questionList = healthSurveyDao.getHealthSurveyQuestion(healthSurveyRequest);
		map.put("question", questionList);
		map.put("questionSize", questionList.size());
		System.out.println("사이즈 : " + questionList.size());
		for(int i = 0 ; i < questionList.size() ; i++) {
			List<HealthSurveySelection> selectionList = healthSurveyDao.getHealthSurveySelection(questionList.get(i));
			System.out.println("요거"+questionList.get(i));
			questionList.get(i).setHealthSurveySelection(selectionList);
		}
		return map;
	}
	
	public Map<String, Object> getHealthSurveyQuestion(HealthSurveyResultRequest healthSurveyResultRequest){
		Map map = new HashMap<String, Object>();
		List<HealthSurveyQuestion> questionList = healthSurveyDao.getHealthSurveyQuestion(healthSurveyResultRequest);
		map.put("question", questionList);
		map.put("questionSize", questionList.size());
		System.out.println("사이즈 : " + questionList.size());
		for(int i = 0 ; i < questionList.size() ; i++) {
			List<HealthSurveySelection> selectionList = healthSurveyDao.getHealthSurveySelection(questionList.get(i));
			System.out.println("요거"+questionList.get(i));
			questionList.get(i).setHealthSurveySelection(selectionList);
		}
		return map;
	}
	
	public List<HealthSurveySelection> getHealthSurveyResultSelectionList(HealthSurveyResultRequest healthSurveyResultRequest){
		return healthSurveyDao.getHealthSurveyResultSelectionList(healthSurveyResultRequest);
	}
	
	//설문 삭제를 위한 메서드. 총 7개의 테이블에 걸쳐서 삭제를 해야함.
	public void removeHealthSurvey(HealthSurveyRequest healthSurveyRequest) {
		healthSurveyDao.removeHealthSurveyAverageGrade(healthSurveyRequest);
		for(HealthSurveyQuestion healthSurveyQuestion : healthSurveyDao.getHealthSurveyQuestion(healthSurveyRequest)) {
			healthSurveyDao.removeHealthSurveySelection(healthSurveyQuestion);
		}
		healthSurveyDao.removeHealthSurveyQuestion(healthSurveyRequest);
		for(HealthSurveyResultRequest healthSurveyResultRequest : healthSurveyDao.getHealthSurveyResultNoList(healthSurveyRequest)) {
			healthSurveyDao.removeHealthSurveyTotalGrade(healthSurveyResultRequest);
			healthSurveyDao.removeHealthSurveyRecord(healthSurveyResultRequest);
		}
		healthSurveyDao.removeHealthSurveyResult(healthSurveyRequest);
		healthSurveyDao.removeHealthSurvey(healthSurveyRequest);
	}
	
	public String addHealthSurveyResult(String memberNo, List<String> healthSurveySelectionNo, String healthSurveyRegisterNo, int totalGrade) {
		HealthSurveyResultRequest healthSurveyResultRequest = new HealthSurveyResultRequest();
		healthSurveyResultRequest.setHealthSurveyResultNo("health_survey_result_"+(healthSurveyDao.getHealthSurveyResultNo()+1));
		healthSurveyResultRequest.setHealthSurveyRegisterNo(healthSurveyRegisterNo);
		healthSurveyResultRequest.setMemberNo(memberNo);
		healthSurveyDao.addHealthSurveyResult(healthSurveyResultRequest);
		HealthSurveyTotalGrade healthSurveyTotalGrade = new HealthSurveyTotalGrade();
		healthSurveyTotalGrade.setHealthSurveyResultNo(healthSurveyResultRequest.getHealthSurveyResultNo());
		healthSurveyTotalGrade.setHealthSurveyTotalGrade(totalGrade);
		healthSurveyDao.addHealthSurveyTotalGrade(healthSurveyTotalGrade);
		for(String selectionNo : healthSurveySelectionNo ) {
			HealthSurveyRecord healthSurveyRecord = new HealthSurveyRecord();
			healthSurveyRecord.setHealthSurveyResultNo(healthSurveyResultRequest.getHealthSurveyResultNo());
			healthSurveyRecord.setHealthSurveySelectionNo(selectionNo);
			healthSurveyDao.addHealthSurveyRecord(healthSurveyRecord);
		}
		return healthSurveyResultRequest.getHealthSurveyResultNo();
	}
	
	public HealthSurveyResultResponse getHealthSurveyResultOne(HealthSurveyResultRequest healthSurveyResultRequest) {
		return healthSurveyDao.getHealthSurveyResultOne(healthSurveyResultRequest);
	}
	
	public Map<String, Object> getHealthSurveyResultList(int currentPage, int pagePerRow, Member member){
		logger.debug("HealthScreenService.getHealthSurveyResultList 호출");
		int totalRow = healthSurveyDao.healthSurveyResultTotalCount(member);
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
		pageMap.put("memberNo", member.getMemberNo());
		
		Map map = new HashMap<String, Object>();
		List<HealthSurveyResultResponse> list = healthSurveyDao.getHealthSurveyResultList(pageMap);
		map.put("list", list);
		map.put("firstPage", firstPage);
		map.put("lastPage", lastPage);
		map.put("beforePage", beforePage);
		map.put("afterPage", afterPage);
		return map;
	}
	
	public void addHealthSurveyEvaluation(String healthSurveyResultNo,String healthSurveyRegisterNo, int healthSurveyEvaluationAverageGrade) {
		HealthSurveyResultRequest healthSurveyResultRequest = new HealthSurveyResultRequest();
		HealthSurveyAverageGrade healthSurveyAverageGrade = new HealthSurveyAverageGrade();
		healthSurveyResultRequest.setHealthSurveyResultNo(healthSurveyResultNo);
		healthSurveyAverageGrade.setHealthSurveyRegisterNo(healthSurveyRegisterNo);
		healthSurveyAverageGrade.setHealthSurveyEvaluationAverageGrade(healthSurveyEvaluationAverageGrade);
		healthSurveyDao.addHealthSurveyEvaluation(healthSurveyResultRequest);
		healthSurveyDao.updateHealthSurveyAverageGrade(healthSurveyAverageGrade);
	}
	
	public List<Disease> selectListForAdd() {
		logger.debug("DiseaseService_selectListForAdd");
		List<Disease> list = diseaseDao.selectListForAdd();
		return list;
	}
	
}
