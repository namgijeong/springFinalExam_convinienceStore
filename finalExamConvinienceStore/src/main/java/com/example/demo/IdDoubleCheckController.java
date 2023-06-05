package com.example.demo;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import myapp.dao.MemberDao;
import myapp.domain.OneDaySaleCountProduct;

@RestController
public class IdDoubleCheckController {
	@Autowired
	MemberDao memberDao;
	@RequestMapping("/idDoubleCheck/{inputId}")
	public int idDoubleCheck(@PathVariable("inputId")String inputId) {
		int code=memberDao.doubleCheckId(inputId);
		if(code>=1) {
			
			return 1;
		}
	
		else {
			return 0;
		}
	}
		
}
