package com.example.demo;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
@Controller
public class MypageController {

	  @RequestMapping(value="/mypage") 
	  public String mypage() {
		  return "mypage/mypage"; 
	  }
	  
	  @RequestMapping(value="/mypage_update") 
	  public String mypageUpdate() {
		  return "mypage/mypage_update"; 
	  }
	  

	  @RequestMapping(value="/mypage_updateOk") 
	  public String mypageUpdateOk() {
		  return null; 
	  }
}
