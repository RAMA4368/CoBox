package com.koreait.cobox.model.domain;

import lombok.Data;

@Data
public class Payment {
	private int payment_id;
	private int memeber_id;
	private int reservation_id;
	private String paydate;
	private int total;
}
