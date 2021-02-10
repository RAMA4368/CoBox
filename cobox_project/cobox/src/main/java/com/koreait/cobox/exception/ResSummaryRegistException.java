package com.koreait.cobox.exception;

public class ResSummaryRegistException extends RuntimeException{
	public ResSummaryRegistException(String msg) {
		super(msg);
	}
	public ResSummaryRegistException(String msg, Throwable e) {
		super(msg, e);
	}
}
