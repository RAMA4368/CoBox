package com.koreait.cobox.client.aop;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.aspectj.lang.ProceedingJoinPoint;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Component;

import com.koreait.cobox.exception.LoginRequiredException;

@Component
public class MemberSessionCheckAspect {
	private static final Logger logger = LoggerFactory.getLogger(MemberSessionCheckAspect.class);

	public Object sessionCheck(ProceedingJoinPoint joinPoint) throws Throwable{
		Object target = joinPoint.getTarget();
		String methodName = joinPoint.getSignature().getName();
		Object[] args = joinPoint.getArgs();
		
		HttpServletRequest request = null;
		
		for(Object arg : args) {
			if(arg instanceof HttpServletRequest) {
				request = (HttpServletRequest)arg;
			}
		}
		
		HttpSession session = null;
		session = request.getSession();
		Object result = null;
		
		if(session.getAttribute("member")==null) {
			throw new LoginRequiredException("로그인이 필요한 서비스입니다");
		}else {
			result = joinPoint.proceed();
		}
		
		return result;
	}

}
