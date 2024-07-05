package com.framework.rbac.menu.service;

import com.framework.rbac.menu.model.Menu;
import com.framework.rbac.menu.model.MenuNode;

import java.util.List;

/**
 * (sys_menu)业务逻辑层
 *
 * @author pangsir
 * @since 2020-07-31 15:19:52
 */
public interface MenuService {
	List<Menu> getLeftNavList(Integer roleId);
	List<Menu> getSelectedMenuList(Integer roleId);
	List<Menu> getUnSelectedMenuList(Integer roleId);
	List<Menu> getParentMenuList();
	List<MenuNode> geTreeParentNodeList();
	Menu load(Integer menuId);

	List<Menu> list();

	void add(Menu menu);

	void update(Menu menu);

	void delete(Integer menuId);

}