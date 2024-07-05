package com.framework.rbac.user.model;

import lombok.Data;

import java.io.Serializable;
@Data
public class SessionUser implements Serializable {
	private Integer userId;
	private String account;
}
