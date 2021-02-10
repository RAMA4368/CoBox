package com.koreait.cobox.model.domain;


import lombok.Data;

@Data
public class Schedule {
	private int schedule_id;
	private Movie movie;
	private Theater theater;
	private String sdate;
	private String stime;
}