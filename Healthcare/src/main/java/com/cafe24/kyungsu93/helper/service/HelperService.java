package com.cafe24.kyungsu93.helper.service;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class HelperService {
	private static final Logger logger = LoggerFactory.getLogger(HelperService.class);
	@Autowired
	HelperDao helperDao;
	@Autowired
	HttpSession session;
	
	public List<Sanction> getSanctionKindList() {
		logger.debug("HelperService_getSanctionKindList");
		return helperDao.getSanctionKindList();
	}
	public int removeInquire(String inquireNo) {
		logger.debug("HelperService_removeInquire");
		helperDao.removeInquireAnswer(inquireNo);
		return helperDao.removeInquire(inquireNo);
	}
	public InquireAnswer getInquireAnswer(String inquireNo) {
		logger.debug("HelperService_getInquireAnswer");
		return helperDao.getInquireAnswer(inquireNo);
	}
	public int addInquireAnswer(InquireAnswer inquireAnswer) {
		logger.debug("HelperService_addInquireAnswer");
		return helperDao.addInquireAnswer(inquireAnswer);
	}
	public List<Inquire> getAllInquireList() {
		logger.debug("HelperService_getAllInquireList");
		return helperDao.getAllInquireList();
	}
	public List<Inquire> getInquireList() {
		logger.debug("HelperService_getInquireList");
		String memberNo = (String)session.getAttribute("memberSessionNo");
		List<Inquire> list = helperDao.getInquireList(memberNo);
		for(int i=0; i<list.size(); i++) {
			list.get(i).setAnswerCount(helperDao.selectInquireAnswerCount(list.get(i).getInquireNo()));
			System.out.println("카운트 : " + list.get(i).getAnswerCount());
		}
		
		return list;
	}
	public int addInquire(Inquire inquire) {
		logger.debug("HelperService_addInquire");
		inquire.setInquireNo("111111");
		System.out.println("시발 : " + inquire.getInquireNo());
		helperDao.addInquire(inquire);
		return 1;
	}
}
