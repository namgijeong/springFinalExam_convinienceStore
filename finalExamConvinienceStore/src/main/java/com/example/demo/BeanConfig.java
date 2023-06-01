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
@MapperScan(basePackages = {"myapp.dao"})
@ComponentScan(basePackages = { "myapp.domain" ,"myapp.service.impl","myapp.service"} )
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
    public SqlSessionFactoryBean sqlSessionFactory(DataSource dataSource) throws IOException {
        SqlSessionFactoryBean factoryBean = new SqlSessionFactoryBean();
        factoryBean.setDataSource(dataSource);
        factoryBean.setConfigLocation(applicationContext.getResource("classpath:/mybatis-config.xml"));
        factoryBean.setMapperLocations(applicationContext.getResources("classpath:/mybatis/mappers/*.xml"));
        return factoryBean;

    }
	
	@Bean
	public SqlSessionTemplate sqlSession(SqlSessionFactory sqlSessionFactory) {
		return new SqlSessionTemplate(sqlSessionFactory);
	}
}
