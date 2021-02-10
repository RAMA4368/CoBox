package com.koreait.cobox.model.notice.repository;

import java.util.List;

import com.koreait.cobox.model.domain.Division;

public interface DivisionDAO {
	public List<Division> selectAll();
	public String select(int division_id);
}
