package com.cafe24.kyungsu93;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.io.IOException;
import java.io.InputStreamReader;
import java.io.UnsupportedEncodingException;
import java.net.URL;

import javax.xml.parsers.*;
import org.w3c.dom.*;
import org.xml.sax.SAXException;
import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.json.simple.JSONValue;
import org.jsoup.Jsoup;
import org.jsoup.nodes.Document;
import org.jsoup.select.Elements;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

@Service
@Transactional
public class HomeService {
	private static final Logger logger = LoggerFactory.getLogger(HomeService.class);
	static String medicineCode = "1";
	@Autowired
	FoodDao foodDao;
	@Autowired
	MedicineDao medicineDao;
	
	public void foodInsert() {
		logger.debug("HomeService.foodInsert 메서드 실행");
		URL url = null;
		String urlValue = "http://openapi.foodsafetykorea.go.kr/api/a50c027b0ae7404c8cae/I0750/json/1/999";
		InputStreamReader isr = null;
		try {
			url = new URL(urlValue);
			isr = new InputStreamReader(url.openConnection().getInputStream(), "UTF-8");
		} catch (UnsupportedEncodingException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}

		JSONObject object = (JSONObject)JSONValue.parse(isr);
		object = (JSONObject)object.get("I0750");
		JSONArray bodyArray = (JSONArray) object.get("row");
		System.out.println("size : "+bodyArray.size());
		//받은 json타입의 객체를 잘라서 Food타입으로 저장한 후 하나씩 db에 insert 한다. transaction 처리도 해준다.
		for(int i = 0 ; i < bodyArray.size(); i++){
			JSONObject data = (JSONObject) bodyArray.get(i);
			Food food = new Food();
			food.setFoodNo("food_"+data.get("NUM").toString());
			food.setFoodGroup(data.get("FDGRP_NM").toString());
			food.setFoodName(data.get("DESC_KOR").toString());
			food.setFoodOnce(myParseInt(data.get("SERVING_WT").toString()));
			food.setFoodKcal(myParseDouble(data.get("NUTR_CONT1").toString()));
			food.setFoodCarbohydrate(myParseDouble(data.get("NUTR_CONT2").toString()));
			food.setFoodProtein(myParseDouble(data.get("NUTR_CONT3").toString()));
			food.setFoodFat(myParseDouble(data.get("NUTR_CONT4").toString()));
			food.setFoodSugar(myParseDouble(data.get("NUTR_CONT5").toString()));
			food.setFoodNatrium(myParseDouble(data.get("NUTR_CONT6").toString()));
			food.setFoodCholesterol(myParseDouble(data.get("NUTR_CONT7").toString()));
			food.setFoodSfa(myParseDouble(data.get("NUTR_CONT8").toString()));
			food.setFoodTransfat(myParseDouble(data.get("NUTR_CONT9").toString()));
			food.setFoodBuildDate(myParseInt(data.get("BGN_YEAR").toString()));
			foodDao.foodInsert(food);
		}


	}
	
	public void medicine(int number) {
		logger.debug("HomeService.medicine 메서드 실행");
		String url = "http://apis.data.go.kr/1470000/DURPrdlstService/getDurPrdlstList?ServiceKey=kg%2FMDbqAD%2B%2BxMOiZHrfwqODTrmLcXIlR3qZgfg79q8pYUcsZeGZEbySMX7RdRMqB0oFWKncfF9U3OBtJvU3FMA%3D%3D&numOfRows=100&pageNo="+number;
		DocumentBuilderFactory factory = DocumentBuilderFactory.newInstance();
		org.w3c.dom.Document doc = null;
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
					medicine.setMedicineProGen(node.getTextContent());
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
				medicineDao.medicineInsert(medicine);
			}
		}
		
		
		
		

	}
	
	public double myParseDouble(String data) {
		if(data.equals("N/A")) {
			data = "0";
		} else if(data.equals("TRACE")) {
			data = "0.005";
		}
		
		return Double.parseDouble(data);
	}
	
	public int myParseInt(String data) {
		if(data.equals("N/A")) {
			data = "0";
		}
		return Integer.parseInt(data);
	}
}
