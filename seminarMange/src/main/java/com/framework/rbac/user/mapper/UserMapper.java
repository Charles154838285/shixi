package com.framework.rbac.user.mapper;

import com.framework.commons.model.Page;
import com.framework.rbac.user.model.SessionUser;
import com.framework.rbac.user.model.User;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import java.util.List;

/**
 * (sys_user)表数据库访问层
 *
 * @author pangsir
 * @since 2020-07-31 13:33:25
 */
@Repository
public interface UserMapper {

	SessionUser login(@Param("account")String account,@Param("password")String password);

	User load(Integer userId);

	List<User> getUserList(Page<User> page);
	int getTotalCount(Page<User> page);
	int getAccountCount(String account);
	void add(User user);

	void update(User user);

	void delete(Integer userId);

	void updateUserRole(@Param("roleId")Integer roleId,@Param("userId")Integer userId);

	int getUserPasswordCount(@Param("userId")Integer userId,@Param("password")String password);
}