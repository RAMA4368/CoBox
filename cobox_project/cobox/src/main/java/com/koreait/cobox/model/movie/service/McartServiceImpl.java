package com.koreait.cobox.model.movie.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.koreait.cobox.exception.McartException;
import com.koreait.cobox.model.domain.Mcart;
import com.koreait.cobox.model.movie.repository.McartDAO;
@Service
public class McartServiceImpl implements McartService{
	@Autowired
	private McartDAO mcartDAO;
	
	@Override
	public List selectCartList() {
		return mcartDAO.selectAll();
	}

	@Override
	public List selectCartList(int member_id) {
		return mcartDAO.selectAll(member_id);
	}

	@Override
	public Mcart select(int cart_id) {
	
		return null;
	}

	@Override
	public void duplicateCheck(Mcart mcart) {
	
		
	}

	@Override
	public void insert(Mcart mcart) throws McartException{
		mcartDAO.duplicateCheck(mcart);
		mcartDAO.insert(mcart);
		
		
	}

	@Override
	public void update(Mcart mcart) {
		
		
	}

	@Override
	public void delete(Mcart mcart) {
		
		
	}

}
