package com.cafe24.kyungsu93.medical.service;

import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.xml.parsers.DocumentBuilder;
import javax.xml.parsers.DocumentBuilderFactory;
import javax.xml.parsers.ParserConfigurationException;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.w3c.dom.Document;
import org.w3c.dom.Node;
import org.w3c.dom.NodeList;
import org.xml.sax.SAXException;

import com.cafe24.kyungsu93.address.service.Address;
import com.cafe24.kyungsu93.address.service.AddressDao;
import com.cafe24.kyungsu93.medication.service.MedicationResponse;


@Service
public class MedicalService {
	@Autowired MedicalDao medicalDao;
	@Autowired AddressDao addressDao;
	
	public void addMedical() {
		for(int number = 1 ; number < 2193 ; number++) {
			String url = "http://apis.data.go.kr/B551182/pharmacyInfoService/getParmacyBasisList?pageNo="+number+"&numOfRows=10&ServiceKey=kg%2FMDbqAD%2B%2BxMOiZHrfwqODTrmLcXIlR3qZgfg79q8pYUcsZeGZEbySMX7RdRMqB0oFWKncfF9U3OBtJvU3FMA%3D%3D";
			DocumentBuilderFactory factory = DocumentBuilderFactory.newInstance();
			Document doc = null;
			try {
				DocumentBuilder builder = factory.newDocumentBuilder();
				doc = builder.parse(url);
			} catch (SAXException e) {
				e.printStackTrace();
			} catch (IOException e) {
				e.printStackTrace();
			} catch (ParserConfigurationException e1) {
				e1.printStackTrace();
			}
			NodeList list = doc.getElementsByTagName("item");
			for(int i = 0 ; i < list.getLength() ; i++) {
				Medical medical = new Medical();
				Node bigNode = list.item(i);
				NodeList smallNodeList = bigNode.getChildNodes();
				for(int j = 0 ; j < smallNodeList.getLength() ; j++) {
					Node node = smallNodeList.item(j);
					if(node.getNodeName().equals("addr")) {
						medical.setMedicalAddress(node.getTextContent());
					} else if(node.getNodeName().equals("clCdNm")) {
						medical.setMedicalType(node.getTextContent());
					} else if(node.getNodeName().equals("telno")) {
						medical.setMedicalTel(node.getTextContent());
					} else if(node.getNodeName().equals("yadmNm")) {
						medical.setMedicalName(node.getTextContent());
					}
				}
				System.out.println("medical : " + medical.toString());
				medical.setMedicalNo("medical_"+(medicalDao.getMedicalNo()+1));
				medicalDao.addMedical(medical);
			}
		}
		
		for(int number = 1 ; number < 7059 ; number++) {
			String url = "http://apis.data.go.kr/B551182/hospInfoService/getHospBasisList?pageNo="+number+"&ServiceKey=kg%2FMDbqAD%2B%2BxMOiZHrfwqODTrmLcXIlR3qZgfg79q8pYUcsZeGZEbySMX7RdRMqB0oFWKncfF9U3OBtJvU3FMA%3D%3D";
			DocumentBuilderFactory factory = DocumentBuilderFactory.newInstance();
			Document doc = null;
			try {
				DocumentBuilder builder = factory.newDocumentBuilder();
				doc = builder.parse(url);
			} catch (SAXException e) {
				e.printStackTrace();
			} catch (IOException e) {
				e.printStackTrace();
			} catch (ParserConfigurationException e1) {
				e1.printStackTrace();
			}
			NodeList list = doc.getElementsByTagName("item");
			for(int i = 0 ; i < list.getLength() ; i++) {
				Medical medical = new Medical();
				Node bigNode = list.item(i);
				NodeList smallNodeList = bigNode.getChildNodes();
				for(int j = 0 ; j < smallNodeList.getLength() ; j++) {
					Node node = smallNodeList.item(j);
					if(node.getNodeName().equals("addr")) {
						medical.setMedicalAddress(node.getTextContent());
					} else if(node.getNodeName().equals("clCdNm")) {
						medical.setMedicalType(node.getTextContent());
					} else if(node.getNodeName().equals("telno")) {
						medical.setMedicalTel(node.getTextContent());
					} else if(node.getNodeName().equals("yadmNm")) {
						medical.setMedicalName(node.getTextContent());
					}
				}
				medical.setMedicalNo("medical_"+(medicalDao.getMedicalNo()+1));
				medicalDao.addMedical(medical);
			}
		}
	}
	
	public Map<String, Object> getMedicalAddressList(Medical medical, int currentPage, int pagePerRow){
		String medicalOldName = medical.getMedicalName();
		medical.setMedicalAddress(medical.getCityName() + " " + medical.getDistrictName()+"%");
		medical.setMedicalName("%"+medical.getMedicalName()+"%");
		int totalRow = medicalDao.medicalTotalCount(medical);
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
		pageMap.put("medical", medical);
		
		Map map = new HashMap<String, Object>();
		List<Medical> medicalList = medicalDao.getMedicalAddressList(pageMap);
		List<Integer> pageList = new ArrayList<Integer>();
		if(afterPage > lastPage) {
			for(int i = (beforePage+1) ; i <= lastPage ; i++ ) {
				pageList.add(i);
			}
		} else {
			for(int i = (beforePage+1) ; i < afterPage ; i++ ) {
				pageList.add(i);
			}
		}
		medical.setMedicalName(medicalOldName);
		map.put("medical", medical);
		map.put("medicalList", medicalList);
		map.put("pageList", pageList);
		map.put("firstPage", firstPage);
		map.put("lastPage", lastPage);
		map.put("beforePage", beforePage);
		map.put("afterPage", afterPage);
		map.put("currentPage", currentPage);
		
		return map;
	}

	public List<Address> getCityList() {
		return addressDao.getCityList();
	}
}
