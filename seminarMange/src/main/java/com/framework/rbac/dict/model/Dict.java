package com.framework.rbac.dict.model;

import lombok.Data;

import java.io.Serializable;

@Data
public class Dict implements Serializable {
	private static final long serialVersionUID = 152220126057721633L;
	private String id;
	private String dictName;
	private String dictValue;
	private String dictKey;
	private Integer sort;
}