package com.framework.rbac.menu.model;

import com.fasterxml.jackson.annotation.JsonInclude;
import lombok.Data;

import java.util.List;
//属性的定义来源于JsTree插件使用的属性，如果对于节点还需要其他属性，需要在该类中继续添加和控制即可
@Data
public class MenuNode {
	private Integer id;
	private String text;
	private String icon;
	@JsonInclude(JsonInclude.Include.NON_EMPTY)
	private List<MenuNode> children;
}
