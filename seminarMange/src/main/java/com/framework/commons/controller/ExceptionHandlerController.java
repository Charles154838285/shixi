package com.framework.commons.controller;


import com.framework.commons.exception.RepetitionException;
import com.framework.commons.exception.ServiceException;
import com.framework.commons.model.R;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.RestControllerAdvice;


/**
 * 返回的异常信息：JSON格式的数据
 */
@RestControllerAdvice//@Controller+@ResponseBody
public class ExceptionHandlerController {
	@ExceptionHandler(ServiceException.class)
	public R handlerException(ServiceException ex){
		return R.error(ex.getCode(),ex.getMessage());
	}
	@ExceptionHandler(RepetitionException.class)
	public R handlerException(RepetitionException ex){
		return R.error("数据库中已经存在该条记录");
	}
	//可以再定义其他的异常处理
	@ExceptionHandler(Exception.class)
	public Exception handlerException(Exception ex){

		//return R.error(ex.getMessage());
		return ex;
	}
}
