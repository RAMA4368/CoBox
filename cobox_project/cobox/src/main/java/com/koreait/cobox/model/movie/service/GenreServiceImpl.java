package com.koreait.cobox.model.movie.service;

import java.util.List;

import com.koreait.cobox.exception.DMLException;
import com.koreait.cobox.model.movie.repository.GenreDAO;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class GenreServiceImpl implements GenreService{
	private static final Logger logger=LoggerFactory.getLogger(GenreServiceImpl.class);
	@Autowired
	GenreDAO genreDAO;
	@Override
	public List selectByGenre(String genre_name) {
		return genreDAO.selectByGenre(genre_name);
		
	}
	//장르 삭제
	@Override
	public void delete(int movie_id) throws DMLException{
		 genreDAO.delete(movie_id);
		 
	}

}
