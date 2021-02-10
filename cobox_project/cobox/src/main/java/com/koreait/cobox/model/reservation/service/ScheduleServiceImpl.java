package com.koreait.cobox.model.reservation.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.koreait.cobox.model.domain.Schedule;
import com.koreait.cobox.model.reservation.repository.ScheduleDAO;

@Service
public class ScheduleServiceImpl implements ScheduleService{
	@Autowired
	private ScheduleDAO scheduleDAO;
	
	@Override
	public List selectById() {
		return scheduleDAO.selectById();
	}

	@Override
	public void insert(Schedule schedule) {
		scheduleDAO.insert(schedule);
	}

	@Override
	public void update(Schedule schedule) {
		scheduleDAO.update(schedule);
	}

	@Override
	public void delete(Schedule schedule) {
		scheduleDAO.delete(schedule);
	}

}
