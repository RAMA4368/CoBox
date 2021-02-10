package com.koreait.cobox.admin.controller;

import java.util.List;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.context.ServletContextAware;
import org.springframework.web.servlet.ModelAndView;

import com.koreait.cobox.exception.SnackRegistException;
import com.koreait.cobox.model.common.FileManager;
import com.koreait.cobox.model.common.MessageData;
import com.koreait.cobox.model.common.Pager;
import com.koreait.cobox.model.domain.Snack;
import com.koreait.cobox.model.domain.TopCategory;
import com.koreait.cobox.model.snack.service.SnackService;
import com.koreait.cobox.model.snack.service.TopCategoryService;

//관리자 모드에서의 스낵 관리
@Controller
public class AdminSnackController implements ServletContextAware{
	private static final Logger logger = LoggerFactory.getLogger(AdminSnackController.class);
	
	@Autowired
	private TopCategoryService topCategoryService;
	
	@Autowired
	private SnackService snackService;
	
	@Autowired
	private Pager pager;
	
	@Autowired
	private FileManager fileManager;
	
	private ServletContext servletContext;
	
	@Override
	public void setServletContext(ServletContext servletContext) {
		this.servletContext = servletContext;
		
		fileManager.setSaveSnackDir(fileManager.getSaveSnackDir());
		fileManager.setSaveMovieDir(fileManager.getSaveMovieDir());
		fileManager.setSaveExcelDir(fileManager.getSaveExcelDir());
		
	}
	
	//스낵목록
	@RequestMapping(value="/snack/list", method=RequestMethod.GET)
	public ModelAndView getSnackList(HttpServletRequest request) {
		ModelAndView mav = new ModelAndView("admin/snack/snack_list");
		
		List snackList = snackService.selectAll();
		pager.init(request, snackList);
		mav.addObject("pager", pager);
		
		return mav;
	}
	
	//스낵등록폼
	@RequestMapping(value="/snack/registform")
	public String registForm() {
		return "admin/snack/snack_registForm";
	}
	
	//스낵등록
	@RequestMapping(value="/snack/regist", method=RequestMethod.POST, produces="text/html;charset=utf8")
	@ResponseBody
	public String registSnack(HttpServletRequest request, Snack snack) {
		//logger.debug("탑카테고리"+snack.getTopCategory().getTopcategory_id());
		logger.debug("스낵명"+snack.getSnack_name());
		logger.debug("가격"+snack.getPrice());
		logger.debug("수량"+snack.getAmount());
		logger.debug("상품정보"+snack.getDetail());
		
		snackService.regist(fileManager, snack);
		
		StringBuilder sb = new StringBuilder();
		sb.append("{");
		sb.append("\"result\":1,");
		sb.append("\"msg\":\"상품등록 성공\"");
		sb.append("}");
		
		return sb.toString();
	}
	
	//카테고리 가져오기
	@RequestMapping(value="/snack/registform", method=RequestMethod.GET)
	public ModelAndView getCategory(HttpServletRequest request) {
		List topList = topCategoryService.selectAll();
		
		ModelAndView mav = new ModelAndView();
		mav.addObject("topList", topList);
		mav.setViewName("admin/snack/snack_registForm");
		return mav;
	}
	
	@RequestMapping(value="/snack/snackmanager", method=RequestMethod.GET)
	public ModelAndView editCategory(HttpServletRequest request) {
		List topList = topCategoryService.selectAll();
		//List subList = snackService.selectById(topcategory_id);
		
		ModelAndView mav = new ModelAndView();
		mav.addObject("topList", topList);
		//mav.addObject("subList", subList);
		mav.setViewName("admin/snack/snack_manager");
		return mav;
	}

	
	//topcategory선택하면 그에 맞는 카테고리 가져오기
	/*
	@RequestMapping(value="/admin/snack/sublist", method=RequestMethod.GET)
	@ResponseBody
	public List getSubList(int topcategory_id) {
		List subList = snackService.selectById(topcategory_id);
		return subList;
	}
	 */
	
	@RequestMapping(value="/snack/sublist", method=RequestMethod.GET, produces="application/json;charset=utf8")
	@ResponseBody
	public List getSubList(HttpServletRequest request, int topcategory_id) {
		List<Snack> subList = snackService.selectById(topcategory_id);
		//select * from snack where topcategory_id=?
		
		return subList;
	}
	
	@RequestMapping(value="/snack/detail", method =RequestMethod.GET, produces="application/json;charset=utf8")
	@ResponseBody
	public Snack getDetailList(HttpServletRequest request, int snack_id) {
		logger.debug("snack_id"+snack_id);
		Snack snack = snackService.select(snack_id);
		
		return snack;
	}
	
	//스낵 삭제
	@RequestMapping(value="/snack/del", method=RequestMethod.GET)
	public String delSnack(HttpServletRequest request, int snack_id) {
		logger.debug("snack_id="+snack_id);
		snackService.delete(snack_id);

		
		return "redirect:/admin/snack/list";
	}
	
	//스낵 수정
	@RequestMapping(value="/snack/edit", method=RequestMethod.POST)
	public ModelAndView updateSnack(HttpServletRequest request, Snack snack) {
		snackService.update(fileManager, snack);
		
		
		MessageData messageData = new MessageData();
		messageData.setResultCode(1);
		messageData.setMsg("스낵이 수정되었습니다");
		messageData.setUrl("/admin/snack/detailList");
		
		ModelAndView mav = new ModelAndView();
		mav.addObject("messageData", messageData);
		mav.setViewName("client/error/message");
		
		return mav;
	}
	
	//상세보기
	@RequestMapping(value="/snack/detailList", method=RequestMethod.GET)
	public ModelAndView getSnackDetailList(HttpServletRequest request, int snack_id) {
		Snack snack = snackService.select(snack_id);
		ModelAndView mav = new ModelAndView();
		List topList = topCategoryService.selectAll();
		mav.addObject("snack", snack);
		mav.addObject("topList", topList);
		mav.setViewName("admin/snack/snack_detail");
		return mav;
	}
	
	//예외처리 핸들러
	@ExceptionHandler(SnackRegistException.class)
	@ResponseBody
	public String handleException(SnackRegistException e) {
		StringBuilder sb = new StringBuilder();
		sb.append("{");
		sb.append("\"result\":0");
		sb.append("\"msg\":\""+e.getMessage()+"\"");
		sb.append("}");
		return sb.toString();
	}
	
}
