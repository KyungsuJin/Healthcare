package com.cafe24.kyungsu93.payment.service;

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
public class RefundService {

	@Autowired
	private RefundDao refundDao;
	@Autowired
	private PointChargingDao pointChargingDao;
	private static final Logger logger = LoggerFactory.getLogger(RefundService.class);

	/**
	 * 환불 지급완료
	 * @param refundNo
	 */
	public void completeRefund(String refundNo) {
		logger.debug("RefundService - completeRefund실행");
		Refund refund = new Refund();
		refund.setRefundNo(refundNo);
		String refundCompleteDirectorNo = "member_1";
		refund.setRefundCompleteDirectorNo(refundCompleteDirectorNo);
		refundDao.completeRefund(refund);
		}	
		
	/**
	 * 환불 거절
	 * @param refundNo
	 */
	public void deniedRefund(String refundNo) {
		logger.debug("RefundService - deniedRefund실행");
		Refund refund = new Refund();
		refund.setRefundNo(refundNo);
		String refundDirectorNo = "member_1";
		refund.setRefundDirectorNo(refundDirectorNo);
		refundDao.deniedRefund(refund);
		}	
	
	/**
	 * 환불 승인
	 * @param refundNo
	 */
	public void acceptRefund(String refundNo) {
		logger.debug("RefundService - acceptRefund실행");
		Refund refund = new Refund();
		refund.setRefundNo(refundNo);
		String refundDirectorNo = "member_1";
		refund.setRefundDirectorNo(refundDirectorNo);
		refundDao.acceptRefund(refund);
		}	
	
	/**
	 * 회원 포인트 조회
	 * @return
	 */
	public Map<String,Object> memberPoint() {
		logger.debug("RefundService - memberPoint실행");
		PointCharging pointCharging = new PointCharging();
		String memberNo = "member_99";/*pointCharging.getMemberNo();*/
		PointCharging memberPointSearch = pointChargingDao.selectMemberPoint(memberNo);
		
		int memberPoint = memberPointSearch.getMemberPoint();
		Map<String,Object> returnMap = new HashMap<String,Object>();
		returnMap.put("memberPoint", memberPoint);
		returnMap.put("memberNo", memberNo);
		return returnMap;
	}
	
	/**
	 * 환불 신청 등록
	 * @param refund
	 */
	public void addrefund(Refund refund) {
		logger.debug("RefundService - addrefund실행");		
		String refundNo = refund.getRefundNo();
		logger.debug("refundNo:"+refundNo);
		int refundSum = refund.getRefundSum();
		logger.debug("refundSum:"+refundSum);
		try {
			if(refundNo == null) {
				//포인트 결제 전체 검색
				int count = 0;
				count = refundDao.refundTotalCount();
				if(count > 0) {
					int result = 0;
					String refundNo_temp = "refund_";
					//포인트 결제 번호 최대값 검색
					result = refundDao.refundMaxNo();
					if(result > 0) {
						if(1 <= result) {
							result++;
						}
						refundNo = refundNo_temp + result; 
					}
				}else {
					refundNo = "refund_1";
				}
			}
			refund.setRefundNo(refundNo);
			refund.setRefundSum(refundSum);
		}catch(NullPointerException e) {
			e.printStackTrace();
		}
		refundDao.addrefund(refund);
		}
	
	/**
	 * 환불 지급완료 리스트
	 * @param currentPage
	 * @param pagePerRow
	 * @return
	 */
	public Map<String, Object> refundCompleteList(int currentPage, int pagePerRow){
		logger.debug("pointChargingService - refundCompleteList 실행");
		Map<String,Integer> map = new HashMap<String,Integer>();
		int beginRow = (currentPage-1)*pagePerRow;
		map.put("beginRow", beginRow);
		map.put("pagePerRow", pagePerRow);
		List<Refund> list = refundDao.refundCompleteList(map);
		int total = refundDao.refundCompleteTotalCount();
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
	 * 환불 승인 완료 리스트
	 * @param currentPage
	 * @param pagePerRow
	 * @return
	 */
	public Map<String, Object> refundApprovalList(int currentPage, int pagePerRow){
		logger.debug("pointChargingService - refundApprovalList 실행");
		Map<String,Integer> map = new HashMap<String,Integer>();
		int beginRow = (currentPage-1)*pagePerRow;
		map.put("beginRow", beginRow);
		map.put("pagePerRow", pagePerRow);
		List<Refund> list = refundDao.refundApprovalList(map);
		int total = refundDao.refundApprovalTotalCount();
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
	 * 환불 승인 대기리스트
	 * @param currentPage
	 * @param pagePerRow
	 * @return
	 */
	public Map<String, Object> refundList(int currentPage, int pagePerRow){
		logger.debug("pointChargingService - refundList 실행");
		Map<String,Integer> map = new HashMap<String,Integer>();
		int beginRow = (currentPage-1)*pagePerRow;
		map.put("beginRow", beginRow);
		map.put("pagePerRow", pagePerRow);
		List<Refund> list = refundDao.refundList(map);
		int total = refundDao.refundTotalCount();
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
}
