package com.koreait.cobox.exception;

public class SnackDeleteFailException extends RuntimeException{

	public SnackDeleteFailException(String msg) {
		super(msg);
	}
	public SnackDeleteFailException(String msg, Throwable e) {
		super(msg, e);
	}
}
