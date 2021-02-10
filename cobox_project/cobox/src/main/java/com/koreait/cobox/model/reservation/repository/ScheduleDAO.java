package com.koreait.cobox.model.reservation.repository;

import java.util.List;

import org.springframework.stereotype.Repository;

import com.koreait.cobox.model.domain.Schedule;


public interface ScheduleDAO {
	public List selectById();
	public void insert(Schedule schedule);
	public void update(Schedule schedule);
	public void delete(Schedule schedule);
}
