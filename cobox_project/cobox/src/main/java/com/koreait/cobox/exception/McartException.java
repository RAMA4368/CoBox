package com.koreait.cobox.exception;

public class McartException extends RuntimeException{
	public McartException(String msg) {
		super(msg);
	}
	public McartException(String msg, Throwable e) {
		super(msg, e);
	}
}
