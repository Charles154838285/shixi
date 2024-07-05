package com.framework.commons.listener;

import com.framework.rbac.dict.service.DictService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.ApplicationListener;
import org.springframework.context.event.ContextRefreshedEvent;
import org.springframework.stereotype.Component;

import javax.servlet.ServletContext;
import java.util.List;
import java.util.Map;
import java.util.Set;

@Component
public class WebApplicationListener  implements ApplicationListener<ContextRefreshedEvent> {
	@Autowired
	private ServletContext application;
	@Autowired
	private DictService dictService;
	@Override
	public void onApplicationEvent(ContextRefreshedEvent contextRefreshedEvent) {
		System.out.println("=====");
		System.out.println("application = " + application);
		System.out.println("dictService = " + dictService);
		System.out.println("=====");
		List<Map<String, Object>> initDictMap = dictService.getInitDictMap();
		for (Map<String, Object> map : initDictMap) {
			application.setAttribute("APP_"+map.get("key"),map.get("tempDictList"));
		}

	}
}
