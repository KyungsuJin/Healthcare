package com.cafe24.kyungsu93.notice.service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import com.cafe24.kyungsu93.bloodsugar.service.BloodSugar;

@Service
public class NoticeService {
	private static final Logger logger = LoggerFactory.getLogger(NoticeService.class);
	
	@Autowired
	private NoticeDao noticeDao;
		
	public  Map<String, Object> noticeList(int currentPage, int pagePerRow) {
		logger.debug("Noticeservice NoticeList 실행 부분");
		Map<String,Integer> map = new HashMap<String,Integer>();
		int beginRow = (currentPage-1)*pagePerRow;
		map.put("beginRow", beginRow);
		map.put("pagePerRow", pagePerRow);
		List<Notice> list = noticeDao.noticeList(map);
		int total = noticeDao.noticeCount();
		int lastPage = total/pagePerRow;
        if(total % pagePerRow != 0) {
            lastPage++;
        }
        logger.debug("list:"+list);
        logger.debug("lastPage:"+lastPage);
        logger.debug("currentPage:"+currentPage);
        logger.debug("beginRow:"+beginRow);
        logger.debug("pagePerRow:"+pagePerRow);
        logger.debug("======================page block=========================");
       
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
		logger.debug("======================page block=========================");
		Map<String,Object> returnMap = new HashMap<String,Object>();
		returnMap.put("list", list);
		returnMap.put("lastPage", lastPage);
		returnMap.put("firstBlockPage", firstBlockPage);
		returnMap.put("lastBlockPage", lastBlockPage);
		returnMap.put("totalBlock", totalBlock);
		return returnMap;
	}

	public void addNotice (Notice notice) {
		logger.debug("addNotice NoticeService");
		logger.debug("=============2번"+notice);
		notice.setNoticeNo("notice_"+(noticeDao.selectNoticNo()+1));
		noticeDao.addNotice(notice);
		logger.debug("----------5번"+notice);
	}
	public Notice selectNoticeOne(String noticeNo) {
		logger.debug("NoticeService 에서 selectNoticeOne 실행");
		logger.debug("==========8번"+noticeNo);
		return noticeDao.selectNoticeOne(noticeNo);
	}
	
	public void updatenotice (Notice notice) {
		logger.debug("15번"+notice);
		logger.debug("updateNotice NoticeService");
		noticeDao.updateNotice(notice);
	}

	
	public int deleteNotice(String noticeNo) {
		logger.debug("NoticeService 에서 deleteNotice 실행");
		logger.debug("99번"+noticeNo);
		return noticeDao.deletenoticeCount(noticeNo);
	}
	/*public Map<String, Object> noticeSearchDate(String startDate, String endDate) {
		logger.debug("NoticeService - noticeSearchDate 실행");
		logger.debug("22번"+startDate);
		logger.debug("23번"+endDate);
		Map<String,Object> map = new HashMap<String,Object>();
		map.put("startDate", startDate);
		map.put("endDate", endDate);
		logger.debug("24번"+startDate);
		logger.debug("25번"+endDate);
		logger.debug("가져온 데이터:"+startDate+","+endDate);
		List<Notice> list = noticeDao.noticeSearchDate(map);
		logger.debug("28번"+list);
		logger.debug("noitceSearchDate list:"+list);
		logger.debug("29번"+list);
		Map<String,Object> returnMap = new HashMap<String,Object>();
		returnMap.put("list", list);
		return returnMap;
	}
	public Map<String, Object> noticeSearch(String keyOption, int keyword, int currentPage, int pagePerRow) {
		Map<String,Object> map = new HashMap<String,Object>();
		map.put("keyword", keyword);
		map.put("keyField", keyOption);
		logger.debug("31번"+keyOption);
		logger.debug("32번"+keyword);
		logger.debug("33번"+currentPage);
		logger.debug("34번"+pagePerRow);
		logger.debug("가져온 데이터:"+keyword+","+keyOption);
		int count = 0;
		int result = 0;
		count = noticeDao.noticeSearchCount(map);
		logger.debug("36번"+map);
		logger.debug("36-1번"+count);
		Map<String,Object> returnMap = new HashMap<String,Object>();
		if(count >0) {
			List<Notice> list = noticeDao.noticeSearchAll(map);
			logger.debug("37번"+list);
	        logger.debug("list:"+list);
			result = 1;
			returnMap.put("list", list);
			returnMap.put("count", count);
			returnMap.put("result", result);
			}else {
				result = 2;
				returnMap.put("count", count);
				returnMap.put("result", result);
				}*/
		/*//페이징
		int beginRow = (currentPage-1)*pagePerRow;
		map.put("beginRow", beginRow);
		map.put("pagePerRow", pagePerRow);
		int lastPage = count/pagePerRow;
        if(count % pagePerRow != 0) {
            lastPage++;
        }
        logger.debug("lastPage:"+lastPage);
        logger.debug("currentPage:"+currentPage);
        logger.debug("beginRow:"+beginRow);
        logger.debug("pagePerRow:"+pagePerRow);
        logger.debug("======================page block=========================");
       
        int pagePerBlock = 10; //보여줄 블록 수 
        int block = currentPage/pagePerBlock;
        int totalBlock = count/pagePerBlock;//총 블록수
        
        if(currentPage % pagePerBlock != 0) {
        	block ++;
        }
        int firstBlockPage = (block-1)*pagePerBlock+1;
        int lastBlockPage = block*pagePerBlock;
        
		if(lastPage > 0) {			
			if(lastPage % pagePerBlock != 0) {
				totalBlock++;
			}*/
		/*}
		if(lastBlockPage >= totalBlock) {
			lastBlockPage = totalBlock;
		}
		logger.debug("firstBlockPage:"+firstBlockPage);
		logger.debug("lastBlockPage:"+lastBlockPage);
		logger.debug("block:"+block);
		logger.debug("totalBlock:"+totalBlock);
		logger.debug("======================page block=========================");
		returnMap.put("lastPage", lastPage);
		returnMap.put("firstBlockPage", firstBlockPage);
		returnMap.put("lastBlockPage", lastBlockPage);
		returnMap.put("totalBlock", totalBlock);
		return returnMap;
		}*/
	
		/*public int noticeCountView (int noticeNo) {
			logger.debug("updateNotice noticeCountView");
			logger.debug("-----------15번"+noticeNo);
			noticeDao.noticeCountView(noticeNo);
			return noticeNo;*/
		
		public  Map<String, Object> noticeListDetail(int currentPage, int pagePerRow,String noticeNo) {
			logger.debug("Noticeservice NoticeList 실행 부분");
			Map<String,Object> map = new HashMap<String,Object>();
			int beginRow = (currentPage-1)*pagePerRow;
			map.put("beginRow", beginRow);
			map.put("pagePerRow", pagePerRow);
			map.put("noticeNo", noticeNo);
			logger.debug("3번"+map);
			List<Notice> list = noticeDao.noticeListDetail(map);
			int total = noticeDao.noticeDetailCount();
			int lastPage = total/pagePerRow;
	        if(total % pagePerRow != 0) {
	            lastPage++;
	        }
	        logger.debug("list:"+list);
	        logger.debug("lastPage:"+lastPage);
	        logger.debug("currentPage:"+currentPage);
	        logger.debug("beginRow:"+beginRow);
	        logger.debug("pagePerRow:"+pagePerRow);
	        logger.debug("======================page block=========================");
	       
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
			logger.debug("======================page block=========================");
			Map<String,Object> returnMap = new HashMap<String,Object>();
			returnMap.put("list", list);
			logger.debug("8번"+returnMap);
			returnMap.put("lastPage", lastPage);
			returnMap.put("firstBlockPage", firstBlockPage);
			returnMap.put("lastBlockPage", lastBlockPage);
			returnMap.put("totalBlock", totalBlock);
			return returnMap;
		}
		/*public void noticeDetail (String notice) {
			logger.debug("updateNotice NoticeService");
			logger.debug("-----------11번"+notice);
			List<Notice>list = noticeDao.noticeDetail(notice);
}*/
}
