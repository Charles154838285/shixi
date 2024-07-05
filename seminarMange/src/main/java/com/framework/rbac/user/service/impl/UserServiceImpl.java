package com.framework.rbac.user.service.impl;

import com.framework.commons.exception.ServiceException;
import com.framework.commons.model.Page;
import com.framework.rbac.user.mapper.UserMapper;
import com.framework.rbac.user.model.SessionUser;
import com.framework.rbac.user.model.User;
import com.framework.rbac.user.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * (sys_user)表服务实现类
 *
 * @author pangsir
 * @since 2020-07-31 13:33:27
 */
@Service
public class UserServiceImpl implements UserService {
	@Autowired
	private UserMapper userMapper;

	@Override
	public SessionUser login(String account, String password) {
		SessionUser sessionUser = this.userMapper.login(account, password);
		if(sessionUser==null){
			throw new ServiceException("账号或者密码错误，请重新登录");
		}else{
			//获取状态信息
			User user = this.userMapper.load(sessionUser.getUserId());
			int status = user.getStatus();
			if(status!=1){
				throw new ServiceException("该账号无法登录，请联系系统管理人员!");
			}else{
				return sessionUser;
			}
		}

	}

	@Override
	public User load(Integer userId) {
		return this.userMapper.load(userId);
	}

	@Override
	public Page<User> find(Page<User> page) {
		page.setDatas(this.userMapper.getUserList(page));
		page.setTotalCount(this.userMapper.getTotalCount(page));
		return page;
	}

	@Override
	public int getAccountCount(String account) {
		return this.userMapper.getAccountCount(account);
	}
	@Override
	public void add(User user) {
		try {
			this.userMapper.add(user);
		} catch (Exception e) {
			e.printStackTrace();
			throw new ServiceException("新建用户信息失败");
		}
	}

	@Override
	public void update(User user) {
		this.userMapper.update(user);
	}

	@Override
	public void delete(Integer userId) {
		this.userMapper.delete(userId);
	}

	@Override
	public void updateUserRole(Integer roleId, Integer userId) {
		try {
			this.userMapper.updateUserRole(roleId,userId);
		} catch (Exception e) {
			throw new ServiceException("设置用户角色失败");
		}
	}

	@Override
	public int getUserPasswordCount(Integer userId, String password) {
		return this.userMapper.getUserPasswordCount(userId,password);
	}
}