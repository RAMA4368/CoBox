package com.koreait.cobox.exception;

public class SnackRegistException extends RuntimeException{

	public SnackRegistException(String msg) {
		super(msg);
	}
	public SnackRegistException(String msg, Throwable e) {
		super(msg, e);
	}
}
