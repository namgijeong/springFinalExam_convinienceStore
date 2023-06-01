package com.example.demo;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
@Controller
public class LoginController {

	  @RequestMapping(value="/login") 
	  public String login() {
		  return "login/login"; 
	  }
	  
	  @RequestMapping(value="/loginOk") 
	  public String loginOk() {
		  return null; 
	  }
}
