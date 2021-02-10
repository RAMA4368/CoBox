package com.koreait.cobox.model.domain;

import lombok.Data;

@Data
public class Comments {
	private int comments_id;
	private String member_name;
	private int movie_id;
	private String cdate;
	private String msg;
}
