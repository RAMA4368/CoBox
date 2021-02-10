package com.koreait.cobox.model.reservation.service;

import java.util.List;

import com.koreait.cobox.model.domain.Schedule;

public interface ScheduleService {
	public List selectById();
	public void insert(Schedule schedule);
	public void update(Schedule schedule);
	public void delete(Schedule schedule);
}
