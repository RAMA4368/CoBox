package com.koreait.cobox.exception;

public class ReservationEditException extends RuntimeException{
	public ReservationEditException(String msg) {
		super(msg);
	}
	public ReservationEditException(String msg, Throwable e) {
		super(msg, e);
	}
}
