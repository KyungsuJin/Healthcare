package com.cafe24.kyungsu93.helper.service;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

@Service
public class HelperService {
	private static final Logger logger = LoggerFactory.getLogger(HelperService.class);
	@Autowired
	HelperDao helperDao;
	@Autowired
	HttpSession session;
	
	
	public int removeComplain(String complainNo) {
		logger.debug("HelperController_removeComplain");	
		return helperDao.removeComplain(complainNo);
	}
	public ComplainAnswer getComplainAnswer(String complainNo) {
		logger.debug("HelperService_getComplainAnswer");
		return helperDao.getComplainAnswer(complainNo);
	}
	public int addComplainAnswer(ComplainAnswer complainAnswer) {
		logger.debug("HelperService_addComplainAnswer");
		System.out.println("시발 : " + complainAnswer.getComplainNo());
		return helperDao.addComplainAnswer(complainAnswer);
	}
	public List<Complain> getAllComplainList() {
		logger.debug("HelperService_getAllComplainList");
		return helperDao.getAllComplainList();
	}
	public List<Complain> getComplainList() {
		logger.debug("HelperService_getComplainList");
		String sMemberNo = (String)session.getAttribute("memberSessionNo");
		List<Complain> list = helperDao.getComplainList(sMemberNo);
		for(int i=0; i<list.size(); i++) {
			list.get(i).setComplainAnswerCount(helperDao.selectComplainAnswerCount(list.get(i).getComplainNo()));
		}
		
		return list;
	}
	public int addComplain(ComplainRequest complainRequest, String path) {
		logger.debug("HelperService_addComplain");
		List<MultipartFile> list = complainRequest.getMultipartFile();
		
		Complain complain = new Complain();
		ComplainEvidenceFile complainEvidenceFile = new ComplainEvidenceFile();
		complain.setMemberNo(complainRequest.getMemberNo());
		complain.setComplainMemberNo(complainRequest.getComplainMemberNo());
		complain.setComplainTitle(complainRequest.getComplainTitle());
		complain.setComplainContent(complainRequest.getComplainContent());				
		int result = (helperDao.selectComplainNo())+1;
		logger.debug("HelperService_selectComplainNo", result);
		String temp = "complain_";
		String complainNo = temp +result;
		complain.setComplainNo(complainNo);
		helperDao.addComplain(complain);
		
/*
		Gallery gallery = new Gallery();
		GalleryFile galleryFile = new GalleryFile();
		gallery.setGalleryTitle(galleryRequest.getGalleryTitle());
		gallery.setGalleryContent(galleryRequest.getGalleryContent());
		
		int galleryId = galleryDao.addGallery(gallery);
		galleryFile.setGalleryId(galleryId);
		
		for(MultipartFile multipartFile:list) {
			UUID uuid = UUID.randomUUID();
			String fileName = uuid.toString().replaceAll("-", "");
			logger.debug("fileName : "+fileName);
			logger.debug("fileName");
			logger.debug(fileName);
			galleryFile.setGalleryFileName(fileName);
			
			String fileRealName = multipartFile.getOriginalFilename();
			logger.debug("fileRealName : "+fileRealName);
			logger.debug("fileRealName");
			logger.debug(fileRealName);
			galleryFile.setGalleryFileRealName(fileRealName);
			
			int dotIndex = multipartFile.getOriginalFilename().lastIndexOf(".");
			logger.debug("dotIndex : "+dotIndex);	
			String fileExt = multipartFile.getOriginalFilename().substring(dotIndex+1);
			logger.debug("fileExt : "+fileExt);
			galleryFile.setGalleryFileExt(fileExt);
			
			String fileType = multipartFile.getContentType();
			logger.debug("fileType : "+fileType);
			galleryFile.setGalleryFileType(fileType);
			
			long fileSize = multipartFile.getSize();
			logger.debug("fileSize : "+fileSize);
			galleryFile.setGalleryFileSize(fileSize);
			
			
			gallery.setGalleryFile(galleryFile);
			File file = new File(path+fileName+"."+fileExt);
			logger.debug("file : "+file);
			
			
			try {
				multipartFile.transferTo(file);
				//trantferTo메서드를통해 path에 저장된 위치로 파일을 저장한다.
			}catch(IllegalStateException e) {
				e.printStackTrace();
			}catch(IOException e) {
				e.printStackTrace();
			}
			
			galleryFileDao.addGalleryFile(galleryFile);
		}*/
		return 1;
	}
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
