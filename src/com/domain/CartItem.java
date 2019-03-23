package com.domain;

public class CartItem {
	private Product product;
	private Integer count;
	public Product getProduct() {
		return product;
	}
	public void setProduct(Product product) {
		this.product = product;
	}
	public Integer getCount() {
		return count;
	}
	public void setCount(Integer count) {
		this.count = count;
	}
	public double getSubTotal(){
		return this.product.getShopPrice()*this.count;
	}
	@Override
	public String toString() {
		return "CartItem [product=" + product + ", count=" + count + "]";
	}
	

}
