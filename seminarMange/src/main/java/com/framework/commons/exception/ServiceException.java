package com.framework.commons.exception;

public class ServiceException extends RuntimeException {
	private int code = 5001;//默认为业务逻辑层错误代码
	public ServiceException(String message, int code) {
		super(message);
		this.code = code;
	}
	public ServiceException(String message) {
		super(message);
	}
	public int getCode() {
		return code;
	}
}
