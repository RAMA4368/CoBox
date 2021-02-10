package com.koreait.cobox.client.controller.notice;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.koreait.cobox.exception.ContactException;
import com.koreait.cobox.exception.NoticeEditException;
import com.koreait.cobox.exception.NoticeRegistException;
import com.koreait.cobox.model.common.MailSender;
import com.koreait.cobox.model.common.MessageData;
import com.koreait.cobox.model.common.Pager;
import com.koreait.cobox.model.domain.Division;
import com.koreait.cobox.model.domain.Notice;
import com.koreait.cobox.model.notice.service.DivisionService;
import com.koreait.cobox.model.notice.service.NoticeService;

@Controller
public class NoticeController {
	private static final Logger logger = LoggerFactory.getLogger(NoticeController.class);
	
	@Autowired
	private NoticeService noticeService;
	
	@Autowired
	private DivisionService divisionService;
	
	//메일발송객체 
	@Autowired
	private MailSender mailSender;
	
	//페이징처리 
	@Autowired
	private Pager pager;
	
	/********************************************************
	 영화관 프론트 요청 처리 
	********************************************************/
	//비동기 구분리스트 가져오기 
	@RequestMapping(value = "/notice/divisionlist", method = RequestMethod.GET)
	@ResponseBody
	public List<Division> getDivisionListByAjax(){
		List<Division>  divisionList = divisionService.selectAll();
		return divisionList;
	}

	//공지 리스트 보기 
	@RequestMapping(value = "/notice/list", method = RequestMethod.GET)
	public ModelAndView getCinemaNotice(HttpServletRequest request) {
		ModelAndView mav = new ModelAndView();

		List<Notice> noticeList = noticeService.selectAll();
		pager.init(request, noticeList);
		mav.addObject("pager",pager);
		mav.setViewName("client/notice/noticelist");
		return mav;
	}
	 //구분id 에 따른 공지리스트 보기
	 @RequestMapping(value = "/notice/listByDivision", method = RequestMethod.GET)
	 public ModelAndView getCinemaNoticeByDivision(HttpServletRequest request, int division_id) { 
		 logger.debug("division_id 는????" + division_id);
		 List<Notice> noticeList = noticeService.selectAllById(division_id); 
		 
		 ModelAndView mav = new ModelAndView(); 
		 pager.init(request, noticeList);
		 mav.addObject("pager",pager);
		 //logger.debug("dname은??????" + noticeList.get(1).getDivision().getDname());
		 mav.setViewName("client/notice/noticelist");
		 return mav; 
	 }


	//공지 상세보기 요청 + 조회수 증가 
	@RequestMapping(value = "/notice/noticedetail", method = RequestMethod.GET)
	public ModelAndView getCinemaNoticeDetail(int notice_id) {
		ModelAndView mav = new ModelAndView();
		Notice notice = noticeService.select(notice_id);
		mav.addObject("notice", notice);
		mav.setViewName("client/notice/noticedetail");
		noticeService.noticeHit(notice.getNotice_id());
		return mav;
	}
	
	//1:1문의 메일폼 불러오기  
	@RequestMapping(value = "/contact/contactform", method = RequestMethod.GET)
	public String getContactForm() {
		return "client/contact/contact_form";
	}
	
	//1:1 메일 보내기 
	@RequestMapping(value = "/contact/sendmail", method = RequestMethod.POST)
	public ModelAndView sendMail(HttpServletRequest request, String uname, String uemail, String umessage) {
		/*
		String name = request.getParameter("uname");
		String email = request.getParameter("uemail");
		String message = request.getParameter("umessage");
		*/
		logger.debug("받아온 이름은 ? " + uname);
		logger.debug("받아온 메일은 ? " + uemail);
		logger.debug("받아온 내용은 ? " + umessage);
		
		mailSender.send(uemail, uname, umessage);
		
		MessageData messageData = new MessageData();
		messageData.setResultCode(1);
		messageData.setMsg("문의사항 전송이 완료되었습니다.");
		messageData.setUrl("/client/contact/contactform");
		
		ModelAndView mav = new ModelAndView("client/error/message");
		mav.addObject("messageData", messageData);
		return mav;
	}
	
	//게시판 예외처리 핸들러
	@ExceptionHandler(ContactException.class)
	public MessageData hadleException(ContactException e) {
		MessageData messageData = new MessageData();
		messageData.setResultCode(0);
		messageData.setMsg(e.getMessage());
		
		return messageData;
	}
	
	@ExceptionHandler(NoticeEditException.class)
	public MessageData hadleException(NoticeEditException e) {
		MessageData messageData = new MessageData();
		messageData.setResultCode(0);
		messageData.setMsg(e.getMessage());
		
		return messageData;
	}
}

