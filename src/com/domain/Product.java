package com.domain;

import java.sql.Date;

public class Product {
	private Integer pId;
	private String pName;
	private double marketPrice;
	private double shopPrice;
	private String image;
	private String pDesc;
	private int isHot;
	private Date pDate;
	private Integer csId;
	public Integer getpId() {
		return pId;
	}
	public void setpId(Integer pId) {
		this.pId = pId;
	}
	public String getpName() {
		return pName;
	}
	public void setpName(String pName) {
		this.pName = pName;
	}
	public double getMarketPrice() {
		return marketPrice;
	}
	public void setMarketPrice(double marketPrice) {
		this.marketPrice = marketPrice;
	}
	public double getShopPrice() {
		return shopPrice;
	}
	public void setShopPrice(double shopPrice) {
		this.shopPrice = shopPrice;
	}
	public String getImage() {
		return image;
	}
	public void setImage(String image) {
		this.image = image;
	}
	public String getpDesc() {
		return pDesc;
	}
	public void setpDesc(String pDesc) {
		this.pDesc = pDesc;
	}
	public int getIsHot() {
		return isHot;
	}
	public void setIsHot(int isHot) {
		this.isHot = isHot;
	}
	public Date getpDate() {
		return pDate;
	}
	public void setpDate(Date pDate) {
		this.pDate = pDate;
	}
	public Integer getCsId() {
		return csId;
	}
	public void setCsId(Integer csId) {
		this.csId = csId;
	}
	@Override
	public String toString() {
		return "Product [pId=" + pId + ", pName=" + pName + ", marketPrice="
				+ marketPrice + ", shopPrice=" + shopPrice + ", image=" + image
				+ ", pDesc=" + pDesc + ", isHot=" + isHot + ", pDate=" + pDate
				+ ", csId=" + csId + "]";
	}
	

}
