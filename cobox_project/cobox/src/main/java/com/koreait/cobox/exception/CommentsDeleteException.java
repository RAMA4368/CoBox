package com.koreait.cobox.exception;

public class CommentsDeleteException extends RuntimeException{
	public CommentsDeleteException(String msg) {
		super(msg);
	}
	public CommentsDeleteException(String msg,Throwable e) {
		super(msg,e);
	}

}
