package com.koreait.cobox.model.notice.service;

import java.util.List;

import com.koreait.cobox.model.domain.Division;

public interface DivisionService {
	public List<Division> selectAll();
	public String selectDname(int division_id);
}
