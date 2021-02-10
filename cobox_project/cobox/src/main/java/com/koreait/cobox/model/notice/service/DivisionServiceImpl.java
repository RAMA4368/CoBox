package com.koreait.cobox.model.notice.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.koreait.cobox.model.domain.Division;
import com.koreait.cobox.model.notice.repository.DivisionDAO;

@Service
public class DivisionServiceImpl implements DivisionService{
	@Autowired
	private DivisionDAO divisionDAO;

	@Override
	public List<Division> selectAll() {
		return divisionDAO.selectAll();
	}

	@Override
	public String selectDname(int division_id) {
		return divisionDAO.select(division_id);
	}

}