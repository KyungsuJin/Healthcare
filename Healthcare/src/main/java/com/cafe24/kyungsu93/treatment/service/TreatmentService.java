package com.cafe24.kyungsu93.treatment.service;

import java.io.File;
import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

@Service
public class TreatmentService {
	private static final Logger logger = LoggerFactory.getLogger(TreatmentService.class);

	@Autowired private TreatmentDao treatmentDao;
	@Autowired private TreatmentFileDao treatmentFileDao;
	
	public void addTreatment(TreatmentRequest treatmentRequest, String path) {
		logger.debug("TreatmentService.addTreatment 메서드 호출");
		logger.debug("TreatmentService.addTreatment.treatmentRequest : " + treatmentRequest.toString());
		logger.debug("TreatmentService.addTreatment.path : " + path);
		List<MultipartFile> multipartFileList = treatmentRequest.getMultipartFile();
		//file 업로드 전 게시물을 먼저 insert 한 후 primary key 값을 가져온다.
		String treatmentNo = "treatment_" + (treatmentDao.getTreatmentNo()+1);
		treatmentRequest.setTreatmentNo(treatmentNo);
		treatmentDao.addTreatment(treatmentRequest);
		logger.debug("TreatmentService.addTreatment.treatmentNo : " + treatmentNo);
		if(multipartFileList != null) {
			for(MultipartFile multipartFile : multipartFileList) {
				logger.debug("TreatmentService.addTreatment.multipartFile : " + multipartFile);
				TreatmentFile treatmentFile = new TreatmentFile();
				UUID uuid = UUID.randomUUID();
				String fileName = uuid.toString().replaceAll("-", "");
				treatmentFile.setTreatmentFileName(fileName);
				treatmentFile.setTreatmentFileRealName(multipartFile.getOriginalFilename());
				treatmentFile.setTreatmentNo(treatmentNo);
				String fileExt = multipartFile.getOriginalFilename().substring(multipartFile.getOriginalFilename().lastIndexOf(".")+1);
				treatmentFile.setTreatmentFileExt(fileExt);
				treatmentFile.setTreatmentFileType(multipartFile.getContentType());
				treatmentFile.setTreatmentFileSize(multipartFile.getSize());
				File file = new File(path+fileName+"."+fileExt);
				try {
					multipartFile.transferTo(file);
				} catch (IllegalStateException e) {
					e.printStackTrace();
				} catch (IOException e) {
					e.printStackTrace();
				}
				treatmentFileDao.addTreatmentFile(treatmentFile);
			}
		}
	}
	
	public Map<String, Object> getTreatmentList(int currentPage, int pagePerRow, TreatmentRequest treatmentRequest){
		logger.debug("TreatmentService.getTreatmentList 호출");
		int totalRow = treatmentDao.treatmentTotalCount();
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
		pageMap.put("memberNo", treatmentRequest.getMemberNo());
		Map map = new HashMap<String, Object>();
		List<TreatmentResponse> list = treatmentDao.getTreatmentList(pageMap);
		map.put("list", list);
		map.put("firstPage", firstPage);
		map.put("lastPage", lastPage);
		map.put("beforePage", beforePage);
		map.put("afterPage", afterPage);
		logger.debug("TreatmentService.getTreatmentList.list : " + list);
		logger.debug("TreatmentService.getTreatmentList.firstPage : " + firstPage);
		logger.debug("TreatmentService.getTreatmentList.lastPage : " + lastPage);
		logger.debug("TreatmentService.getTreatmentList.beforePage : " + beforePage);
		logger.debug("TreatmentService.getTreatmentList.afterPage : " + afterPage);
		return map;
	}
	
	public Map<String, TreatmentResponse> getTreatmentContent(TreatmentRequest treatmentRequest) {
		Map map = new HashMap<String, Object>();
		map.put("treatmentResponse", treatmentDao.getTreatmentContent(treatmentRequest));
		List<TreatmentResponse> list = treatmentDao.getTreatmentClosest(treatmentRequest);
		if(list.size() == 0) {
			
		} else if(list.size() < 2) {
			
			if(Integer.parseInt(list.get(0).getTreatmentNo().substring(list.get(0).getTreatmentNo().lastIndexOf("_")+1))
					< Integer.parseInt(treatmentRequest.getTreatmentNo().substring(treatmentRequest.getTreatmentNo().lastIndexOf("_")+1))) {
				map.put("upTreatment", null);
				map.put("downTreatment", list.get(0));
			} else {
				map.put("upTreatment", list.get(0));
				map.put("downTreatment", null);
			}
		} else {
			map.put("upTreatment", list.get(0));
			map.put("downTreatment", list.get(1));	
		}
		return map;
	}
	
	public void removeTreatment(TreatmentRequest treatmentRequest) {
		if(treatmentFileDao.treatmentFileTotalCount(treatmentRequest) != 0) {
			treatmentFileDao.removeAllTreatmentFile(treatmentRequest.getTreatmentNo());
		}
		treatmentDao.removeTreatment(treatmentRequest);
	}
	
	public void modifyTreatment(TreatmentRequest treatmentRequest, String path) {
		List<MultipartFile> multipartFileList = treatmentRequest.getMultipartFile();
		treatmentDao.modifyTreatment(treatmentRequest);
		if(treatmentRequest.getTreatmentDeleteList() != null) {
			for(String treatmentNo : treatmentRequest.getTreatmentDeleteList()) {
				treatmentFileDao.removeTreatmentFile(treatmentNo);
			}
		}
		if(multipartFileList != null) {
			for(MultipartFile multipartFile : multipartFileList) {
				logger.debug("TreatmentService.addTreatment.multipartFile : " + multipartFile);
				TreatmentFile treatmentFile = new TreatmentFile();
				UUID uuid = UUID.randomUUID();
				String fileName = uuid.toString().replaceAll("-", "");
				logger.debug("TreatmentService.addTreatment.fileName : " + treatmentRequest.getTreatmentNo());
				treatmentFile.setTreatmentFileName(fileName);
				treatmentFile.setTreatmentFileRealName(multipartFile.getOriginalFilename());
				treatmentFile.setTreatmentNo(treatmentRequest.getTreatmentNo());
				String fileExt = multipartFile.getOriginalFilename().substring(multipartFile.getOriginalFilename().lastIndexOf(".")+1);
				treatmentFile.setTreatmentFileExt(fileExt);
				treatmentFile.setTreatmentFileType(multipartFile.getContentType());
				treatmentFile.setTreatmentFileSize(multipartFile.getSize());
				File file = new File(path+fileName+"."+fileExt);
				try {
					multipartFile.transferTo(file);
				} catch (IllegalStateException e) {
					e.printStackTrace();
				} catch (IOException e) {
					e.printStackTrace();
				}
				treatmentFile.setTreatmentFileNo("treatment_file_"+(treatmentFileDao.getTreatmentFileNo()+1));
				treatmentFileDao.addTreatmentFile(treatmentFile);
			}
		}
	}
}
