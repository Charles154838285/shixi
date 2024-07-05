package com.framework.rbac.log.service.impl;

import com.framework.rbac.log.mapper.LogMapper;
import com.framework.rbac.log.model.Log;
import com.framework.rbac.log.service.LogService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * (sys_log)表服务实现类
 *
 * @author pangsir
 * @since 2020-08-07 13:07:25
 */
@Service
public class LogServiceImpl implements LogService {
	@Autowired
	private LogMapper logMapper;

	@Override
	public List<Log> list() {
		return this.logMapper.list();
	}

	@Override
	public void add(Log log) {
		this.logMapper.add(log);
	}

	@Override
	public void delete(String[] arr) {
		this.logMapper.delete(arr);
	}
}