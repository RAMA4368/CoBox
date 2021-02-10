package com.koreait.cobox.client.aop;

import org.springframework.web.bind.annotation.ControllerAdvice;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.koreait.cobox.exception.CartException;
import com.koreait.cobox.exception.LoginAsyncRequiredException;
import com.koreait.cobox.exception.LoginRequiredException;
import com.koreait.cobox.model.common.MessageData;

@ControllerAdvice
public class GlobalExceptionHandler {
	@ExceptionHandler(LoginRequiredException.class)
	@ResponseBody
	public ModelAndView handleException(LoginRequiredException e) {
		ModelAndView mav = new ModelAndView();
		
		MessageData messageData = new MessageData();
		messageData.setResultCode(0);
		messageData.setMsg(e.getMessage());
		mav.addObject("messageData", messageData);
		mav.setViewName("client/error/message");
		
		return mav;
	}


}
