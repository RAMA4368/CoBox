package com.koreait.cobox.client.controller.snack;

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
import com.koreait.cobox.model.common.Pager;
import com.koreait.cobox.model.domain.Snack;
import com.koreait.cobox.model.domain.TopCategory;
import com.koreait.cobox.model.snack.service.SnackService;
import com.koreait.cobox.model.snack.service.TopCategoryService;


@Controller
public class SnackController implements ServletContextAware{
	private static final Logger logger = LoggerFactory.getLogger(SnackController.class);
	
	@Autowired
	private TopCategoryService topCategoryService;
	
	@Autowired
	private SnackService snackService;
	
	@Autowired
	private FileManager fileManager;
	
	@Autowired
	private Pager pager;
	
	private ServletContext servletContext;
	
	@Override
	public void setServletContext(ServletContext servletContext) {
		this.servletContext = servletContext;
		fileManager.setSaveSnackDir(servletContext.getRealPath(fileManager.getSaveSnackDir()));
		
		logger.debug(fileManager.getSaveSnackDir());
	}
	
	
	
	
	/* ***************** 프론트 ***************** */
	/*
	//탑카테고리아이디에 맞는 상품 가져오기(비동기)
	@RequestMapping(value="/client/snack/topcategory/list", method=RequestMethod.GET, produces="application/json;charset=utf8")
	@ResponseBody
	public List getSnackTopcategoryList(int topcategory_id) {
		List<Snack> subList = snackService.selectById(topcategory_id);
		return subList;
	}
	*/
	//탑카테고리아이디에 맞는 상품 가져오기(동기)
	@GetMapping(value="/snack/topcategory/list")
	public ModelAndView getSnackTopcategoryList(HttpServletRequest request, int topcategory_id) {
		ModelAndView mav = new ModelAndView("client/snack/snackpage");
		
		List snackList = snackService.selectById(topcategory_id);
		List topList = topCategoryService.selectAll();
		mav.addObject("snackList", snackList);
		mav.addObject("topList", topList);
		
		return mav;
	}
	
	
	
	//전체상품 가져오기
	@RequestMapping(value="/snack/list", method=RequestMethod.GET)
	public ModelAndView getClientSnackList(HttpServletRequest request) {
		ModelAndView mav = new ModelAndView("client/snack/snackpage");
		
		List topList = topCategoryService.selectAll();
		List snackList = snackService.selectAll();
		logger.debug("snackList 중 이름 "+snackList.size());
		//pager.init(request, snackList);
		
		
		mav.addObject("topList", topList);
		//mav.addObject("pager", pager);
		mav.addObject("snackList", snackList);
		
		return mav;
	}
	
	
	//상세보기
	/*
	@RequestMapping(value="/client/snack/detail", method=RequestMethod.GET)
	@ResponseBody
	public Snack getSnackDetail(int snack_id) {
		Snack snackDetailVO = snackService.select(snack_id);
		
		return snackDetailVO;
	}
	*/
	
	//상세보기
	@RequestMapping(value="/snack/detail", method=RequestMethod.GET)
	public ModelAndView snackDetail(HttpServletRequest request, int snack_id) {
		Snack snack = snackService.select(snack_id);
		
		ModelAndView mav = new ModelAndView("client/snack/detail");
		mav.addObject("snack", snack);
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
