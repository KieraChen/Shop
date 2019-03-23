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
		//��CartItems���ɵ��м���
		Collection<CartItem> cartItems1 = cartItems.values();
		for (CartItem cartItem : cartItems1) {
			total = total + cartItem.getSubTotal();
		}
		return total;
	}
	
	//��չ��ﳵ
	public void clearCart(){
		cartItems.clear();
		this.total = 0.0;
	}
	
	//�Ƴ����ﳵ�е�ĳ��������
	public void removeCartItem(Integer pid){
		if(cartItems.containsKey(pid)){
			cartItems.remove(pid);
		}
	}
	
	//���ﳵ�����ĳ��������
	public void addCartItem(CartItem cartItem1){
		//�жϹ��ﳵ���Ƿ��Ѵ��ڸù�����
		if(cartItems.containsKey(cartItem1.getProduct().getpId())){	
			CartItem oldCartItem = cartItems.get(cartItem1.getProduct().getpId());
			oldCartItem.setCount(cartItem1.getCount()+oldCartItem.getCount());
		}else{
			cartItems.put(cartItem1.getProduct().getpId(), cartItem1);
		}
	}
	
	//�޸Ĺ��ﳵ�й���������
	public void editCartItem(Integer pid,Integer count){
		if(cartItems.containsKey(pid)){
			CartItem cartItem1 = cartItems.get(pid);
			cartItem1.setCount(count);
		}
	}

}
