package com.koreait.cobox.model.domain;

import org.springframework.web.multipart.MultipartFile;

import lombok.Data;

@Data
public class Snack {
	private int snack_id;
	private TopCategory topCategory;
	private String snack_name;
	private int price;
	private int amount;
	private String detail;
	private String filename;
	private MultipartFile snackImg;
}
