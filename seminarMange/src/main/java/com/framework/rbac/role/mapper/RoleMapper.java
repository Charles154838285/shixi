package com.framework.rbac.role.mapper;

import com.framework.rbac.role.model.Role;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import java.util.List;

/**
 * (sys_role)表数据库访问层
 *
 * @author pangsir
 * @since 2020-08-01 13:06:27
 */
@Repository
public interface RoleMapper {
	Role load(Integer roleId);

	List<Role> list();

	int getRoleKeyCount(String roleKey);

	void add(Role role);

	void update(Role role);

	void delete(Integer roleId);

	void updatePermission(@Param("roleId") Integer roleId,@Param("menus") Integer[] menus);

}