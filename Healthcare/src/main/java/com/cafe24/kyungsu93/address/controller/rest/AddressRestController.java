package com.cafe24.kyungsu93.address.controller.rest;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

import com.cafe24.kyungsu93.address.service.Address;
import com.cafe24.kyungsu93.address.service.AddressDao;

@RestController
public class AddressRestController {
	@Autowired AddressDao addressService;
	
	@RequestMapping(value="/getDistrictList", method=RequestMethod.POST)
	public Map<String, Object> getDistrictList(Model model, Address address) {
		System.out.println("test 1");
		List<Address> districtList = addressService.getDistrictList(address);
		System.out.println(districtList);
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("districtList", districtList);
		System.out.println("test 2");
		return map;
	}
}
