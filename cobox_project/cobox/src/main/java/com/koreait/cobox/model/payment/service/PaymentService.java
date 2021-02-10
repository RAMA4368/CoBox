package com.koreait.cobox.model.payment.service;

import java.util.List;

import com.koreait.cobox.model.domain.ResSummary;
import com.koreait.cobox.model.domain.Reservation;
import com.koreait.cobox.model.domain.Schedule;

public interface PaymentService {
	/*결제업무*/ 
	public List selectPaymethodList();//결제수단 가져오기 
	public ResSummary selectById(int res_summary_id); // 한건의 결제정보 
	public void registReservation(ResSummary  resSummary,Reservation reservation,Schedule schedule); //결제요청 처리 (트랜젝션처리!)
	public void update(ResSummary resSummary); // 결제 수단 .... 수정.. ?? ? ㅁㅇ ㅁㄴ??
	public void delete(ResSummary resSummary); // 환불 ...? 
}
