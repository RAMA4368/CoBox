package com.koreait.cobox.exception;

public class SnackUpdateFailException extends RuntimeException{

	public SnackUpdateFailException(String msg) {
		super(msg);
	}
	public SnackUpdateFailException(String msg, Throwable e) {
		super(msg, e);
	}
}
