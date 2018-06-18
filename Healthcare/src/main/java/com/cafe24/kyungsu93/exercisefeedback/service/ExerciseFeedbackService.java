package com.cafe24.kyungsu93.exercisefeedback.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

@Service
@Transactional
public class ExerciseFeedbackService {

	@Autowired
	private ExerciseFeedbackDao exerciseFeedbackDao;
	private static final Logger logger = LoggerFactory.getLogger(ExerciseFeedbackService.class);
	
	/**
	 * 운동 피드백 요청 거절
	 * @param exerciseFeedbackRequestNo
	 */
	public void feedbackapprovalDenied(String exerciseFeedbackRequestNo) {
		logger.debug("ExerciseFeedbackService - feedbackapprovalDenied실행");	
		exerciseFeedbackDao.feedbackapprovalDenied(exerciseFeedbackRequestNo);
	}
	
	/**
	 * 운동 피드백 요청 수락
	 * @param exerciseFeedbackRequestNo
	 */
	public void feedbackapprovalAccept(String exerciseFeedbackRequestNo) {
		logger.debug("ExerciseFeedbackService - feedbackapprovalAccept실행");	
		
		exerciseFeedbackDao.feedbackapprovalAccept(exerciseFeedbackRequestNo);
	}
	
	/**
	 * 운동 피드백 요청글 상세 보기
	 * @param exerciseFeedbackRequestNo
	 * @return returnMap
	 */
	public Map<String, Object> exerciseFeedbackRequestDetail(String exerciseFeedbackRequestNo) {
		logger.debug("ExerciseFeedbackService - exerciseFeedbackRequestDetail실행");	
		Map<String,Object> returnMap = new HashMap<String,Object>();
		//운동 피드백 요청글 상세 보기
		ExerciseFeedbackRequest exerciseFeedbackDetail = exerciseFeedbackDao.exerciseFeedbackRequestDetail(exerciseFeedbackRequestNo);
		returnMap.put("exerciseFeedbackDetail", exerciseFeedbackDetail);
		//요청 수락 거절 결과값 검색
		int approvalResult = 0;
		approvalResult = exerciseFeedbackDao.exerciseFeedbackApprovalresultTotalCount(exerciseFeedbackRequestNo);
		if(approvalResult >0) {
			ExerciseFeedbackRequest exerciseFeedbackResultDetail = exerciseFeedbackDao.exerciseFeedbackApprovalResult(exerciseFeedbackRequestNo);
			returnMap.put("exerciseFeedbackResultDetail", exerciseFeedbackResultDetail);
			returnMap.put("approvalResult", approvalResult);
		}else {
			returnMap.put("approvalResult", approvalResult);
		}
		//이전글 다음글 
		int countPrev = 0;
		int countNext = 0;
		//이전글 다음글 카운트 
		countPrev = exerciseFeedbackDao.prevExerciseFeedbackDetailCount(exerciseFeedbackRequestNo);
		countNext = exerciseFeedbackDao.nextExerciseFeedbackDetailCount(exerciseFeedbackRequestNo);
		if(countPrev !=0) {
			if(countNext == 0) {
				//다음글이 없을 경우
				logger.debug("다음글이 없습니다.");
				ExerciseFeedbackRequest prevExerciseFeedback = exerciseFeedbackDao.prevExerciseFeedbackDetail(exerciseFeedbackRequestNo);
				returnMap.put("prevExerciseFeedback", prevExerciseFeedback);
				returnMap.put("countNext", countNext);
				returnMap.put("countPrev", countPrev);
			}			
		}if(countNext != 0){
			ExerciseFeedbackRequest nextExerciseFeedback = exerciseFeedbackDao.nextExerciseFeedbackDetail(exerciseFeedbackRequestNo);
			returnMap.put("nextExerciseFeedback", nextExerciseFeedback);
			returnMap.put("countNext", countNext);
			if(countPrev != 0){
				//둘다있을경우
				logger.debug("이전글,다음글이 있습니다.");
				ExerciseFeedbackRequest prevExerciseFeedback = exerciseFeedbackDao.prevExerciseFeedbackDetail(exerciseFeedbackRequestNo);
				returnMap.put("prevExerciseFeedback", prevExerciseFeedback);
				returnMap.put("countPrev", countPrev);
			}else {
				//이전글이 없을경우
				logger.debug("이전글이 없습니다.");
				returnMap.put("countPrev", countPrev);
			}
		}
		return returnMap;
	}
	
	/**
	 * 운동피드백등록
	 * @param exerciseFeedbackRequest
	 */
	public void exerciseFeedbackRequest(ExerciseFeedbackRequest exerciseFeedbackRequest) {
		logger.debug("ExerciseFeedbackService - exerciseFeedbackRequest실행");		
		String exerciseFeedbackRequestNo = exerciseFeedbackRequest.getExerciseFeedbackRequestNo();
		String exerciseFeedbackRequestTitle = exerciseFeedbackRequest.getExerciseFeedbackRequestTitle();
		String exerciseFeedbackRequestContent = exerciseFeedbackRequest.getExerciseFeedbackRequestContent();
		exerciseFeedbackRequest.setExerciseFeedbackRequestTitle(exerciseFeedbackRequestTitle);
		exerciseFeedbackRequest.setExerciseFeedbackRequestContent(exerciseFeedbackRequestContent);
		try {
			if(exerciseFeedbackRequestNo == null) {
				//그룹전체검색
				int count = 0;
				count = exerciseFeedbackDao.exerciseFeedbackRequestTotalCount();
				if(count > 0) {
					int result = 0;
					String exerciseFeedbackNo_temp = "exercise_feedback_request_";
					//그룹 번호 최대값 검색
					result = exerciseFeedbackDao.exerciseFeedbackRequestNo();
					if(result > 0) {
						if(1 <= result) {
							result++;
						}
						exerciseFeedbackRequestNo = exerciseFeedbackNo_temp + result; 
					}
				}else {
					exerciseFeedbackRequestNo = "exercise_feedback_request_1";
				}
			}
			exerciseFeedbackRequest.setExerciseFeedbackRequestNo(exerciseFeedbackRequestNo);
			
		}catch(NullPointerException e) {
			e.printStackTrace();
		}
		exerciseFeedbackDao.exerciseFeedbackRequest(exerciseFeedbackRequest);
	}
	
	/**
	 * 운동피드백리스트
	 * @param currentPage
	 * @param pagePerRow
	 * @return
	 */
	public Map<String, Object> exerciseFeedbackList(int currentPage, int pagePerRow){
		logger.debug("ExerciseFeedbackService - exerciseFeedbackList 실행");
		Map<String,Integer> map = new HashMap<String,Integer>();
		int beginRow = (currentPage-1)*pagePerRow;
		map.put("beginRow", beginRow);
		map.put("pagePerRow", pagePerRow);
		//운동피드백 리스트
		List<ExerciseFeedbackRequest> list = exerciseFeedbackDao.exerciseFeedbackList(map);
		//게시판 전체 게시물 수
		int total = exerciseFeedbackDao.exerciseFeedbackRequestTotalCount();
		int lastPage = total/pagePerRow;
        if(total % pagePerRow != 0) {
            lastPage++;
        }
        logger.debug("list:"+list);
        logger.debug("lastPage:"+lastPage);
        logger.debug("currentPage:"+currentPage);
        logger.debug("beginRow:"+beginRow);
        logger.debug("pagePerRow:"+pagePerRow);
        logger.debug("====================== page block =========================");
       
        int pagePerBlock = 10; //보여줄 블록 수 
        int block = currentPage/pagePerBlock;
        int totalBlock = total/pagePerBlock;//총 블록수
        
        if(currentPage % pagePerBlock != 0) {
        	block ++;
        }
        int firstBlockPage = (block-1)*pagePerBlock+1;
        int lastBlockPage = block*pagePerBlock;
        
		if(lastPage > 0) {			
			if(lastPage % pagePerBlock != 0) {
				totalBlock++;
			}
		}
		if(lastBlockPage >= totalBlock) {
			lastBlockPage = totalBlock;
		}
		logger.debug("firstBlockPage:"+firstBlockPage);
		logger.debug("lastBlockPage:"+lastBlockPage);
		logger.debug("block:"+block);
		logger.debug("totalBlock:"+totalBlock);
		logger.debug("====================== page block =========================");
		Map<String,Object> returnMap = new HashMap<String,Object>();
		returnMap.put("list", list);
		returnMap.put("lastPage", lastPage);
		returnMap.put("firstBlockPage", firstBlockPage);
		returnMap.put("lastBlockPage", lastBlockPage);
		returnMap.put("totalBlock", totalBlock);
		return returnMap;
	}
	
	/**
	 * 운동피드백강사선택
	 * @param memberNo
	 * @return
	 */
	public Map<String,Object> exerciseFeedbackPtSelect(String memberNo) {
		logger.debug("ExerciseFeedbackService - exerciseFeedbackPtSelect 실행");
		ExerciseFeedbackRequest exerciseFeedbackRequest = exerciseFeedbackDao.exerciseFeedbackPtSelect(memberNo);
		exerciseFeedbackRequest.setMemberNo(memberNo);
		String ptMemberName = exerciseFeedbackRequest.getMemberName();
		String ptMemberNo = exerciseFeedbackRequest.getMemberNo();
		logger.debug("ptMemberName:"+ptMemberName);
		logger.debug("ptMemberNo:"+ptMemberNo);
		Map<String,Object> returnMap = new HashMap<String,Object>();
		returnMap.put("ptMemberName", ptMemberName);
		returnMap.put("ptMemberNo", ptMemberNo);
		return returnMap;
	}	
	
	/**
	 * 운동피드백강사리스트
	 * @param currentPage
	 * @param pagePerRow
	 * @return
	 */
	public Map<String, Object> exerciseFeedbackPtList(int currentPage, int pagePerRow){
		logger.debug("ExerciseFeedbackService - exerciseFeedbackPtList 실행");
		Map<String,Integer> map = new HashMap<String,Integer>();
		int beginRow = (currentPage-1)*pagePerRow;
		map.put("beginRow", beginRow);
		map.put("pagePerRow", pagePerRow);
		//강사 리스트
		List<ExerciseFeedbackRequest> exercisePtlist = exerciseFeedbackDao.exerciseFeedbackPtList(map);
		//게시판 전체 게시물 수
		int total = exerciseFeedbackDao.exerciseFeedbackPtTotalCount();
		int lastPage = total/pagePerRow;
        if(total % pagePerRow != 0) {
            lastPage++;
        }
        logger.debug("exercisePtlist:"+exercisePtlist);
        logger.debug("lastPage:"+lastPage);
        logger.debug("currentPage:"+currentPage);
        logger.debug("beginRow:"+beginRow);
        logger.debug("pagePerRow:"+pagePerRow);
        logger.debug("====================== page block =========================");
       
        int pagePerBlock = 10; //보여줄 블록 수 
        int block = currentPage/pagePerBlock;
        int totalBlock = total/pagePerBlock;//총 블록수
        
        if(currentPage % pagePerBlock != 0) {
        	block ++;
        }
        int firstBlockPage = (block-1)*pagePerBlock+1;
        int lastBlockPage = block*pagePerBlock;
        
		if(lastPage > 0) {			
			if(lastPage % pagePerBlock != 0) {
				totalBlock++;
			}
		}
		if(lastBlockPage >= totalBlock) {
			lastBlockPage = totalBlock;
		}
		logger.debug("firstBlockPage:"+firstBlockPage);
		logger.debug("lastBlockPage:"+lastBlockPage);
		logger.debug("block:"+block);
		logger.debug("totalBlock:"+totalBlock);
		logger.debug("====================== page block =========================");
		Map<String,Object> returnMap = new HashMap<String,Object>();
		returnMap.put("exercisePtlist", exercisePtlist);
		returnMap.put("lastPage", lastPage);
		returnMap.put("firstBlockPage", firstBlockPage);
		returnMap.put("lastBlockPage", lastBlockPage);
		returnMap.put("totalBlock", totalBlock);
		return returnMap;
	}
	
	/**
	 * 운동피드백요청리스트
	 * @param currentPage
	 * @param pagePerRow
	 * @return
	 */
	public Map<String, Object> exerciseFeedbackRequestList(int currentPage, int pagePerRow){
		logger.debug("ExerciseFeedbackService - exerciseFeedbackRequestList 실행");
		Map<String,Integer> map = new HashMap<String,Integer>();
		int beginRow = (currentPage-1)*pagePerRow;
		map.put("beginRow", beginRow);
		map.put("pagePerRow", pagePerRow);
		//운동피드백 요청 리스트
		List<ExerciseFeedbackRequest> exercisefeedbacklist = exerciseFeedbackDao.exerciseFeedbackRequestList(map);
		//게시판 전체 게시물 수
		int total = exerciseFeedbackDao.exerciseFeedbackRequestTotalCount();
		int lastPage = total/pagePerRow;
        if(total % pagePerRow != 0) {
            lastPage++;
        }
        logger.debug("exercisefeedbacklist:"+exercisefeedbacklist);
        logger.debug("lastPage:"+lastPage);
        logger.debug("currentPage:"+currentPage);
        logger.debug("beginRow:"+beginRow);
        logger.debug("pagePerRow:"+pagePerRow);
        logger.debug("====================== page block =========================");
       
        int pagePerBlock = 10; //보여줄 블록 수 
        int block = currentPage/pagePerBlock;
        int totalBlock = total/pagePerBlock;//총 블록수
        
        if(currentPage % pagePerBlock != 0) {
        	block ++;
        }
        int firstBlockPage = (block-1)*pagePerBlock+1;
        int lastBlockPage = block*pagePerBlock;
        
		if(lastPage > 0) {			
			if(lastPage % pagePerBlock != 0) {
				totalBlock++;
			}
		}
		if(lastBlockPage >= totalBlock) {
			lastBlockPage = totalBlock;
		}
		logger.debug("firstBlockPage:"+firstBlockPage);
		logger.debug("lastBlockPage:"+lastBlockPage);
		logger.debug("block:"+block);
		logger.debug("totalBlock:"+totalBlock);
		logger.debug("====================== page block =========================");
		Map<String,Object> returnMap = new HashMap<String,Object>();
		returnMap.put("exercisefeedbacklist", exercisefeedbacklist);
		returnMap.put("lastPage", lastPage);
		returnMap.put("firstBlockPage", firstBlockPage);
		returnMap.put("lastBlockPage", lastBlockPage);
		returnMap.put("totalBlock", totalBlock);
		return returnMap;
	}
}
