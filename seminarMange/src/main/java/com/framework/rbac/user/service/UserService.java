package com.framework.rbac.user.service;

import com.framework.commons.model.Page;
import com.framework.rbac.user.model.SessionUser;
import com.framework.rbac.user.model.User;
import org.apache.ibatis.annotations.Param;

import java.util.List;

/**
 * (sys_user)业务逻辑层
 *
 * @author pangsir
 * @since 2020-07-31 13:33:26
 */
public interface UserService {
	SessionUser login(String account,String password);
	User load(Integer userId);
	Page<User> find(Page<User> page);
	int getAccountCount(String account);
	void add(User user);
	void update(User user);
	void delete(Integer userId);
	void updateUserRole(Integer roleId, Integer userId);
	int getUserPasswordCount(Integer userId,String password);

}