package com.koreait.cobox.model.payment.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.koreait.cobox.model.payment.repository.PaymethodDAO;

@Service
public class PaymethodServiceImpl implements PaymethodService{
	@Autowired
	PaymethodDAO paymethodDAO;
	
	
	@Override
	public List selectAll() {
		return paymethodDAO.selectAll();
	}

	@Override
	public void registReservation() {
		// TODO Auto-generated method stub
		
	}

}
