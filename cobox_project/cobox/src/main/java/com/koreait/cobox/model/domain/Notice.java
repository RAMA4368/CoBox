package com.koreait.cobox.model.domain;


import lombok.Data;

@Data
public class Notice {
	private int notice_id;
	private Division division;
	private String title;
	private String writer;
	private String contents;
	private String regdate;
	private int hit;
}
