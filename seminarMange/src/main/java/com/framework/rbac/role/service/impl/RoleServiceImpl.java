package com.framework.rbac.role.service.impl;

import com.framework.commons.exception.ServiceException;
import com.framework.rbac.role.mapper.RoleMapper;
import com.framework.rbac.role.model.Role;
import com.framework.rbac.role.service.RoleService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * (sys_role)表服务实现类
 *
 * @author pangsir
 * @since 2020-08-01 13:06:29
 */
@Service
public class RoleServiceImpl implements RoleService {
	@Autowired
	private RoleMapper roleMapper;

	@Override
	public Role load(Integer roleId) {
		return this.roleMapper.load(roleId);
	}

	@Override
	public List<Role> list() {
		return this.roleMapper.list();
	}

	@Override
	public int getRoleKeyCount(String roleKey) {
		return this.roleMapper.getRoleKeyCount(roleKey);
	}

	@Override
	public void add(Role role) {
		try {
			this.roleMapper.add(role);
		} catch (Exception e) {
			throw new ServiceException("新建系统角色失败");
		}
	}

	@Override
	public void update(Role role) {
		this.roleMapper.update(role);
	}

	@Override
	public void delete(Integer roleId) {
		this.roleMapper.delete(roleId);
	}

	@Override
	public void updatePermission(Integer roleId, Integer[] menus) {
		try{
			this.roleMapper.updatePermission(roleId,menus);
		}catch (Exception e){
			e.printStackTrace();
			throw new ServiceException("角色授权菜单失败");
		}
	}
}