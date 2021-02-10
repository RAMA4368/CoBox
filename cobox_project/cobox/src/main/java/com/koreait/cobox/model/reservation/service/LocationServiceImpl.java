package com.koreait.cobox.model.reservation.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.koreait.cobox.model.reservation.repository.LocationDAO;

@Service
public class LocationServiceImpl implements LocationService{
	@Autowired
	private LocationDAO locationDAO;
	
	@Override
	public List selectAll() {
		return locationDAO.selectAll();
	}

}
