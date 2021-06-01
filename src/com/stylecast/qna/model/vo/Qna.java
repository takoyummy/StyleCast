package com.stylecast.qna.model.vo;

import java.sql.Date;

public class Qna {
	
	private int qnaNo;
	private int memNo;
	private String memName;
	private String qnaTitle;
	private String qnaContent;
	private Date enrDate;
	private int memAdmin;
	private String ansContent;
	private Date ansDate;
	private String qnaCategory;
	
	public Qna() {
		super();
	}
	
	public Qna(int qnaNo, int memNo, String qnaTitle, String qnaContent, Date enrDate, int memAdmin, String ansContent,
			Date ansDate, String qnaCategory) {
		super();
		this.qnaNo = qnaNo;
		this.memNo = memNo;
		this.qnaTitle = qnaTitle;
		this.qnaContent = qnaContent;
		this.enrDate = enrDate;
		this.memAdmin = memAdmin;
		this.ansContent = ansContent;
		this.ansDate = ansDate;
		this.qnaCategory = qnaCategory;
	}
	
	

	public Qna(int qnaNo, int memNo, String memName, String qnaTitle, String qnaContent, Date enrDate, int memAdmin,
			String ansContent, Date ansDate, String qnaCategory) {
		super();
		this.qnaNo = qnaNo;
		this.memNo = memNo;
		this.memName = memName;
		this.qnaTitle = qnaTitle;
		this.qnaContent = qnaContent;
		this.enrDate = enrDate;
		this.memAdmin = memAdmin;
		this.ansContent = ansContent;
		this.ansDate = ansDate;
		this.qnaCategory = qnaCategory;
	}
	
	
	

	public Qna(int qnaNo, String qnaCategory, String qnaTitle,String memName, Date enrDate, String ansContent) {
		super();
		this.qnaNo = qnaNo;
		this.qnaCategory = qnaCategory;
		this.qnaTitle = qnaTitle;
		this.memName = memName;
		this.enrDate = enrDate;
		this.ansContent = ansContent;
	}

	public Qna(int qnaNo, String qnaTitle, Date enrDate, String ansContent) {
		super();
		this.qnaNo = qnaNo;
		this.qnaTitle = qnaTitle;
		this.enrDate = enrDate;
		this.ansContent = ansContent;
	}

	public int getQnaNo() {
		return qnaNo;
	}

	public void setQnaNo(int qnaNo) {
		this.qnaNo = qnaNo;
	}

	public int getMemNo() {
		return memNo;
	}

	public void setMemNo(int memNo) {
		this.memNo = memNo;
	}

	public String getQnaTitle() {
		return qnaTitle;
	}

	public void setQnaTitle(String qnaTitle) {
		this.qnaTitle = qnaTitle;
	}

	public String getQnaContent() {
		return qnaContent;
	}

	public void setQnaContent(String qnaContent) {
		this.qnaContent = qnaContent;
	}

	public Date getEnrDate() {
		return enrDate;
	}

	public void setEnrDate(Date enrDate) {
		this.enrDate = enrDate;
	}

	public int getMemAdmin() {
		return memAdmin;
	}

	public void setMemAdmin(int memAdmin) {
		this.memAdmin = memAdmin;
	}

	public String getAnsContent() {
		return ansContent;
	}

	public void setAnsContent(String ansContent) {
		this.ansContent = ansContent;
	}

	public Date getAnsDate() {
		return ansDate;
	}

	public void setAnsDate(Date ansDate) {
		this.ansDate = ansDate;
	}

	public String getQnaCategory() {
		return qnaCategory;
	}

	public void setQnaCategory(String qnaCategory) {
		this.qnaCategory = qnaCategory;
	}
	
	

	public String getMemName() {
		return memName;
	}

	public void setMemName(String memName) {
		this.memName = memName;
	}

	@Override
	public String toString() {
		return "Qna [qnaNo=" + qnaNo + ", memNo=" + memNo + ", memName=" + memName + ", qnaTitle=" + qnaTitle
				+ ", qnaContent=" + qnaContent + ", enrDate=" + enrDate + ", memAdmin=" + memAdmin + ", ansContent="
				+ ansContent + ", ansDate=" + ansDate + ", qnaCategory=" + qnaCategory + "]";
	}

	
	
}
