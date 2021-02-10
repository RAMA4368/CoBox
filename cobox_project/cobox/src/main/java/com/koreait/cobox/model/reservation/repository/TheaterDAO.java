package com.koreait.cobox.model.reservation.repository;

import java.util.List;

public interface TheaterDAO {
	public List selectAll();
	public List selectAllById(int location_id);//선택한 위치에 소속된 극장 카테고리
}