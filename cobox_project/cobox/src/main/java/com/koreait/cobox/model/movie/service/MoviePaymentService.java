package com.koreait.cobox.model.movie.service;

import java.util.List;

import org.springframework.stereotype.Repository;

import com.koreait.cobox.model.domain.Mcart;

@Repository
public interface MoviePaymentService {
	//장바구니 관련 업무
	public List selectMcartList();//회원 구분없이 모든 데이터
	public List selectMcartList(int member_id);//특정회원의 장바구니 내역
	public Mcart selectMcart(int cart_id);
	public void insert(Mcart mcart);
	public void update(Mcart mcart);
	public void delete(Mcart mcart);
	
	//결제업무
	
}
