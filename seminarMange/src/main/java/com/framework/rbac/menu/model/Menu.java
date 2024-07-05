package com.framework.rbac.menu.model;

import lombok.Data;

import java.io.Serializable;
import java.util.List;

@Data
public class Menu implements Serializable {
	private static final long serialVersionUID = 293908917059733469L;
	private Integer menuId;
	private Integer parentId;
	private String menuName;
	private String icon;
	private String url;
	private Integer sort;
	private Integer status;

	private List<Menu> childMenuList;
}