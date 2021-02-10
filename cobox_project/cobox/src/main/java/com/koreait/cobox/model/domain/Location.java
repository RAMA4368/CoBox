package com.koreait.cobox.model.domain;

import java.util.List;

import lombok.Data;

@Data
public class Location {
	private int location_id;
	private String loc_name;
	private List<Theater> theater;

}
