package com.koreait.cobox.model.movie.repository;

import java.util.List;

import com.koreait.cobox.model.domain.Mcart;

public interface McartDAO {
	public List selectAll();//회원 구분없이 모든 데이터
	public List selectAll(int member_id);//특정회원의 장바구니 내역
	public Mcart select(int cart_id);
	public void duplicateCheck(Mcart mcart);//장바구니 중복상품 여부 채크
	public void insert(Mcart mcart);
	public void update(Mcart mcart);
	public void delete(Mcart mcart);
}
