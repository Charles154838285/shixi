package com.framework.rbac.role.model;

import lombok.Data;

import java.io.Serializable;

@Data
public class Role implements Serializable {
	private static final long serialVersionUID = -54781352754465836L;
	private Integer roleId;
	private String roleName;
	private String roleKey;
	private String remark;
}