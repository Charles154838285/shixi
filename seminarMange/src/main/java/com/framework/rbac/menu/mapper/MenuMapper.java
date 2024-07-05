package com.framework.rbac.menu.mapper;

import com.framework.rbac.menu.model.Menu;
import com.framework.rbac.menu.model.MenuNode;
import org.springframework.stereotype.Repository;

import java.util.List;

/**
 * (sys_menu)表数据库访问层
 *
 * @author pangsir
 * @since 2020-07-31 15:19:52
 */
@Repository
public interface MenuMapper {
	List<Menu> getLeftNavList(Integer roleId);
	List<Menu> getSelectedMenuList(Integer roleId);
	List<Menu> getUnSelectedMenuList(Integer roleId);
	List<Menu> getParentMenuList();
	List<MenuNode> geTreeParentNodeList();

	Menu load(Integer menuId);
	List<Menu> list();
	void add(Menu menu);
	void update(Menu menu);
	void delete(Menu menu);

}