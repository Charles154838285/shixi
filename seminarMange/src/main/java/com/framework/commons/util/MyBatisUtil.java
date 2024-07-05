package com.framework.commons.util;

import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;

import java.io.IOException;
import java.io.InputStream;

public final class MyBatisUtil {

	private final static String PATH = "mybatis-config.xml";//resources
	private static SqlSessionFactory factory ;
	static {
		try {
			InputStream in = Resources.getResourceAsStream(PATH);
			factory = new SqlSessionFactoryBuilder().build(in);
		} catch (IOException e) {
			e.printStackTrace();
			throw new RuntimeException("读取核心配置文件错误");
		}
	}

	public static SqlSession getSqlSession(){
		return factory.openSession();
	}

	public static void close(SqlSession sqlSession){
		if(sqlSession!=null){
			sqlSession.close();
		}
	}


}
