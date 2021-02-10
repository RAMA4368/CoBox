package com.koreait.cobox.client.controller.mypage;

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
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.koreait.cobox.client.controller.member.MemberController;
import com.koreait.cobox.exception.DeleteFailException;
import com.koreait.cobox.exception.EditFailException;
import com.koreait.cobox.exception.MemberNotFoundException;
import com.koreait.cobox.model.domain.Member;
import com.koreait.cobox.model.member.service.MemberService;

@Controller
public class MypageController {

	private static final Logger logger = LoggerFactory.getLogger(MemberController.class);

	@Autowired
	private MemberService memberService;

	// mypage 메인화면 요청
	@RequestMapping(value = "/mypage", method = RequestMethod.GET)
	public ModelAndView getRegistForm(HttpServletRequest request) {
		ModelAndView mav = new ModelAndView("client/mypage/mypage_main");
		return mav;
	}

	// 회원정보 수정 폼 요청

	@RequestMapping(value = "/mypage/edit", method = RequestMethod.GET)
	public ModelAndView getEditForm(HttpServletRequest request) {
		ModelAndView mav = new ModelAndView("client/mypage/member_edit");
		return mav;
	}

	// 회원정보수정
	@RequestMapping(value = "/mypage/member_edit", method = RequestMethod.POST, produces = "text/html;charset=utf-8")
	@ResponseBody
	public String edit(HttpSession session, Member member){

		logger.debug("mid는" + member.getMid());
		logger.debug("password는" + member.getPassword());
		logger.debug("name은" + member.getName());
		logger.debug("birth는" + member.getBirth());
		logger.debug("email_id는" + member.getEmail_id());
		logger.debug("email_server는" + member.getEmail_server());
		logger.debug("phone은" + member.getPhone());

		memberService.update(member);

		session.invalidate();


		return "redirect:/client/main";
	}

	// 회원탈퇴 폼 요청
	@RequestMapping(value = "/mypage/delete", method = RequestMethod.GET)
	public ModelAndView getDeleteForm(HttpServletRequest request) {
		ModelAndView mav = new ModelAndView("client/mypage/member_delete");
		return mav;
	}

	// 회원 탈퇴(delete)
		@RequestMapping("/mypage/member_delete")
		public String Withdraw(HttpSession session, Member member, RedirectAttributes rttr) throws MemberNotFoundException {
		 
		 //탈퇴와 동시에 로그아웃시키기
		 session.invalidate();
		  
		 return "redirect:/client/main";
		}

		// mypage 티켓구매내역확인 요청
		   @RequestMapping(value = "/mypage/recepit_ticket", method = RequestMethod.GET)
		   public ModelAndView showticket(HttpServletRequest request) {
		      ModelAndView mav = new ModelAndView("client/mypage/recepit_ticket");
		      return mav;
		   }   
		      
		      
		   // mypage 스낵구매내역확인 요청
		   @RequestMapping(value = "/mypage/recepit_snack", method = RequestMethod.GET)
		   public ModelAndView showsnack(HttpServletRequest request) {
		      ModelAndView mav = new ModelAndView("client/mypage/recepit_snack");
		      return mav;
		   }   

		
	@ExceptionHandler(EditFailException.class)
	@ResponseBody
	public String editException(EditFailException e) {
		StringBuffer sb = new StringBuffer();
		sb.append("{");
		sb.append("result:0");
		sb.append("}");
		System.out.println("수정 요청실패" + sb);
		return sb.toString();
	}

	@ExceptionHandler(DeleteFailException.class)
	@ResponseBody
	public String deleteException(DeleteFailException e) {
		StringBuffer sb = new StringBuffer();
		sb.append("{");
		sb.append("result:0");
		sb.append("}");
		System.out.println("삭제실패" + sb);
		return sb.toString();
	}

}

