package com.framework.rbac.user.model;

import com.framework.rbac.role.model.Role;
import lombok.Data;

import java.io.Serializable;
import java.util.Date;

@Data
public class User implements Serializable {
	private static final long serialVersionUID = 761650507460535305L;
	private Integer userId;
	private String account;
	private String password;
	private String userName;
	private Integer status;
	private Date createDate;
	private Date loginDate;
	private String ipAddress;
	private String photo;
	private Integer roleId;

	private Role role;
}