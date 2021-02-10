/********************************************************
 	결제업무
 ******************************************************/
package com.koreait.cobox.model.payment.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.koreait.cobox.model.domain.ResSummary;
import com.koreait.cobox.model.domain.Reservation;
import com.koreait.cobox.model.domain.Schedule;
import com.koreait.cobox.model.payment.repository.PaymethodDAO;
import com.koreait.cobox.model.payment.repository.ResSummaryDAO;
import com.koreait.cobox.model.reservation.repository.ReservationDAO;

@Service
public class PaymentServiceImpl implements PaymentService{
	@Autowired
	private PaymethodDAO paymethodDAO;
	
	//결제관련 2가지 DAO(ResSummary,Reservation)
	@Autowired
	private ResSummaryDAO resSummaryDAO;
	
	@Autowired
	private ReservationDAO reservationDAO;

	//결제수단리스트 불러오기
	@Override
	public List selectPaymethodList() {
		return paymethodDAO.selectAll();
	}
	
	//주문등록 
	@Override
	public void registReservation(ResSummary resSummary, Reservation reservation,Schedule schedule) {
		//주문정보 등록(ResSummay)
		resSummaryDAO.insert(resSummary);
		
		
		//reservation에 schedule_id 넣어주기 
		reservation.setSchedule(schedule);
		//취득한 주문번호를 reservation에 넣어줘야한다   (주입어떻게해 ...객체안에 아이디... )
		/* reservation.setRes_summary_id(resSummary.getRes_summay_id()); */
		reservation.setResSummary(resSummary);
		
		//예약정보 등록(Reservation)-우리는 장바구니테이블이 없으므로 detail(Reservation)도 넘겨받아서 insert해야함
		reservationDAO.insert(reservation);
	}

	@Override
	public ResSummary selectById(int res_summary_id) {
		return resSummaryDAO.selectById(res_summary_id);
	}

	@Override
	public void update(ResSummary resSummary) {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void delete(ResSummary resSummary) {
		// TODO Auto-generated method stub
		
	}
}
