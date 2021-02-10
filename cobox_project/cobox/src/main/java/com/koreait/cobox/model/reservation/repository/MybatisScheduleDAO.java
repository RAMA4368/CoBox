package com.koreait.cobox.model.reservation.repository;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.koreait.cobox.exception.ReservationRegistException;
import com.koreait.cobox.model.domain.Schedule;

@Repository
public class MybatisScheduleDAO implements ScheduleDAO{
	@Autowired
	private SqlSessionTemplate sqlSessionTemplate;
	
	@Override
	public List selectById() {
		return sqlSessionTemplate.selectList("Schedule.selectById");
	}

	@Override
	public void insert(Schedule schedule) throws ReservationRegistException{
		int result=sqlSessionTemplate.insert("Schedule.insert",schedule);
		if(result==0) {
			throw new ReservationRegistException("예매정보등록실패");
		}
	}
	
	@Override
	public void update(Schedule schedule) throws ReservationRegistException{
		int result=sqlSessionTemplate.update("Schedule.update", schedule);
		if(result==0) {
			throw new ReservationRegistException("예매변경등록실패");
		}
		
	}

	@Override
	public void delete(Schedule schedule) throws ReservationRegistException{
		int result=sqlSessionTemplate.delete("Schedule.delete",schedule);
		if(result==0) {
			throw new ReservationRegistException("예매정보삭제실패");
		}
	}

}