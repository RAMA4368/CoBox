package com.koreait.cobox.client.controller.cartpay;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.koreait.cobox.exception.CartException;
import com.koreait.cobox.exception.LoginRequiredException;
import com.koreait.cobox.model.cartpay.service.CartPayService;
import com.koreait.cobox.model.common.MessageData;
import com.koreait.cobox.model.domain.Cart;
import com.koreait.cobox.model.domain.Member;

@Controller
public class CartPayController {
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
	
	//장바구니 목록
	@RequestMapping(value="/cart/list", method=RequestMethod.GET)	
	public ModelAndView getCartList(HttpServletRequest request) {
		HttpSession session = request.getSession();
		Member member = (Member)session.getAttribute("member");
		
		List cartList = cartPayService.selectCartList(member.getMember_id());
		
		ModelAndView mav = new ModelAndView("client/cart/list");
		mav.addObject("cartList", cartList);
		return mav;
	}
	
	//장바구니 비우기
	@RequestMapping(value="/cart/del", method=RequestMethod.GET)
	public String delCart(HttpServletRequest request) {
		HttpSession session = request.getSession();
		
		cartPayService.delete((Member)session.getAttribute("member"));
		return "redirect:/client/cart/list";
	}
	
	//장바구니 수정
	@RequestMapping(value="/cart/edit", method=RequestMethod.POST)
	public ModelAndView editCart(HttpServletRequest request, @RequestParam("cart_id") int[] cartArray, @RequestParam("quantity") int[] qArray) {
		logger.debug("cartArray.length = "+cartArray.length);
		logger.debug("qArray.length = "+qArray.length);
		
		List cartList = new ArrayList();
		for(int i=0; i<cartArray.length; i++) {	//어차피 cart,quantity 길이 같으므로 아무거나로 반복문 돌림
			Cart cart = new Cart();
			cart.setCart_id(cartArray[i]);
			cart.setQuantity(qArray[i]);
			cartList.add(cart);
		}
		cartPayService.update(cartList);
		
		MessageData messageData = new MessageData();
		messageData.setResultCode(1);
		messageData.setMsg("장바구니가 수정되었습니다");
		messageData.setUrl("/client/cart/list");
		ModelAndView mav = new ModelAndView();
		mav.addObject("messageData", messageData);
		mav.setViewName("client/error/message");
		
		return mav;
	}
	
	//체크아웃
	@RequestMapping(value="/checkout/form", method=RequestMethod.GET)
	public String checkoutForm(Model model, HttpServletRequest request) {
		HttpSession session = request.getSession();
		
		Member member = (Member)session.getAttribute("member");
		List cartList = cartPayService.selectCartList(member.getMember_id());
		model.addAttribute("cartList", cartList);
		
		//결제수단
		List paymethodList = cartPayService.selectPaymethodList();
		model.addAttribute("paymethodList", paymethodList);
		
		return "client/cart/checkout";
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

	
}
