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
	FoodInfoDao foodInfoDao;
	@Autowired
	MedicineInfoDao medicineInfoDao;
	
	public void foodInfoInsert() {
		logger.debug("HomeService.foodInfoInsert 메서드 실행");
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
		//받은 json타입의 객체를 잘라서 FoodInfo타입으로 저장한 후 하나씩 db에 insert 한다. transaction 처리도 해준다.
		for(int i = 0 ; i < bodyArray.size(); i++){
			JSONObject data = (JSONObject) bodyArray.get(i);
			FoodInfo foodInfo = new FoodInfo();
			foodInfo.setFoodInfoNo("food_"+data.get("NUM").toString());
			foodInfo.setFoodGroup(data.get("FDGRP_NM").toString());
			foodInfo.setFoodName(data.get("DESC_KOR").toString());
			foodInfo.setFoodOnce(myParseInt(data.get("SERVING_WT").toString()));
			foodInfo.setFoodKcal(myParseDouble(data.get("NUTR_CONT1").toString()));
			foodInfo.setFoodCarbohydrate(myParseDouble(data.get("NUTR_CONT2").toString()));
			foodInfo.setFoodProtein(myParseDouble(data.get("NUTR_CONT3").toString()));
			foodInfo.setFoodFat(myParseDouble(data.get("NUTR_CONT4").toString()));
			foodInfo.setFoodSugar(myParseDouble(data.get("NUTR_CONT5").toString()));
			foodInfo.setFoodNatrium(myParseDouble(data.get("NUTR_CONT6").toString()));
			foodInfo.setFoodCholesterol(myParseDouble(data.get("NUTR_CONT7").toString()));
			foodInfo.setFoodSfa(myParseDouble(data.get("NUTR_CONT8").toString()));
			foodInfo.setFoodTransfat(myParseDouble(data.get("NUTR_CONT9").toString()));
			foodInfo.setFoodBuildDate(myParseInt(data.get("BGN_YEAR").toString()));
			foodInfoDao.foodInfoInsert(foodInfo);
		}


	}
	
	public void medicineInfo(int number) {
		logger.debug("HomeService.medicineInfo 메서드 실행");
		String url = "http://apis.data.go.kr/1470000/DURPrdlstInfoService/getDurPrdlstInfoList?ServiceKey=kg%2FMDbqAD%2B%2BxMOiZHrfwqODTrmLcXIlR3qZgfg79q8pYUcsZeGZEbySMX7RdRMqB0oFWKncfF9U3OBtJvU3FMA%3D%3D&numOfRows=100&pageNo="+number;
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
			MedicineInfo medicineInfo = new MedicineInfo();
			Node bigNode = list.item(i);
			NodeList smallNodeList = bigNode.getChildNodes();
			for(int j = 0 ; j < smallNodeList.getLength() ; j++) {
				Node node = smallNodeList.item(j);
				if(node.getNodeName().equals("ITEM_SEQ")) {
					if(node.getTextContent().equals(medicineCode)) {
						medicineInfo = null;
						break;
					}
					medicineCode = node.getTextContent();
					medicineInfo.setMedicineNo("medicine_" + medicineCode);
				} else if(node.getNodeName().equals("ITEM_NAME")) {
					medicineInfo.setMedicineName(node.getTextContent());
				} else if(node.getNodeName().equals("ENTP_NAME")) {
					medicineInfo.setMedicineManufacturer(node.getTextContent());
				} else if(node.getNodeName().equals("ITEM_PERMIT_DATE")) {
					medicineInfo.setMedicinePermissionDate(Integer.parseInt(node.getTextContent()));
				} else if(node.getNodeName().equals("MATERIAL_NAME")) {
					medicineInfo.setMedicineMaterial(node.getTextContent());
				} else if(node.getNodeName().equals("STORAGE_METHOD")) {
					medicineInfo.setMedicineStorageMethod(node.getTextContent());
				} else if(node.getNodeName().equals("VALID_TERM")) {
					medicineInfo.setMedicineValidTerm(node.getTextContent());
				} else if(node.getNodeName().equals("ETC_OTC_CODE")) {
					medicineInfo.setMedicineProGen(node.getTextContent());
				} else if(node.getNodeName().equals("CLASS_NO")) {
					medicineInfo.setMedicineClass(node.getTextContent());
				} else if(node.getNodeName().equals("CHART")) {
					medicineInfo.setMedicineAppear(node.getTextContent());
				} else if(node.getNodeName().equals("PACK_UNIT")) {
					medicineInfo.setMedicinePack(node.getTextContent());
				}
			}
			if(medicineInfo != null) {
				System.out.println(i + " : " + medicineInfo.toString());
				medicineInfoDao.medicineInfoInsert(medicineInfo);
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
