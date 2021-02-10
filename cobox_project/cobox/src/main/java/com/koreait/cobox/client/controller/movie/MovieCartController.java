package com.koreait.cobox.client.controller.movie;

import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.koreait.cobox.exception.LoginRequiredException;
import com.koreait.cobox.exception.McartException;
import com.koreait.cobox.model.common.MessageData;
import com.koreait.cobox.model.common.Pager;
import com.koreait.cobox.model.domain.Mcart;
import com.koreait.cobox.model.domain.Member;
import com.koreait.cobox.model.movie.service.McartService;
import com.koreait.cobox.model.movie.service.MoviePaymentService;
import com.koreait.cobox.model.movie.service.MovieService;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;

@Controller
public class MovieCartController {
	private static final Logger logger=LoggerFactory.getLogger(MovieCartController.class);
	@Autowired
	private McartService mcartService;
	@Autowired
	private Pager pager;
	@Autowired
	private MovieService movieService;
	//장바구니에 상품담기 요청 
	@RequestMapping(value="/moviecart/regist",method=RequestMethod.GET)
	@ResponseBody
	public ModelAndView registCart(Mcart mcart,HttpSession session) {
		 if(session.getAttribute("member")==null) {
			 logger.debug("넘어온 영화movie_id는"+ mcart.getMovie_id());
			   throw new McartException("로그인이 필요한 서비스입니다");
		   } //로그인이 안되있으면 exceptioin으로 보내기
		
		Member member=(Member)session.getAttribute("member");

		logger.debug("영화 movie_id 는 "+mcart.getMovie_id());
		logger.debug("로그인한 member_id 는 "+member.getMember_id());
		mcart.setMember_id(member.getMember_id());  
		mcartService.insert(mcart);
		
		//messageConvert에 의해 vo는 json형태로 응답될수 있다. 
		//페이지 하나를 건너서 alert를 뿌리고 /client/movie/reservation uri로 보내줘야할듯!
		MessageData messageData = new MessageData();
		messageData.setResultCode(1);
		messageData.setMsg("영화 찜 완료");
		messageData.setUrl("/client/movie/reservation");
		
		ModelAndView mav=new ModelAndView("client/movie/mcartsuccess");
		mav.addObject("messageData",messageData);
		
		return mav;
	}
	
	
	

	//영화 장바구니 관련된 예외처리 핸들러
	@ExceptionHandler(McartException.class)
	public ModelAndView handleException(McartException e) {
		MessageData messageData = new MessageData();
		messageData.setResultCode(0);
		messageData.setMsg(e.getMessage());
		messageData.setUrl("/client/movie/list"); //error페이지한테 최소한 정보들은 담아서 보내주자
		
		ModelAndView mav=new ModelAndView("client/error/error");//exception 처리는 error페이지한테 맡겨버리자
		mav.addObject("messageData",messageData); 
		return mav;
	}
}











