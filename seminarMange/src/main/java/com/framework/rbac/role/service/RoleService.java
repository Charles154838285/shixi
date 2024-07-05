package com.framework.rbac.role.service;

import com.framework.rbac.role.model.Role;

import java.util.List;

/**
 * (sys_role)业务逻辑层
 *
 * @author pangsir
 * @since 2020-08-01 13:06:28
 */
public interface RoleService {
	Role load(Integer roleId);
	List<Role> list();
	int getRoleKeyCount(String roleKey);
	void add(Role role);
	void update(Role role);
	void delete(Integer roleId);
	void updatePermission(Integer roleId,Integer[] menus);

}