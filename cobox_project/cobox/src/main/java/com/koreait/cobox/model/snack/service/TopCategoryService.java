package com.koreait.cobox.model.snack.service;

import java.util.List;

import com.koreait.cobox.model.domain.TopCategory;

public interface TopCategoryService {
	public List selectAll();
	public TopCategory select(int topcategory_id);
	public void insert(TopCategory topcategory);
	public void update(TopCategory topcategory);
	public void delete(int topcategory_id);
}
