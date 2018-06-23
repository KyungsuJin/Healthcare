package com.cafe24.kyungsu93.helper.service;

public class SanctionKind {
	private String sanctionKindNo;
	private String sanctionKind;
	public String getSanctionKindNo() {
		return sanctionKindNo;
	}
	public void setSanctionKindNo(String sanctionKindNo) {
		this.sanctionKindNo = sanctionKindNo;
	}
	public String getSanctionKind() {
		return sanctionKind;
	}
	public void setSanctionKind(String sanctionKind) {
		this.sanctionKind = sanctionKind;
	}
	@Override
	public String toString() {
		return "SanctionKind [sanctionKindNo=" + sanctionKindNo + ", sanctionKind=" + sanctionKind + "]";
	}
	
	
}
