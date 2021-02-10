package com.koreait.cobox.exception;

public class NoticeDeleteException extends RuntimeException{
	public NoticeDeleteException(String msg) {
		super(msg);
	}
	public NoticeDeleteException(String msg, Throwable e) {
		super(msg, e);
	}
}
