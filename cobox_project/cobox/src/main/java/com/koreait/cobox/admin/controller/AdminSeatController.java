package com.koreait.cobox.admin.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class AdminSeatController {

	@RequestMapping("/seat/seat")
	public String seatRegist() {
		
		return "admin/seat/seat";
	}
	
	
}