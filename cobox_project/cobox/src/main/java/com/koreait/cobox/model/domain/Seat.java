package com.koreait.cobox.model.domain;

import lombok.Data;

@Data
public class Seat {
	private int seat_id;
	private int box_id;
	private String seat_name;
	private String hold;
}
