package com.cafe24.kyungsu93.address.service;

public class Address {
	private String addressNo;
	private String cityName;
	private String districtName;
	
	public String getAddressNo() {
		return addressNo;
	}
	public void setAddressNo(String addressNo) {
		this.addressNo = addressNo;
	}
	public String getCityName() {
		return cityName;
	}
	public void setCityName(String cityName) {
		this.cityName = cityName;
	}
	public String getDistrictName() {
		return districtName;
	}
	public void setDistrictName(String districtName) {
		this.districtName = districtName;
	}
	@Override
	public String toString() {
		return "Address [addressNo=" + addressNo + ", cityName=" + cityName + ", districtName=" + districtName + "]";
	}
	
}
