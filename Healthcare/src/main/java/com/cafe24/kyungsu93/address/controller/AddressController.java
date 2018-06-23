package com.cafe24.kyungsu93.address.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.cafe24.kyungsu93.address.service.AddressService;

@Controller
public class AddressController {
	
	@Autowired AddressService addressService;
	
	@RequestMapping(value="/addAddress", method=RequestMethod.GET)
	public void addAddress() {
		addressService.addAddress();
	}
}
