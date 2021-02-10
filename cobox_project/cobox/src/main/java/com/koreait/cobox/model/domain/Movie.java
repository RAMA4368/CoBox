package com.koreait.cobox.model.domain;

import java.util.List;

import org.springframework.web.multipart.MultipartFile;

import lombok.Data;

@Data
public class Movie {
	
	private int movie_id;
	private String movie_name;
	private  int rating_id;
	private  String director;
	private  String actor;
	private  String release;
	private  String story;
	private String poster;//.png
	
	//이미지 처리
	private MultipartFile repImg;
	
	//insert
	private Genre[] genre;
	
	//rating 의 name값가져오기
	private Rating rating;
	
	//조인
	private List<Genre> genreList;
	
	
	

	
	
	
	
	
	

	
	



	
}
