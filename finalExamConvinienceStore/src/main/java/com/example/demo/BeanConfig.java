package com.example.demo;

import java.io.IOException;

import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.tomcat.jdbc.pool.DataSource;
import org.apache.tomcat.jdbc.pool.DataSourceProxy;
import org.mybatis.spring.SqlSessionFactoryBean;
import org.mybatis.spring.SqlSessionTemplate;
import org.mybatis.spring.annotation.MapperScan;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.ApplicationContext;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.ComponentScan;
import org.springframework.context.annotation.Configuration;

import myapp.dao.MemberDao;

@Configuration

public class BeanConfig {

	@Autowired
	ApplicationContext applicationContext;

	@Bean(destroyMethod = "close")
	public DataSource dataSource() {
		DataSource ds = new DataSource();
		ds.setDriverClassName("com.mysql.cj.jdbc.Driver");
		ds.setUrl(
				"jdbc:mysql://localhost/spring5fs?useSSL=false&allowPublicKeyRetrieval=true&characterEncoding=utf8&serverTimexone=UTC");
		ds.setUsername("spring5");
		ds.setPassword("spring5");
		return ds;
	}
	
	@Bean
	public MemberDao memberDao() {
		return new MemberDao(dataSource());
	}

	/*
	 * @Bean public SqlSessionFactoryBean sqlSessionFactoryBean() {
	 * SqlSessionFactoryBean ssf = new SqlSessionFactoryBean();
	 * ssf.setDataSource(dataSource());
	 * 
	 * ssf.setConfigLocation(applicationContext.getResource(
	 * "classpath:/mybatis-config.xml"));
	 * 
	 * 이런 형식으로 resources에 지정하는것이 맞는지????
	 * 
	 * 
	 * ssf.setMapperLocations(applicationContext.getResources("myapp.dao/*.xml"));
	 * 
	 * 
	 * return ssf; }
	 */

	/*
	 * @Bean
	 * 
	 * public SqlSessionTemplate sqlSession(SqlSessionFactory sqlSessionFactory) {
	 * 
	 * return new SqlSessionTemplate(sqlSessionFactory);
	 * 
	 * }
	 */

	/*
	 * @Bean public SqlSessionFactory sqlSessionFactory() throws Exception {
	 * SqlSessionFactoryBean sqlSessionFactory = new SqlSessionFactoryBean();
	 * sqlSessionFactory.setDataSource(dataSource()); return (SqlSessionFactory)
	 * sqlSessionFactory.getObject(); }
	 */

	/*
	 * @Bean public UserMapper userMapper() throws Exception { SqlSessionTemplate
	 * sessionTemplate = new SqlSessionTemplate(sqlSessionFactory()); return
	 * sessionTemplate.getMapper(UserMapper.class); }
	 */

	/*
	 * @Bean public UserMapper userMapper() {
	 * 
	 * UserMapper userMapper= new UserMapper();
	 * userMapper.setMapperInterface("myapp.dao.UserDao");
	 * 
	 * 
	 * SqlSessionTemplate sessionTemplate = new
	 * SqlSessionTemplate(sqlSessionFactory()); return
	 * sessionTemplate.getMapper(UserMapper.class); }
	 */

	/*
	 * < bean id = "userService"class="myapp.service.impl.UserServiceImpl"><
	 * property name = "userDao"ref="userMapper"/></bean>
	 */
}
