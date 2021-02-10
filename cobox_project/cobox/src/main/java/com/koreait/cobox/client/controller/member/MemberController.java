package com.koreait.cobox.client.controller.member;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.koreait.cobox.exception.MemberNotFoundException;
import com.koreait.cobox.exception.MemberRegistException;
import com.koreait.cobox.model.common.MessageData;
import com.koreait.cobox.model.domain.Member;
import com.koreait.cobox.model.member.service.MemberService;

@Controller
public class MemberController {
	private static final Logger logger=LoggerFactory.getLogger(MemberController.class);

	@Autowired
	private MemberService memberService;
		
	//회원가입폼 요청 
	@RequestMapping(value="/member/join", method=RequestMethod.GET)
	public ModelAndView getRegistForm(HttpServletRequest request) {
		ModelAndView mav = new ModelAndView("client/member/join");
		return mav;	
	}

	//회원가입폼 정보(insert)
	@RequestMapping(value="/member/regist", method=RequestMethod.POST, produces="text/html;charset=utf-8")
	@ResponseBody
	public String regist(Member member) {
		
		logger.debug("아이디 "+member.getMid());
		logger.debug("비밀번호 "+member.getPassword());
		logger.debug("이름 "+member.getName());
		logger.debug("생년월일"+member.getBirth());
		logger.debug("이메일id "+member.getEmail_id());
		logger.debug("이메일server "+member.getEmail_server());
		logger.debug("핸드폰번호 "+member.getPhone());
		
		memberService.insert(member);

		StringBuffer sb = new StringBuffer();
		sb.append("{");
		sb.append(" \"result\":1, ");
		sb.append(" \"msg\":\"회원가입 성공\"");
		sb.append("}");
		
		return sb.toString();
	} 
	
	//로그인 홈 요청 
	@RequestMapping(value="/member/formtable", method=RequestMethod.GET)
	public ModelAndView getLoginForm() {
		ModelAndView mav = new ModelAndView("client/member/login");
		
		return mav;
	}
	
	//로그인 요청 처리(select)
	@RequestMapping(value="/member/login", method=RequestMethod.POST)
	public String login(Member member, HttpServletRequest request) throws MemberNotFoundException{
		//db에 존재여부 확인 
				Member obj=memberService.select(member);
				
				//존재 O : 세션에 회원정보 담아두기
				HttpSession session=request.getSession();
				session.setAttribute("member", obj); //현재 클라이언트 요청과 연계된 세션에 보관해 놓는다
				
				return "redirect:/client/main";
	}

	
	//로그아웃 요청 처리 
	@RequestMapping(value="/member/logout", method=RequestMethod.GET)
	public ModelAndView logout(HttpServletRequest request) {
		
		request.getSession().invalidate(); //세션 무효화, 이시점부터 담겨진 데이터가 다 무효가 된다
		MessageData messageData = new MessageData();
		messageData.setResultCode(1);
		messageData.setMsg("로그아웃 되었습니다");
		messageData.setUrl("/client/main");
	//로그아웃 메세지 요청 
		ModelAndView mav=new ModelAndView("client/error/error");
		mav.addObject("messageData",messageData);
		return mav;
	}

	
	//예외 핸들러 2가지 처리
	@ExceptionHandler(MemberRegistException.class)
	@ResponseBody
	public String handleException(MemberRegistException e) {
		StringBuffer sb = new StringBuffer();
		sb.append("{");
		sb.append(" \"result\":0, ");
		sb.append(" \"msg\":\""+e.getMessage()+"\"");
		sb.append("}");
		
		return sb.toString();
	}
	//가입된 정보가 없을경우
	@ExceptionHandler(MemberNotFoundException.class)
	public ModelAndView handleException(MemberNotFoundException e) {
		ModelAndView mav=new ModelAndView();
		mav.addObject("msg",e.getMessage());
		mav.setViewName("client/error/result");
		
		return mav;
	}


}
