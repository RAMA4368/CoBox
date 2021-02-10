package com.koreait.cobox.model.movie.repository;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.koreait.cobox.exception.McartException;
import com.koreait.cobox.model.domain.Mcart;
@Repository
public class MybatisMcartDAO implements McartDAO{
	@Autowired
	private SqlSessionTemplate sqlSessionTemplate;
	@Override
	public List selectAll() {
		
		return null;
	}

	@Override
	public List selectAll(int member_id) {
		return sqlSessionTemplate.selectList("Mcart.selectAll",member_id);
		
	}

	@Override
	public Mcart select(int cart_id) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public void duplicateCheck(Mcart mcart) throws McartException{
		List list = sqlSessionTemplate.selectList("Mcart.duplicateCheck",mcart);
		if(list.size()>0) {//이미 담겨진 상품이 있다.
			throw new McartException("영화를 이미 찜하셨어요!");
		}
	}
	@Override
	public void insert(Mcart mcart) throws McartException{
		int result = sqlSessionTemplate.insert("Mcart.insert",mcart);
		if(result==0) {
			throw new McartException("영화담기 실패");
		}
	}

	@Override
	public void update(Mcart mcart) {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void delete(Mcart mcart) {
		// TODO Auto-generated method stub
		
	}


}
