package com.koreait.cobox.model.notice.service;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.koreait.cobox.exception.NoticeDeleteException;
import com.koreait.cobox.exception.NoticeEditException;
import com.koreait.cobox.exception.NoticeRegistException;
import com.koreait.cobox.model.domain.Notice;
import com.koreait.cobox.model.notice.repository.NoticeDAO;

@Service
public class NoticeServiceImpl implements NoticeService{
	
	@Autowired
	private NoticeDAO noticeDAO; 
	
	

	@Override
	public List<Notice> selectAll() {
		List<Notice> noticeList = noticeDAO.selectAll();
		return noticeList;
	}

	@Override
	public Notice select(int notice_id) {
		Notice notice = noticeDAO.select(notice_id);
		return notice;
	}

	@Override
	public void insert(Notice notice) throws NoticeRegistException{
		noticeDAO.insert(notice);
	}

	@Override
	public void update(Notice notice) throws NoticeEditException{
		noticeDAO.update(notice);
	}

	@Override
	public void delete(Notice notice) throws NoticeDeleteException{
		noticeDAO.delete(notice);
	}

	@Override
	public void noticeHit(int notice_id) throws NoticeEditException{
		noticeDAO.noticeHit(notice_id);
	}

	@Override
	public List<Notice> selectAllById(int division_id) {
		return noticeDAO.selectAllById(division_id);
	} 
	

}