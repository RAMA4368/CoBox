package com.koreait.cobox.client.controller.cartpay;

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

import com.koreait.cobox.exception.CartException;
import com.koreait.cobox.exception.LoginAsyncRequiredException;
import com.koreait.cobox.exception.LoginRequiredException;
import com.koreait.cobox.model.cartpay.service.CartPayService;
import com.koreait.cobox.model.common.MessageData;
import com.koreait.cobox.model.domain.Cart;
import com.koreait.cobox.model.domain.Member;

@Controller
@RequestMapping(value="/async")
public class RestCartPayController {
private static final Logger logger = LoggerFactory.getLogger(CartPayController.class);
	
	@Autowired
	private CartPayService cartPayService;
	
	//장바구니에 담기
	@RequestMapping(value="/cart/regist", method=RequestMethod.POST)
	@ResponseBody
	public MessageData registCart(HttpServletRequest request, Cart cart) {
		HttpSession session = request.getSession();
		
		Member member = (Member)session.getAttribute("member");
		logger.debug("snack_id "+cart.getSnack_id());
		logger.debug("quantity "+cart.getQuantity());
		cart.setMember_id(member.getMember_id());	
		cartPayService.insert(cart);
		
		//json형태로 자동 convert !
		MessageData messageData = new MessageData();
		messageData.setResultCode(1);
		messageData.setMsg("장바구니에 상품이 담겼습니다");
		messageData.setUrl("/client/cart/list");
		
		return messageData;
	}
	
	//장바구니 관련 예외처리 핸들러
		@ExceptionHandler(CartException.class)
		@ResponseBody
		public MessageData handleException(CartException e) {
			MessageData messageData = new MessageData();
			messageData.setResultCode(0);
			messageData.setMsg(e.getMessage());
			
			return messageData;
		}
		
		@ExceptionHandler(LoginAsyncRequiredException.class)
		@ResponseBody
		public MessageData handleException(LoginAsyncRequiredException e) {
			MessageData messageData = new MessageData();
			messageData.setResultCode(0);
			messageData.setMsg(e.getMessage());
			
			return messageData;
		}
}
