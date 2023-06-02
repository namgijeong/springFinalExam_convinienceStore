package com.example.demo;



import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import myapp.domain.Member;
import myapp.service.impl.MemberServiceImpl;
@Controller
public class LoginController {
	@Autowired
	MemberServiceImpl memberServiceImpl;
	static Logger logger=LoggerFactory.getLogger(LoginController.class);
	  @RequestMapping(value="/login") 
	  public String login() {
		  return "login/login"; 
	  }
	  @RequestMapping(value="/logout") 
	  public String logout(HttpSession session) {
		  session.removeAttribute("primaryId");
		  session.removeAttribute("memberType");
		  session.removeAttribute("isLogin");
		  session.invalidate();
		  return "index"; 
	  }
	  @RequestMapping(value= {"/main", "/"}) 
	  public String main() {
		  return "index"; 
	  }
	  
	  @RequestMapping(value="/loginOk") 
	  public ModelAndView loginOk(HttpSession session,@RequestParam(value="id")String inputId,@RequestParam(value="password")String password) {
		  Member loginTryMember=memberServiceImpl.getById(inputId);
		  logger.debug("들어온 패스워드:"+password);
		  System.out.println("들어온 패스워드:"+password);
		  ModelAndView result = new ModelAndView();
		  String correctPassword=loginTryMember.getPassword();
		  logger.debug("정답 패스워드:"+correctPassword);
		  System.out.println("정답 패스워드:"+correctPassword);
		  if(correctPassword.equals(password)) {
			  session.setAttribute("primaryId",loginTryMember.getPrimaryId());
			  session.setAttribute("memberType",loginTryMember.getMemberType());
			  session.setAttribute("isLogin","true");
			  /*redirect:를 써야 바로 단순히 파일이동이 아닌 컨트롤러를 타고 코드를 수행하는것같다..*/
			  result.setViewName("redirect:/main");
			  return result;
		  }
		  else {
			  result.addObject("login_fail", "fail");
		
				 result.setViewName("redirect:/login");
				  return result; 
		  }
		 
	  }
}
