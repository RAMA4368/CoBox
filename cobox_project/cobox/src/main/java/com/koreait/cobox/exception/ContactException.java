package com.koreait.cobox.exception;

public class ContactException extends RuntimeException{
	public ContactException(String msg) {
		super(msg);
	}
	public ContactException(String msg, Throwable e) {
		super(msg, e);
	}
}
