package com.koreait.cobox.model.snack.service;

import java.util.List;

import com.koreait.cobox.model.common.FileManager;
import com.koreait.cobox.model.domain.Snack;

public interface SnackService {
	public List selectAll();
	public List selectById(int topcategory_id);
	public Snack select(int snack_id);
	public void regist(FileManager fileManager, Snack snack);
	public void update(FileManager fileManager, Snack snack);
	public void delete(int snack_id);
}
