package com.framework.rbac.log.mapper;

import com.framework.rbac.log.model.Log;
import org.springframework.stereotype.Repository;

import java.util.List;

/**
 * (sys_log)表数据库访问层
 *
 * @author pangsir
 * @since 2020-08-07 13:07:25
 */
@Repository
public interface LogMapper {
	List<Log> list();
	void add(Log log);
	void delete(String[] arr);

}