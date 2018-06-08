package com.cafe24.kyungsu93.notice.service;

public class Notice {

	private String noticeno;
	private String memberno;
	private String noticetitle;
	private String noticecontent;
	private int noticecount;
	private String noticedate;
	public String getNoticeno() {
		return noticeno;
	}
	public void setNoticeno(String noticeno) {
		this.noticeno = noticeno;
	}
	public String getMemberno() {
		return memberno;
	}
	public void setMemberno(String memberno) {
		this.memberno = memberno;
	}
	public String getNoticetitle() {
		return noticetitle;
	}
	public void setNoticetitle(String noticetitle) {
		this.noticetitle = noticetitle;
	}
	public String getNoticecontent() {
		return noticecontent;
	}
	public void setNoticecontent(String noticecontent) {
		this.noticecontent = noticecontent;
	}
	public int getNoticecount() {
		return noticecount;
	}
	public void setNoticecount(int noticecount) {
		this.noticecount = noticecount;
	}
	public String getNoticedate() {
		return noticedate;
	}
	public void setNoticedate(String noticedate) {
		this.noticedate = noticedate;
	}
	@Override
	public String toString() {
		return "Notice [noticeno=" + noticeno + ", memberno=" + memberno + ", noticetitle=" + noticetitle
				+ ", noticecontent=" + noticecontent + ", noticecount=" + noticecount + ", noticedate=" + noticedate
				+ "]";
	}	
}