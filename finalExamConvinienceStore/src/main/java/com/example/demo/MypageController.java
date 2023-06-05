package com.example.demo;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import myapp.service.impl.MemberServiceImpl;
@Controller
public class MypageController {
		
	@Autowired
	MemberServiceImpl memberServiceImpl;
	
	  @RequestMapping(value="/mypage") 
	  public String mypage() {
		  return "mypage/mypage"; 
	  }
	  
	  @RequestMapping(value="/mypageOk") 
	  public String mypageOk(HttpSession session,HttpServletRequest request,@RequestParam (value="password") String inputPassword) {
		  int primaryId=(int) session.getAttribute("primaryId");
		  int code=memberServiceImpl.confirmCurrentPassword(primaryId, inputPassword);
		  if(code==1) {
			  return "redirect:/mypage_update";
		  }
		  else {
			//이전 페이지로 리다이렉트 시키기
			String referer = request.getHeader("Referer");
			return "redirect:"+referer;
		  }
		  
		  
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
