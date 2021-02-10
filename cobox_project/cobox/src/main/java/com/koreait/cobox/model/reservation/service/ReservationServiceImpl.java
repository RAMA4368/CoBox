package com.koreait.cobox.model.reservation.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.koreait.cobox.model.domain.Member;
import com.koreait.cobox.model.domain.ResSummary;
import com.koreait.cobox.model.domain.Reservation;
import com.koreait.cobox.model.payment.repository.PaymethodDAO;
import com.koreait.cobox.model.reservation.repository.ReservationDAO;

@Service
public class ReservationServiceImpl implements ReservationService{
	@Autowired
	private ReservationDAO reservationDAO;
	

	
	@Override
	public List selectAll() {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public List selectAll(int member_id) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public Reservation select(int reservation_id) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public void insert(Reservation reservation) {
		reservationDAO.insert(reservation);
	}

	@Override
	public void update(Reservation reservation) {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void delete(Reservation reservation) {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void delete(Member member) {
		// TODO Auto-generated method stub
		
	}
	
	

}