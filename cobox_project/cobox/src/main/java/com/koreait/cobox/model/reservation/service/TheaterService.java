package com.koreait.cobox.model.reservation.service;

import java.util.List;

public interface TheaterService {
	public List selectAll();
	public List selectAllById(int location_id);//선택한 위치 카테고리에 소속된 극장 카테고리 목록가져오기
}