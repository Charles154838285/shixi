package com.framework.commons.config;

import org.mybatis.spring.SqlSessionFactoryBean;
import org.mybatis.spring.mapper.MapperScannerConfigurer;
import org.springframework.aop.Advisor;
import org.springframework.aop.aspectj.AspectJExpressionPointcut;
import org.springframework.aop.support.DefaultPointcutAdvisor;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.context.annotation.EnableAspectJAutoProxy;
import org.springframework.core.io.ClassPathResource;
import org.springframework.core.io.Resource;
import org.springframework.core.io.support.PathMatchingResourcePatternResolver;
import org.springframework.core.io.support.ResourcePatternResolver;
import org.springframework.jdbc.datasource.DataSourceTransactionManager;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.PlatformTransactionManager;
import org.springframework.transaction.TransactionDefinition;
import org.springframework.transaction.annotation.EnableTransactionManagement;
import org.springframework.transaction.interceptor.*;

import javax.sql.DataSource;
import java.io.IOException;
import java.util.Collections;
import java.util.HashMap;
import java.util.Map;

@Configuration
@EnableAspectJAutoProxy(proxyTargetClass = true)
@EnableTransactionManagement(proxyTargetClass = true)
public class CommonsSpringConfig {

	@Bean
	public PlatformTransactionManager transactionManager(DataSource dataSource){
		//配置JDBC的事务管理器,管理数据源
		return new DataSourceTransactionManager(dataSource);
	}
	@Bean("serviceAdvice")
	public TransactionInterceptor serviceAdvice(PlatformTransactionManager transactionManager){
		//数据源
		NameMatchTransactionAttributeSource source = new NameMatchTransactionAttributeSource();
		//设置规则：只读事务，不做更新操作
		RuleBasedTransactionAttribute readOnlyTx = new RuleBasedTransactionAttribute();
		readOnlyTx.setReadOnly(true);
		readOnlyTx.setPropagationBehavior(TransactionDefinition.PROPAGATION_REQUIRED);//默认值

		//设置规则：当事务存在就使用当前事务，如果不存在则创建新的事务
		RuleBasedTransactionAttribute requiredTx = new RuleBasedTransactionAttribute();
		requiredTx.setRollbackRules(Collections.singletonList(new RollbackRuleAttribute(Exception.class)));
		requiredTx.setPropagationBehavior(TransactionDefinition.PROPAGATION_REQUIRED);//默认值
		//设置：哪些方法使用哪些规则？
		Map<String, TransactionAttribute> txMap = new HashMap<>();
		txMap.put("get*",readOnlyTx);
		txMap.put("list*",readOnlyTx);
		txMap.put("find*",readOnlyTx);
		txMap.put("query*",readOnlyTx);
		txMap.put("check*",readOnlyTx);
		txMap.put("load*",readOnlyTx);
		txMap.put("sel*",readOnlyTx);
		txMap.put("valid*",readOnlyTx);
		txMap.put("login*",readOnlyTx);

		txMap.put("*",requiredTx);

		source.setNameMap(txMap);

		TransactionInterceptor txAdivce = new TransactionInterceptor();
		txAdivce.setTransactionManager(transactionManager);
		txAdivce.setTransactionAttributeSource(source);
		return txAdivce;
	}

	@Bean
	public Advisor serviceAdviceAdvisor(TransactionInterceptor serviceAdvice){
		AspectJExpressionPointcut pointcut = new AspectJExpressionPointcut();
		pointcut.setExpression("execution(* com.framework..service.*Service.*(..))");
		return new DefaultPointcutAdvisor(pointcut,serviceAdvice);
	}
}
