package com.koreait.cobox.admin.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.koreait.cobox.exception.NoticeDeleteException;
import com.koreait.cobox.exception.NoticeEditException;
import com.koreait.cobox.exception.NoticeRegistException;
import com.koreait.cobox.model.common.Pager;
import com.koreait.cobox.model.domain.Division;
import com.koreait.cobox.model.domain.Notice;
import com.koreait.cobox.model.notice.service.DivisionService;
import com.koreait.cobox.model.notice.service.NoticeService;

@Controller
public class AdminNoticeController {
	private static final Logger logger = LoggerFactory.getLogger(AdminNoticeController.class);
	
	@Autowired
	private NoticeService noticeService;
	
	@Autowired
	private DivisionService divisionService;
	
	//페이징처리 
	@Autowired
	private Pager pager;
	
	
	//공지 등록폼 가져오기 
	@RequestMapping(value = "/notice/registform")
	public String getRegistForm() {
		return "admin/notice/regist_form";
	}
	
	
	//공지사항- 구분(division)값 가져오기 
	@RequestMapping(value = "/notice/registform", method = RequestMethod.GET)
	public ModelAndView getDivisionList() {
		List<Division> divisionList = divisionService.selectAll();
		
		ModelAndView mav = new ModelAndView();
		mav.addObject("divisionList", divisionList);
		mav.setViewName("admin/notice/regist_form");
		return mav;
	}

	
	//공지사항 전체 가져오기 
	@RequestMapping(value = "/notice/list", method = RequestMethod.GET)
	public ModelAndView selectAll(HttpServletRequest request) {
		ModelAndView mav = new ModelAndView();
		List<Notice> noticeList = noticeService.selectAll();
		pager.init(request, noticeList);
		mav.addObject("pager",pager);
		mav.setViewName("admin/notice/list");
		return mav;
	}
	
	//공지 한건 가져오기 (관리자가 보는것이므로 조회수증가 xxx)
	@RequestMapping(value = "/notice/detail", method = RequestMethod.GET)
	public ModelAndView select(int notice_id) {
		ModelAndView mav = new ModelAndView();
		Notice notice = noticeService.select(notice_id);
		logger.debug("디테일 "+notice.getNotice_id());
		mav.addObject("notice",notice);
		return mav;
	}
	
	//공지 등록하기 
	@RequestMapping(value = "/notice/regist", method = RequestMethod.POST)
	public String regist(Notice notice) {
		logger.debug("notice 내용은!!! "+notice.getContents());
		logger.debug("notice 제목은!!!"+notice.getTitle());
		logger.debug("notice 작성자는??"+notice.getWriter());
		logger.debug("notice 작성자는??"+notice.getDivision().getDivision_id());
		
		noticeService.insert(notice);
		return "redirect:/admin/notice/list";
	}
	
	//공지 수정하기 POST
	@RequestMapping(value = "/notice/edit", method = RequestMethod.POST)
	public String update(Notice notice) {
		logger.debug(""+notice.getNotice_id());
		noticeService.update(notice);
		return "redirect:/admin/notice/detail?notice_id="+notice.getNotice_id();
	}
	
	//공지 삭제하기 
	@RequestMapping(value = "/notice/del", method = RequestMethod.GET)
	public String delete(Notice notice) {
		noticeService.delete(notice);
		return "redirect:/admin/notice/list";
	}
	
	@ExceptionHandler(NoticeRegistException.class)
	public ModelAndView handleException(NoticeRegistException e) {
		ModelAndView mav = new ModelAndView();
		mav.addObject("msg",e.getMessage());
		//mav.setViewName("message/result"); //보여줄 페이지 
		return mav;
	}
	@ExceptionHandler(NoticeEditException.class)
	public ModelAndView handleException(NoticeEditException e) {
		ModelAndView mav = new ModelAndView();
		mav.addObject("msg",e.getMessage());
		//mav.setViewName("message/result"); //보여줄 페이지 
		return mav;
	}
	@ExceptionHandler(NoticeDeleteException.class)
	public ModelAndView handleException(NoticeDeleteException e) {
		ModelAndView mav = new ModelAndView();
		mav.addObject("msg",e.getMessage());
		//mav.setViewName("message/result"); //보여줄 페이지 
		return mav;
	}
}
