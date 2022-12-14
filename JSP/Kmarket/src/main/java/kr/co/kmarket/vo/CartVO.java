package kr.co.kmarket.vo;

public class CartVO {
	private int cartNo;
	private String uid;
	private int prodNo;
	private int count;
	private int price;
	private int discount;
	private int point;
	private int delivery;
	private int total;
	private String rdate;
	public int getCartNo() {
		return cartNo;
	}
	public void setCartNo(int cartNo) {
		this.cartNo = cartNo;
	}
	public String getUid() {
		return uid;
	}
	public void setUid(String uid) {
		this.uid = uid;
	}
	public int getProdNo() {
		return prodNo;
	}
	public void setProdNo(int prodNo) {
		this.prodNo = prodNo;
	}
	public void setProdNo(String prodNo) {
		this.prodNo = Integer.parseInt(prodNo);
	}
	public int getCount() {
		return count;
	}
	public void setCount(int count) {
		this.count = count;
	}
	public void setCount(String count) {
		this.count = Integer.parseInt(count);
	}
	public int getPrice() {
		return price;
	}
	public void setPrice(int price) {
		this.price = price;
	}
	public void setPrice(String price) {
		this.price = Integer.parseInt(price);
	}
	public int getDiscount() {
		return discount;
	}
	public void setDiscount(int discount) {
		this.discount = discount;
	}
	public void setDiscount(String discount) {
		this.discount = Integer.parseInt(discount);
	}
	public int getPoint() {
		return point;
	}
	public void setPoint(int point) {
		this.point = point;
	}
	public void setPoint(String point) {
		this.point = Integer.parseInt(point);
	}
	public int getDelivery() {
		return delivery;
	}
	public void setDelivery(int delivery) {
		this.delivery = delivery;
	}
	public void setDelivery(String delivery) {
		this.delivery = Integer.parseInt(delivery);
	}
	public int getTotal() {
		return total;
	}
	public void setTotal(int total) {
		this.total = total;
	}
	public void setTotal(String total) {
		this.total = Integer.parseInt(total);
	}
	public String getRdate() {
		return rdate;
	}
	public void setRdate(String rdate) {
		this.rdate = rdate;
	}
	
	
}
