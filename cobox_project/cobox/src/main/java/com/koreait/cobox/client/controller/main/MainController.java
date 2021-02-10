package com.koreait.cobox.client.controller.main;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.koreait.cobox.model.common.Pager;
import com.koreait.cobox.model.domain.Movie;
import com.koreait.cobox.model.movie.repository.MovieDAO;
import com.koreait.cobox.model.movie.service.MovieService;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
//   client/main 으로 메인 가기

@Controller
public class MainController {
	private static final Logger logger = LoggerFactory.getLogger(MainController.class);
	@Autowired
	private MovieService movieService;
	@Autowired
	private MovieDAO movieDAO;
	@Autowired
	private Pager pager;

	@RequestMapping(value = "/main", method = RequestMethod.GET)
	public ModelAndView main(HttpServletRequest request) {
		ModelAndView mav = new ModelAndView("/main");
		List movieList = movieService.selectAll();
		pager.init(request, movieList);
		mav.addObject("movieList", movieList);
		return mav;

	}

	/*
	 * @RequestMapping(value = "/movie/reservation", method = RequestMethod.GET)
	 * public String reservation() {
	 * 
	 * return "client/movie/reservation"; }
	 * 
	 * @RequestMapping(value = "/movie/reservation2", method = RequestMethod.GET)
	 * public String reservation2() {
	 * 
	 * return "client/movie/reservation2"; }
	 * 
	 * @RequestMapping(value = "/movie/reservation3", method = RequestMethod.GET)
	 * public String reservation3() {
	 * 
	 * return "client/movie/reservation3"; }
	 */
	// 영화목록

	@RequestMapping(value = "/movie/list", method = RequestMethod.GET)
	public ModelAndView list(HttpServletRequest request) {
		ModelAndView mav = new ModelAndView("client/movie/movielist");

		List movieList = movieService.selectAll();
		pager.init(request, movieList);

		mav.addObject("pager", pager);

		return mav;
	}

	// 영화 상세정보

	@RequestMapping(value = "/movie/detail", method = RequestMethod.GET)
	public ModelAndView detail(int movie_id) {
		logger.debug("movie_id" + movie_id);
		Movie movie = movieDAO.selectById(movie_id);
		// Movie movie=movieService.select(movie_id);

		ModelAndView mav = new ModelAndView();
		mav.addObject("movie", movie);
		mav.setViewName("client/movie/moviedetail");

		return mav;
	}

	@RequestMapping(value = "/movie/detail1", method = RequestMethod.POST)
	public String edit(Movie movie) {
		movieDAO.update(movie);
		return "redirect:/client/detail?movie_id=" + movie.getMovie_id();
	}

	@RequestMapping(value = "/client/movie/snack", method = RequestMethod.GET)
	public String snack() {

		return "client/movie/snack";
	}



}