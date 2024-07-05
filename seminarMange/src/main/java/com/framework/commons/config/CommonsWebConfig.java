package com.framework.commons.config;

import com.fasterxml.jackson.annotation.JsonInclude;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.framework.commons.formatter.String2DateFormatter;
import com.framework.commons.interceptor.LoginInterceptor;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.ComponentScan;
import org.springframework.context.annotation.Configuration;
import org.springframework.format.FormatterRegistry;
import org.springframework.http.MediaType;
import org.springframework.http.converter.HttpMessageConverter;
import org.springframework.http.converter.json.MappingJackson2HttpMessageConverter;
import org.springframework.web.multipart.MultipartResolver;
import org.springframework.web.multipart.commons.CommonsMultipartResolver;
import org.springframework.web.servlet.config.annotation.*;
import org.springframework.web.servlet.view.JstlView;

import java.nio.charset.Charset;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.List;

@Configuration//标准该类为配置类==等价核心配置文件（springmvc.xml）
public class CommonsWebConfig implements WebMvcConfigurer {

	/**
	 * 默认方式的排除静态资源
	 * <mvc:default-servlet-handler default-servlet-name="default"/>
	 * @param configurer
	 */
	/*@Override
	public void configureDefaultServletHandling(DefaultServletHandlerConfigurer configurer) {
		configurer.enable("default");
	}*/

	/**
	 * 静态资源的路径映射
	 * <mvc:resources mapping="/images/**" location="/attr/"/>
	 * <mvc:resources mapping="/js/**" location="/resources/"/>
	 * @param registry
	 */
	@Override
	public void addResourceHandlers(ResourceHandlerRegistry registry) {
		/*配置系统默认的*/
		registry.addResourceHandler("/**")
				.addResourceLocations("classpath:/META-INF/resources/")
				.addResourceLocations("classpath:/resoruces/")
				.addResourceLocations("classpath:/pulibc/")
				.addResourceLocations("classpath:/static/");
		/*自定义*/
		/*registry.addResourceHandler("/img/**")
				.addResourceLocations("classpath:/static/images/");//1.jpg*/
		/*外部的资源：为上传做准备*/
		registry.addResourceHandler("attr/**")
				.addResourceLocations("file:///D:/upload");
	}

	/**
	 * 设置消息的转换
	 * 		<mvc:message-converters>
	 *             <bean class="org.springframework.http.converter.json.MappingJackson2HttpMessageConverter">
	 *                 <property name="defaultCharset" value="UTF-8"/>
	 *                 <property name="prettyPrint" value="true"/>
	 *                 <property name="supportedMediaTypes">
	 *                     <list>
	 *                         <value>text/html</value>
	 *                         <value>appication/json</value>
	 *                     </list>
	 *                 </property>
	 *                 <property name="objectMapper">
	 *                     <bean class="com.fasterxml.jackson.databind.ObjectMapper">
	 *                         <property name="dateFormat">
	 *                             <bean class="java.text.SimpleDateFormat">
	 *                                 <constructor-arg value="yyyy-MM-dd HH:mm:ss"/>
	 *                             </bean>
	 *                         </property>
	 *                     </bean>
	 *                 </property>
	 *             </bean>
	 *         </mvc:message-converters>
	 * @param converters
	 */
	@Override
	public void configureMessageConverters(List<HttpMessageConverter<?>> converters) {
		MappingJackson2HttpMessageConverter jackson2HttpMessageConverter = new MappingJackson2HttpMessageConverter();
		jackson2HttpMessageConverter.setDefaultCharset(Charset.forName("UTF-8"));
		jackson2HttpMessageConverter.setPrettyPrint(true);
		List<MediaType> mediaTypeList = new ArrayList<>();
		mediaTypeList.add(MediaType.TEXT_HTML);
		mediaTypeList.add(MediaType.TEXT_PLAIN);
		mediaTypeList.add(MediaType.APPLICATION_JSON);
		jackson2HttpMessageConverter.setSupportedMediaTypes(mediaTypeList);

		ObjectMapper objectMapper = new ObjectMapper();
		objectMapper.setSerializationInclusion(JsonInclude.Include.NON_NULL);
		objectMapper.setDateFormat(new SimpleDateFormat("yyyy-MM-dd HH:mm:ss"));
		jackson2HttpMessageConverter.setObjectMapper(objectMapper);

		converters.add(jackson2HttpMessageConverter);
	}

	/**
	 * 文件上传的解析器
	 *     <bean class="org.springframework.web.multipart.commons.CommonsMultipartResolver" id="multipartResolver">
	 *         <property name="defaultEncoding" value="UTF-8"/>
	 *         <property name="maxUploadSize" value="#{1024*1024*50}"/>
	 *         <property name="maxUploadSizePerFile" value="#{1024*1024*10}"/>
	 *         <property name="maxInMemorySize" value="2048"/>
	 *         <property name="resolveLazily" value="true"/>
	 *
	 *     </bean>
	 * @return
	 */
	@Bean
	public MultipartResolver multipartResolver(){//<bean id="multipartResolver"/>
		CommonsMultipartResolver commonsMultipartResolver = new CommonsMultipartResolver();
		commonsMultipartResolver.setDefaultEncoding("UTF-8");
		commonsMultipartResolver.setMaxUploadSize(1024*1024*50);
		commonsMultipartResolver.setMaxUploadSizePerFile(1024*1024*5);
		commonsMultipartResolver.setMaxInMemorySize(2048);
		commonsMultipartResolver.setResolveLazily(true);
		//commonsMultipartResolver.setUploadTempDir();
		return commonsMultipartResolver;
	}

	/**
	 * String转换java.util.Date格式
	 * @param registry
	 */
	@Override
	public void addFormatters(FormatterRegistry registry) {
		registry.addFormatter(new String2DateFormatter());
	}

	@Override
	public void addInterceptors(InterceptorRegistry registry) {
		registry.addInterceptor(new LoginInterceptor())
				.addPathPatterns("/sys/**")//拦截所有的路径
				.excludePathPatterns("/sys/login");
	}
}
