package com.koreait.cobox.model.cartpay.repository;

import java.util.List;

import com.koreait.cobox.model.domain.Cart;
import com.koreait.cobox.model.domain.Member;

public interface CartDAO {
	public List selectAll();
	public List selectAll(int member_id);	//회원만
	public Cart select(int cart_id);
	public void duplicateCheck(Cart cart);	//장바구니 중복확인
	public void insert(Cart cart);
	public void update(Cart cart);
	public void delete(Member member);
}
