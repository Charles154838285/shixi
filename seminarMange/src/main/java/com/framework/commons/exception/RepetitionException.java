package com.framework.commons.exception;

public class RepetitionException extends RuntimeException {
	private int code = 1001;//重复代码
	public RepetitionException(){}
	public RepetitionException(String message) {
		super(message);
	}
	public int getCode() {
		return code;
	}
}
