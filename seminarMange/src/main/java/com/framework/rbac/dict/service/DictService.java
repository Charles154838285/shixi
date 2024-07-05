package com.framework.rbac.dict.service;

import com.framework.rbac.dict.model.Dict;

import java.util.List;
import java.util.Map;

/**
 * (sys_dict)业务逻辑层
 *
 * @author pangsir
 * @since 2020-08-08 13:06:31
 */
public interface DictService {
	Dict load(String id);

	Map<String,Object> find(String order,Integer offset,Integer limit);

	void add(Dict dict);

	void update(Dict dict);

	void delete(String id);

	List<Map<String,Object>> getInitDictMap();

}