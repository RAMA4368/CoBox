package com.koreait.cobox.model.domain;

import java.util.List;

import lombok.Data;

@Data
public class Reservation {
	private int reservation_id;
	private Schedule schedule;
	private ResSummary ResSummary;
	private List<Seat> seat;
	private int seatquantity;
}
