package com.koreait.cobox.model.cartpay.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.koreait.cobox.exception.CartException;
import com.koreait.cobox.model.cartpay.repository.CartDAO;
import com.koreait.cobox.model.domain.Cart;
import com.koreait.cobox.model.domain.Member;
import com.koreait.cobox.model.payment.repository.PaymethodDAO;

@Service
public class CartPayServiceImpl implements CartPayService{
	@Autowired
	private CartDAO cartDAO;
	
	@Autowired
	PaymethodDAO paymethodDAO;
	
	@Override
	public List selectCartList() {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public List selectCartList(int member_id) {
		return cartDAO.selectAll(member_id);
	}

	@Override
	public Cart selectCart(int cart_id) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public void insert(Cart cart) throws CartException{
		cartDAO.duplicateCheck(cart);
		cartDAO.insert(cart);
	}

	@Override
	public void update(List<Cart> cartList) throws CartException{
		for(Cart cart : cartList) {
			cartDAO.update(cart);			
		}
	}

	@Override
	public void delete(Cart cart) {
		// TODO Auto-generated method stub
		
	}
	
	@Override
	public void delete(Member member) throws CartException{
		cartDAO.delete(member);
		
	}

	@Override
	public List selectPaymethodList() {
		return paymethodDAO.selectAll();
	}


}
