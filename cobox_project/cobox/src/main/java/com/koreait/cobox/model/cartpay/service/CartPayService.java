package com.koreait.cobox.model.cartpay.service;

import java.util.List;

import com.koreait.cobox.model.domain.Cart;
import com.koreait.cobox.model.domain.Member;

public interface CartPayService {
	//Cart관련
	public List selectCartList();
	public List selectCartList(int member_id);	//회원만
	public Cart selectCart(int cart_id);
	public void insert(Cart cart);
	public void update(List<Cart> cartList);
	public void delete(Cart cart);
	public void delete(Member member);

	//Pay
	public List selectPaymethodList();
}
