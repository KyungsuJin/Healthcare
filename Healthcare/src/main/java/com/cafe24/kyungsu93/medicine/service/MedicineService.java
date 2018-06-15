package com.cafe24.kyungsu93.medicine.service;

import java.io.IOException;
import java.util.List;

import javax.xml.parsers.DocumentBuilder;
import javax.xml.parsers.DocumentBuilderFactory;
import javax.xml.parsers.ParserConfigurationException;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.w3c.dom.Document;
import org.w3c.dom.Node;
import org.w3c.dom.NodeList;
import org.xml.sax.SAXException;

@Service
public class MedicineService {
	private final static Logger logger = LoggerFactory.getLogger(MedicineService.class);
	static String medicineCode = "1";
	@Autowired MedicineDao medicineDao;
	
	public List<Medicine> getMedicineList(String medicineName) {
		List<Medicine> list = medicineDao.getMedicineList(medicineName);
		System.out.println("list : "+list);
		return list;
	}
	
	public void addMedicine(int number) {
		logger.debug("MedicineService.addMedicine 메서드 실행");
		String url = "http://apis.data.go.kr/1470000/DURPrdlstService/getDurPrdlstList?ServiceKey=kg%2FMDbqAD%2B%2BxMOiZHrfwqODTrmLcXIlR3qZgfg79q8pYUcsZeGZEbySMX7RdRMqB0oFWKncfF9U3OBtJvU3FMA%3D%3D&numOfRows=100&pageNo="+number;
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
		System.out.println(list);
		
		for(int i = 0 ; i < list.getLength() ; i++) {
			Medicine medicine = new Medicine();
			Node bigNode = list.item(i);
			NodeList smallNodeList = bigNode.getChildNodes();
			for(int j = 0 ; j < smallNodeList.getLength() ; j++) {
				Node node = smallNodeList.item(j);
				if(node.getNodeName().equals("ITEM_SEQ")) {
					if(node.getTextContent().equals(medicineCode)) {
						medicine = null;
						break;
					}
					medicineCode = node.getTextContent();
					medicine.setMedicineNo("medicine_" + medicineCode);
				} else if(node.getNodeName().equals("ITEM_NAME")) {
					medicine.setMedicineName(node.getTextContent());
				} else if(node.getNodeName().equals("ENTP_NAME")) {
					medicine.setMedicineManufacturer(node.getTextContent());
				} else if(node.getNodeName().equals("ITEM_PERMIT_DATE")) {
					medicine.setMedicinePermissionDate(Integer.parseInt(node.getTextContent()));
				} else if(node.getNodeName().equals("MATERIAL_NAME")) {
					medicine.setMedicineMaterial(node.getTextContent());
				} else if(node.getNodeName().equals("STORAGE_METHOD")) {
					medicine.setMedicineStorageMethod(node.getTextContent());
				} else if(node.getNodeName().equals("VALID_TERM")) {
					medicine.setMedicineValidTerm(node.getTextContent());
				} else if(node.getNodeName().equals("ETC_OTC_CODE")) {
					medicine.setMedicineEtcOtc(node.getTextContent());
				} else if(node.getNodeName().equals("CLASS_NO")) {
					medicine.setMedicineClass(node.getTextContent());
				} else if(node.getNodeName().equals("CHART")) {
					medicine.setMedicineAppear(node.getTextContent());
				} else if(node.getNodeName().equals("PACK_UNIT")) {
					medicine.setMedicinePack(node.getTextContent());
				}
			}
			if(medicine != null) {
				System.out.println(i + " : " + medicine.toString());
				medicineDao.addMedicine(medicine);
			}
		}
	}
}
