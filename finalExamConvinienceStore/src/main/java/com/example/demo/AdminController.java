package com.example.demo;

import org.mybatis.spring.annotation.MapperScan;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.ComponentScan;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import myapp.dao.MemberDao;
import myapp.dao.UserDao;

@Controller
public class AdminController {
	
	@Autowired 
	MemberDao memberDao;
	
	@RequestMapping(value="/admin_dailycost")
	public String adminDailyCost() {
		return "admin/admin_static_dailycost";
	}
	
	@RequestMapping(value="/admin_dailycount")
	public String adminDailyCount() {
		return "admin/admin_static_dailycount";
	}
	
	@RequestMapping(value="/admin_firstproduct")
	public String adminFirstProduct() {
		return "admin/admin_static_firstproduct";
	}
	
	@RequestMapping(value="/admin_monthlycost")
	public String adminMonthlyCost() {
		return "admin/admin_static_monthlycost";
	}
	
	@RequestMapping(value="/admin_monthlycount")
	public String adminMonthlyCount() {
		return "admin/admin_static_monthlycount";
	}
	
	@RequestMapping(value="/admin_stockproduct")
	public String adminStockProduct() {
		return "admin/admin_static_stockproduct";
	}
}
