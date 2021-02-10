package com.koreait.cobox.model.notice.service;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import com.koreait.cobox.model.domain.Notice;

public interface NoticeService {
	public List<Notice> selectAll(); //공지 전체글 가져오기
	public List<Notice> selectAllById(int division_id); // 구분값에 따른 공지리스트 가져오기
	public Notice select(int notice_id); // 공지 1건 가져오기
	public void insert(Notice notice); //1건 등록하기
	public void update(Notice notice); // 1건 수정하기 
	public void noticeHit(int notice_id); // 조회수 증가 
	public void delete(Notice notice); // 1건 삭제하기
	//public void sendMail(Member contact);
	
}