package com.koreait.cobox.model.movie.service;

import java.util.List;

public interface GenreService {
	public List selectByGenre(String genre_name);
	public void delete(int movie_id);
}
