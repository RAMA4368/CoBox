package com.koreait.cobox.model.movie.service;

import java.io.File;
import java.util.HashMap;
import java.util.List;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.koreait.cobox.exception.DMLException;
import com.koreait.cobox.exception.MovieRegistException;
import com.koreait.cobox.model.common.FileManager;
import com.koreait.cobox.model.domain.Genre;
import com.koreait.cobox.model.domain.Movie;
import com.koreait.cobox.model.movie.repository.GenreDAO;
import com.koreait.cobox.model.movie.repository.MovieDAO;


import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

@Service
public class MovieServiceImpl implements MovieService{
	private static final Logger logger=LoggerFactory.getLogger(MovieServiceImpl.class);
	@Autowired
	private MovieDAO movieDAO;
	@Autowired
	private GenreDAO genreDAO;

	  
	@Override
	public List selectAll() {
		return movieDAO.selectAll();
	}

	@Override
	public Movie selectById(int movie_id) {
		return movieDAO.selectById(movie_id);
	}
	//영화 등록
	@Override
	public void regist(FileManager fileManager, Movie movie) throws DMLException{
		
		String ext = fileManager.getExtend(movie.getRepImg().getOriginalFilename());
		movie.setPoster(ext);//확장자결정
		
		//db에 넣기 DAO에게 시키기
		movieDAO.insert(movie);
		//상품의 movie_id 를 이용해서 대표이미지명을 결정
		//대표이미지 업로드 : movie.getRepImg() 이 친구를 realDir진짜 경로에 담아버리겠다!
		String repImg = movie.getMovie_id()+"."+ext; //1.png 
		fileManager.saveFile(fileManager.getSaveMovieDir()+File.separator+repImg, movie.getRepImg());
		
		
		//장르
		for(Genre genre:movie.getGenre()) {
			genre.setMovie_id(movie.getMovie_id());
			genreDAO.insert(genre);
		}
	}
	
	//이미지 재 업로드 없을때 수정
	@Override
	public void update(FileManager fileManager,Movie movie) throws MovieRegistException{
		movie.setPoster(movie.getPoster());
		movie.setRepImg(movie.getRepImg());
		movieDAO.update(movie);
		
		
		genreDAO.delete(movie.getMovie_id()); //원래 있던 장르 삭제 후 인서트
		for(Genre genre:movie.getGenre()) {
			genre.setMovie_id(movie.getMovie_id());
			genreDAO.insert(genre);
		}
		
	}
	//이미지 재업로드 있을때 수정
	@Override
	public void updatefile(FileManager fileManager, Movie movie) throws MovieRegistException{
		//원래 있던 파일 먼저 삭제 후 넣기
		//업로드된 영화 경로
		
		String repImg=movie.getMovie_id()+"."+movie.getPoster();
		boolean result = fileManager.deleteFile(fileManager.getSaveMovieDir()+File.separator+repImg); //경로에 들어있는 파일 삭제!
		logger.debug("사진 삭제 결과는? "+result);
		
		
		
		String ext = fileManager.getExtend(movie.getRepImg().getOriginalFilename());
		movie.setPoster(ext);//확장자결정
		movieDAO.update(movie);
		
		genreDAO.delete(movie.getMovie_id()); //원래 있던 장르 삭제 후 인서트
		for(Genre genre:movie.getGenre()) {
			genre.setMovie_id(movie.getMovie_id());
			genreDAO.insert(genre);
		}
		
		//이미지 삭제가 끝났으니 다시 업로드!
		repImg = movie.getMovie_id()+"."+ext; //1.png 
		fileManager.saveFile(fileManager.getSaveMovieDir()+File.separator+repImg, movie.getRepImg());
	}
	
	
	
	@Override
	public void delete(int movie_id) throws DMLException{
		movieDAO.delete(movie_id);
		
	}

	@Override
	public Movie select(int movie_id) {
		
		return movieDAO.select(movie_id);
	}


//	@Override
//	public List selectByGenre(String genre_name) {
//		
//		return movieDAO.selectByGenre(genre_name);
//	}
//
//	

}
