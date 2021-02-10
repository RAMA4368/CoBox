package com.koreait.cobox.model.snack.repository;

import java.util.List;

import com.koreait.cobox.model.domain.Snack;

public interface SnackDAO {
	public List selectAll();
	public List selectById(int topcategory_id);
	public Snack select(int snack_id);
	public void insert(Snack snack);
	public void update(Snack snack);
	public void delete(int snack_id);
}
