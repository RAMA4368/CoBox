package com.koreait.cobox.model.snack.service;

import java.io.File;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.koreait.cobox.exception.SnackRegistException;
import com.koreait.cobox.model.common.FileManager;
import com.koreait.cobox.model.domain.Snack;
import com.koreait.cobox.model.snack.repository.SnackDAO;

@Service
public class SnackServiceImpl implements SnackService{
	@Autowired
	private SnackDAO snackDAO;
	
	@Override
	public List selectAll() {
		return snackDAO.selectAll();
	}

	@Override
	public List selectById(int topcategory_id) {
		return snackDAO.selectById(topcategory_id);
	}
	
	@Override
	public Snack select(int snack_id) {
		return snackDAO.select(snack_id);
	}

	@Override
	public void regist(FileManager fileManager, Snack snack) throws SnackRegistException{
		
		String ext = fileManager.getExtend(snack.getSnackImg().getOriginalFilename());	//확장자
		snack.setFilename(ext);
		
		snackDAO.insert(snack);	//db
		String snackImg = snack.getSnack_id()+"."+ext;
		fileManager.saveFile(fileManager.getSaveSnackDir()+File.separator+snackImg, snack.getSnackImg());
		
	}

	@Override
	public void update(FileManager fileManager, Snack snack) {
		String ext = fileManager.getExtend(snack.getSnackImg().getOriginalFilename());	//확장자
		snack.setFilename(ext);
		
		snackDAO.update(snack);
		
		String snackImg = snack.getSnack_id()+"."+ext;
		fileManager.saveFile(fileManager.getSaveSnackDir()+File.separator+snackImg, snack.getSnackImg());
	}

	@Override
	public void delete(int snack_id) {
		snackDAO.delete(snack_id);
		
	}

}
