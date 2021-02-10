package com.koreait.cobox.model.reservation.service;

import java.util.List;

import com.koreait.cobox.model.domain.Member;
import com.koreait.cobox.model.domain.ResSummary;
import com.koreait.cobox.model.domain.Reservation;

public interface ReservationService {
	//예매업무
	public List selectAll();
	public List selectAll(int member_id);
	public Reservation select(int reservation_id);
	public void insert(Reservation reservation);
	public void update(Reservation reservation);
	public void delete(Reservation reservation);
	public void delete(Member member);
	
	
}