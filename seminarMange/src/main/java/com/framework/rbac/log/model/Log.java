package com.framework.rbac.log.model;

import lombok.Data;

import java.io.Serializable;
import java.util.Date;

@Data
public class Log implements Serializable {
	private static final long serialVersionUID = -68408180736180056L;
	private String id;
	private String name;
	private String account;
	private String ip;
	private String method;
	private String params;
	private Date createDate;
}