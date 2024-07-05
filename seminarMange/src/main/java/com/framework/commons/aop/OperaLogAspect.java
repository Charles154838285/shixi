package com.framework.commons.aop;

import com.fasterxml.jackson.annotation.JsonInclude;
import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.framework.commons.annotation.OperaLog;
import com.framework.rbac.log.model.Log;
import com.framework.rbac.log.service.LogService;
import com.framework.rbac.user.model.SessionUser;
import org.aspectj.lang.JoinPoint;
import org.aspectj.lang.Signature;
import org.aspectj.lang.annotation.AfterReturning;
import org.aspectj.lang.annotation.Aspect;
import org.aspectj.lang.annotation.Pointcut;
import org.aspectj.lang.reflect.MethodSignature;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.web.context.request.RequestContextHolder;
import org.springframework.web.context.request.ServletRequestAttributes;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.lang.reflect.Method;
import java.util.Date;

@Component
@Aspect
public class OperaLogAspect {
	@Autowired
	private LogService logService;

	@Pointcut("@annotation(com.framework.commons.annotation.OperaLog)")
	public void operaLogPointCut(){}

	@AfterReturning("operaLogPointCut()")
	public void afterReturnAdivce(JoinPoint joinPoint) throws JsonProcessingException {
		//存储数据：日志对象
		Log myLog = new Log();
		//获取方法对象
		MethodSignature signature = (MethodSignature)joinPoint.getSignature();
		Method method = signature.getMethod();
		//1.存储：操作的方法
		myLog.setMethod(joinPoint.getTarget().getClass().getName()+"."+method.getName());
		//2.存储：参数信息
		Object[] args = joinPoint.getArgs();
		if(args!=null&&args.length>0){
			ObjectMapper objectMapper = new ObjectMapper();
			objectMapper.setSerializationInclusion(JsonInclude.Include.NON_EMPTY);

			myLog.setParams(objectMapper.writeValueAsString(args));
		}
		//3.存储：执行时间
		myLog.setCreateDate(new Date());
		//4.存储：日志的描述
		OperaLog operaLogAnnotation = method.getDeclaredAnnotation(OperaLog.class);
		if(operaLogAnnotation!=null){
			myLog.setName(operaLogAnnotation.value());
		}
		//5.存储：用户的客户IP地址
		HttpServletRequest request = ((ServletRequestAttributes)RequestContextHolder.getRequestAttributes()).getRequest();
		myLog.setIp(request.getRemoteAddr());
		//6.存储：登录的账号信息
		HttpSession session = request.getSession();
		SessionUser sessionUser = (SessionUser)session.getAttribute("session_user");
		myLog.setAccount(sessionUser.getAccount());
		//保存操作
		logService.add(myLog);


	}
}
