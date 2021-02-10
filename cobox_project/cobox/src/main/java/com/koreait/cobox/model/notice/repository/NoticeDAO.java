package com.koreait.cobox.model.notice.repository;

import java.util.List;

import com.koreait.cobox.model.domain.Notice;

public interface NoticeDAO {
	public List<Notice> selectAll(); //공지 전체글 가져오기
	public Notice select(int notice_id); // 공지 1건 가져오기
	public List<Notice> selectAllById(int division_id); // 구분값에 따른 공지리스츠 가져오기
	public void insert(Notice notice); //1건 등록하기
	public void update(Notice notice); // 1건 수정하기 
	public void noticeHit(int notice_id); //조회수 올리기
	public void delete(Notice notice); // 1건 삭제하기 (가능하다면 관리자만 삭제 가능하도록)
	
}
