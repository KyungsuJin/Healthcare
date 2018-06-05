package com.cafe24.kyungsu93.bloodsugar.service;

public class Bloodsugar {

	private String bloodsugarno;
	private String memberno;
	private int fastingbloodsugar;
	private String fastingstate;
	private String bloodsugardate;
	public String getBloodsugarno() {
		return bloodsugarno;
	}
	public void setBloodsugarno(String bloodsugarno) {
		this.bloodsugarno = bloodsugarno;
	}
	public String getMemberno() {
		return memberno;
	}
	public void setMemberno(String memberno) {
		this.memberno = memberno;
	}
	public int getFastingbloodsugar() {
		return fastingbloodsugar;
	}
	public void setFastingbloodsugar(int fastingbloodsugar) {
		this.fastingbloodsugar = fastingbloodsugar;
	}
	public String getFastingstate() {
		return fastingstate;
	}
	public void setFastingstate(String fastingstate) {
		this.fastingstate = fastingstate;
	}
	public String getBloodsugardate() {
		return bloodsugardate;
	}
	public void setBloodsugardate(String bloodsugardate) {
		this.bloodsugardate = bloodsugardate;
	}
	@Override
	public String toString() {
		return "Bloodsugar [bloodsugarno=" + bloodsugarno + ", memberno=" + memberno + ", fastingbloodsugar="
				+ fastingbloodsugar + ", fastingstate=" + fastingstate + ", bloodsugardate=" + bloodsugardate + "]";
	}

}