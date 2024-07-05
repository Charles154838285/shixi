package com.framework.rbac.menu.service.impl;

import com.framework.commons.annotation.OperaLog;
import com.framework.commons.exception.ServiceException;
import com.framework.rbac.menu.mapper.MenuMapper;
import com.framework.rbac.menu.model.Menu;
import com.framework.rbac.menu.model.MenuNode;
import com.framework.rbac.menu.service.MenuService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * (sys_menu)表服务实现类
 *
 * @author pangsir
 * @since 2020-07-31 15:19:53
 */
@Service
public class MenuServiceImpl implements MenuService {
	@Autowired
	private MenuMapper menuMapper;

	@Override
	public List<Menu> getLeftNavList(Integer roleId) {
		return this.menuMapper.getLeftNavList(roleId);
	}

	@Override
	public List<Menu> getSelectedMenuList(Integer roleId) {
		return this.menuMapper.getSelectedMenuList(roleId);
	}

	@Override
	public List<Menu> getUnSelectedMenuList(Integer roleId) {
		return this.menuMapper.getUnSelectedMenuList(roleId);
	}

	@Override
	public List<Menu> getParentMenuList() {
		return this.menuMapper.getParentMenuList();
	}

	@Override
	public List<MenuNode> geTreeParentNodeList() {
		return this.menuMapper.geTreeParentNodeList();
	}

	@Override
	public Menu load(Integer menuId) {
		return this.menuMapper.load(menuId);
	}

	@Override
	public List<Menu> list() {
		return this.menuMapper.list();
	}

	@OperaLog("菜单管理-新建节点")
	@Override
	public void add(Menu menu) {
		try {
			this.menuMapper.add(menu);
		} catch (Exception e) {
			throw new ServiceException("新建节点失败");
		}
	}
	@OperaLog("菜单管理-更新节点")
	@Override
	public void update(Menu menu) {
		try {
			this.menuMapper.update(menu);
		} catch (Exception e) {
			throw new ServiceException("更新节点失败");
		}
	}
	@OperaLog("菜单管理-删除节点")
	@Override
	public void delete(Integer menuId) {
		try {
			this.menuMapper.delete(this.menuMapper.load(menuId));
		} catch (Exception e) {
			throw new ServiceException("删除节点失败");
		}
	}
}