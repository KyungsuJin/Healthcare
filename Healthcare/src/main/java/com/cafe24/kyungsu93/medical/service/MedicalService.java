package com.cafe24.kyungsu93.medical.service;

import java.io.IOException;
import java.util.List;

import javax.xml.parsers.DocumentBuilder;
import javax.xml.parsers.DocumentBuilderFactory;
import javax.xml.parsers.ParserConfigurationException;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.w3c.dom.Document;
import org.w3c.dom.Node;
import org.w3c.dom.NodeList;
import org.xml.sax.SAXException;


@Service
public class MedicalService {
	@Autowired MedicalDao medicalDao;
	
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
	
	public List<Medical> getMedicalAddressList(Medical medical){
		medical.setMedicalAddress(medical.getMedicalAddress()+"%");
		return medicalDao.getMedicalAddressList(medical);
	}
}
