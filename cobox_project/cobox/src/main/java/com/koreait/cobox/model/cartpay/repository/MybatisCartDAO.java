package com.koreait.cobox.model.cartpay.repository;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.koreait.cobox.exception.CartException;
import com.koreait.cobox.model.domain.Cart;
import com.koreait.cobox.model.domain.Member;

@Repository
public class MybatisCartDAO implements CartDAO{
	@Autowired
	private SqlSessionTemplate sqlSessionTemplate;
	
	@Override
	public List selectAll() {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public List selectAll(int member_id) {
		return sqlSessionTemplate.selectList("Cart.selectAll", member_id);
	}

	@Override
	public Cart select(int cart_id) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public void duplicateCheck(Cart cart) throws CartException{
		List list= sqlSessionTemplate.selectList("Cart.duplicateCheck", cart);
		if(list.size()>0) {
			throw new CartException("카트에 이미 상품이 담겨있습니다");
		}
	}
	
	@Override
	public void insert(Cart cart) throws CartException{
		int result = sqlSessionTemplate.insert("Cart.insert", cart);
		if(result==0) {
			throw new CartException("장바구니에 담지 못했습니다");
		}
	}

	@Override
	public void update(Cart cart) throws CartException{
		int result = sqlSessionTemplate.update("Cart.update", cart);
		if(result==0) {
			throw new CartException("장바구니 수정에 실패했습니다");
		}
	}

	@Override
	public void delete(Member member) throws CartException{
		int result = sqlSessionTemplate.delete("Cart.delete", member.getMember_id());
		if(result==0) {
			throw new CartException("장바구니 삭제에 실패했습니다");
		}
	}

}
