package com.koreait.cobox.model.domain;

import lombok.Data;

@Data
public class Box {
	private int box_id;
	private Theater theater;
	private int total_seat;
}
