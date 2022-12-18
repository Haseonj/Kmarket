package kr.co.kmarket.vo;

public class BoardVO {
	private int no;
	private String uid;
	private String group;
	private String c1Name;
	private String cate1;
	private String cate2;
	private String title;
	private String content;
	private String regip;
	private String rdate;
	
	private int cate2No;
	
	public int getCate2No() {
		return cate2No;
	}
	public void setCate2No(int cate2No) {
		this.cate2No = cate2No;
	}
	public void setCate2No(String cate2No) {
		this.cate2No = Integer.parseInt(cate2No);
	}
	public int getNo() {
		return no;
	}
	public void setNo(int no) {
		this.no = no;
	}
	public String getUid() {
		return uid;
	}
	public void setUid(String uid) {
		this.uid = uid;
	}
	public String getGroup() {
		return group;
	}
	public void setGroup(String group) {
		this.group = group;
	}
	public String getC1Name() {
		return c1Name;
	}
	public void setC1Name(String c1Name) {
		this.c1Name = c1Name;
	}
	public String getCate1() {
		return cate1;
	}
	public void setCate1(String cate1) {
		this.cate1 = cate1;
	}
	public String getCate2() {
		return cate2;
	}
	public void setCate2(String cate2) {
		this.cate2 = cate2;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public String getRegip() {
		return regip;
	}
	public void setRegip(String regip) {
		this.regip = regip;
	}
	public String getRdate() {
		return rdate;
	}
	public void setRdate(String rdate) {
		this.rdate = rdate;
	}
	
	
}
