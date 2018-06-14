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
	 * 운동피드백등록
	 * @param exerciseFeedbackRequest
	 */
	public void exerciseFeedbackRequest(ExerciseFeedbackRequest exerciseFeedbackRequest) {
		logger.debug("ExerciseFeedbackService - exerciseFeedbackRequest실행");		
		String exerciseFeedbackRequestNo = exerciseFeedbackRequest.getExerciseFeedbackRequestNo();
		try {
			if(exerciseFeedbackRequestNo == null) {
				//그룹전체검색
				int count = 0;
				count = exerciseFeedbackDao.exerciseFeedbackRequestTotalCount();
				if(count > 0) {
					int result = 0;
					String exerciseFeedbackNo_temp = "exercise_feedback_";
					//그룹 번호 최대값 검색
					result = exerciseFeedbackDao.exerciseFeedbackRequestNo();
					if(result > 0) {
						if(1 <= result) {
							result++;
						}
						exerciseFeedbackRequestNo = exerciseFeedbackNo_temp + result; 
					}
				}else {
					exerciseFeedbackRequestNo = "exercise_feedback_1";
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
	public ExerciseFeedbackRequest exerciseFeedbackPtSelect(String memberNo) {
		logger.debug("ExerciseFeedbackService - exerciseFeedbackPtSelect 실행");
		ExerciseFeedbackRequest exerciseFeedbackRequest = exerciseFeedbackDao.exerciseFeedbackPtSelect(memberNo);	
		return exerciseFeedbackRequest;
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
		List<ExerciseFeedbackRequest> list = exerciseFeedbackDao.exerciseFeedbackPtList(map);
		//게시판 전체 게시물 수
		int total = exerciseFeedbackDao.exerciseFeedbackPtTotalCount();
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
