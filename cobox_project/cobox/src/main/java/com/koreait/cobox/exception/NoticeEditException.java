package com.koreait.cobox.exception;

public class NoticeEditException extends RuntimeException{
	public NoticeEditException(String msg) {
		super(msg);
	}
	public NoticeEditException(String msg, Throwable e) {
		super(msg, e);
	}
}
