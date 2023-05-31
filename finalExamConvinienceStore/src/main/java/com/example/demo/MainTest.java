package com.example.demo;

import java.util.Date;
import java.util.List;

import org.springframework.context.support.AbstractApplicationContext;
import org.springframework.context.support.GenericXmlApplicationContext;

import myapp.domain.User;
import myapp.service.UserService;

public class MainTest {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
AbstractApplicationContext ctx= new GenericXmlApplicationContext("classpath*:applicationContext.xml");
		
		UserService userService=(UserService)ctx.getBean("userService");
		
		User user= new User();
		user.setName("mybatis1");
		user.setPhone("11111111");
		user.setBirthday(new Date());
		userService.save(user);
		System.out.println("save ok");
		
		List<User> users=userService.getAll();
		for(int i=0;i<users.size();++i) {
			System.out.println(users.get(i));
		}
	}
	

}
