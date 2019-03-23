package com.domain;

import java.util.Collection;
import java.util.LinkedHashMap;
import java.util.Map;
import java.util.Set;

public class Cart {
	private Map<Integer,CartItem> cartItems = new LinkedHashMap<Integer, CartItem>();
	private double total;
	
	public Map<Integer, CartItem> getCartItems() {
		return cartItems;
	}

	public double getTotal() {
		//将CartItems生成单列集合
		Collection<CartItem> cartItems1 = cartItems.values();
		for (CartItem cartItem : cartItems1) {
			total = total + cartItem.getSubTotal();
		}
		return total;
	}
	
	//清空购物车
	public void clearCart(){
		cartItems.clear();
		this.total = 0.0;
	}
	
	//移除购物车中的某个购物项
	public void removeCartItem(Integer pid){
		if(cartItems.containsKey(pid)){
			cartItems.remove(pid);
		}
	}
	
	//向购物车中添加某个购物项
	public void addCartItem(CartItem cartItem1){
		//判断购物车中是否已存在该购物项
		if(cartItems.containsKey(cartItem1.getProduct().getpId())){	
			CartItem oldCartItem = cartItems.get(cartItem1.getProduct().getpId());
			oldCartItem.setCount(cartItem1.getCount()+oldCartItem.getCount());
		}else{
			cartItems.put(cartItem1.getProduct().getpId(), cartItem1);
		}
	}
	
	//修改购物车中购物项数量
	public void editCartItem(Integer pid,Integer count){
		if(cartItems.containsKey(pid)){
			CartItem cartItem1 = cartItems.get(pid);
			cartItem1.setCount(count);
		}
	}

}
