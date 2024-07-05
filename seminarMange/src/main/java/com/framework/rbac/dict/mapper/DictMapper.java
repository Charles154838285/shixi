package com.framework.rbac.dict.mapper;

import com.framework.rbac.dict.model.Dict;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import java.util.List;
import java.util.Map;

/**
 * (sys_dict)表数据库访问层
 *
 * @author pangsir
 * @since 2020-08-08 13:06:30
 */
@Repository
public interface DictMapper {
	Dict load(String id);
	List<Dict> list(@Param("order") String order,@Param("offset") Integer offset,@Param("limit") Integer limit);
	int getTotalCount();
	void add(Dict dict);
	void update(Dict dict);
	void delete(String id);

	List<Map<String,Object>> getInitDictMap();

}