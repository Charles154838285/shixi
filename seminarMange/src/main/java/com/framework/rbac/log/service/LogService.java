package com.framework.rbac.log.service;

import com.framework.rbac.log.model.Log;

import java.util.List;

/**
 * (sys_log)业务逻辑层
 *
 * @author pangsir
 * @since 2020-08-07 13:07:25
 */
public interface LogService {
	List<Log> list();

	void add(Log log);

	void delete(String[] arr);

}