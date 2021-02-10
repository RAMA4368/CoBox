package com.koreait.cobox.model.domain;

import lombok.Data;

@Data
public class ResSummary {
	private int res_summay_id;
	private int memeber_id;
	private int paymethod_id;
	private String paydate;
	private int total_price;
	private int total_pay;
}