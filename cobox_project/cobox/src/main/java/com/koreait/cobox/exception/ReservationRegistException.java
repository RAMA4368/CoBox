package com.koreait.cobox.exception;

public class ReservationRegistException extends RuntimeException{
	public ReservationRegistException(String msg) {
		super(msg);
	}
	public ReservationRegistException(String msg, Throwable e) {
		super(msg, e);
	}
}
