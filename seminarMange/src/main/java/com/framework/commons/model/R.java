package com.framework.commons.model;

import java.util.HashMap;
import java.util.Map;

/**
 * 返回数据
 */
public class R extends HashMap<String,Object> {

	public R(){
		put("code",0);
		put("flag","success");//也可以使用boolean
	}

	public static R error(){
		return error(500,"未知异常，请联系系统管理员");
	}

	public static R error(String message){
		return error(500,message);
	}

	public static R error(int code,String message){
		R r = new R();
		r.put("code",code);
		r.put("flag","error");
		r.put("message",message);
		return r;
	}

	public static R ok(Map<String,Object> map){
		R r = new R();
		r.putAll(map);
		return r;
	}
	public static R ok(Object obj){
		R r = new R();
		r.put("datas",obj);
		return r;
	}
	public static R ok(String message){
		R r = new R();
		r.put("message",message);
		return r;
	}

	public static  R ok(){
		return new R();
	}

	@Override
	public R put(String key, Object value) {
		super.put(key, value);
		return this;
	}
}
