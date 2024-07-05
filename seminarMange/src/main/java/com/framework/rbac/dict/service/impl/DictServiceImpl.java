package com.framework.rbac.dict.service.impl;

import com.framework.rbac.dict.mapper.DictMapper;
import com.framework.rbac.dict.model.Dict;
import com.framework.rbac.dict.service.DictService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * (sys_dict)表服务实现类
 *
 * @author pangsir
 * @since 2020-08-08 13:06:31
 */
@Service
public class DictServiceImpl implements DictService {
	@Autowired
	private DictMapper dictMapper;

	@Override
	public Dict load(String id) {
		return this.dictMapper.load(id);
	}

	@Override
	public Map<String,Object> find(String order, Integer offset, Integer limit) {
		Map<String,Object> map = new HashMap<>();
		map.put("total",this.dictMapper.getTotalCount());
		map.put("rows",this.dictMapper.list(order,offset,limit));
		return map;
	}

	@Override
	public void add(Dict dict) {
		this.dictMapper.add(dict);
	}

	@Override
	public void update(Dict dict) {
		this.dictMapper.update(dict);
	}

	@Override
	public void delete(String id) {
		this.dictMapper.delete(id);
	}

	@Override
	public List<Map<String, Object>> getInitDictMap() {
		return this.dictMapper.getInitDictMap();
	}
}