package com.koreait.cobox.exception;

public class NoticeRegistException extends RuntimeException{
	public NoticeRegistException(String msg) {
		super(msg);
	}
	public NoticeRegistException(String msg, Throwable e) {
		super(msg, e);
	}
}
