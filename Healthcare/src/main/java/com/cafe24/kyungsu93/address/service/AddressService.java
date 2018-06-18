package com.cafe24.kyungsu93.address.service;

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

import com.cafe24.kyungsu93.address.service.Address;

@Service
public class AddressService {
	@Autowired AddressDao addressDao;
	
	public void addAddress() {
		Address defaultAddress = new Address();
		defaultAddress.setAddressNo("");
		defaultAddress.setCityName("");
		defaultAddress.setDistrictName("");
		for(int number = 1 ; number < 24 ; number++) {
			String url = "http://openapi.1365.go.kr/openapi/service/rest/CodeInquiryService/getAreaCodeInquiryList?pageNo="+number;
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
				Address address = new Address();
				Node bigNode = list.item(i);
				NodeList smallNodeList = bigNode.getChildNodes();
				for(int j = 0 ; j < smallNodeList.getLength() ; j++) {
					Node node = smallNodeList.item(j);
					if(node.getNodeName().equals("gugunNm")) {
						address.setDistrictName(node.getTextContent());
					} else if(node.getNodeName().equals("sidoNm")) {
						if(node.getTextContent().equals(defaultAddress.getCityName())) {
							address.setAddressNo(defaultAddress.getAddressNo());
							System.out.println(" 1 : " + address.toString());
							addressDao.addDistrict(address);
						} else {
							defaultAddress.setAddressNo("address_"+(addressDao.getAddressNo() + 1));
							defaultAddress.setCityName(node.getTextContent());
							address.setAddressNo(defaultAddress.getAddressNo());
							address.setCityName(defaultAddress.getCityName());
							System.out.println(" 2 : " + address.toString());
							addressDao.addCity(address);
							addressDao.addDistrict(address);
						}
					} 
				}
			}
		}
	}
	
	public List<Address> getCityList() {
		return addressDao.getCityList();
	}
	
	public List<Address> getDistrictList(Address address) {
		address.setAddressNo(addressDao.getAddressNo(address));
		System.out.println(address.toString());
		return addressDao.getDistrictList(address);
	}
}
