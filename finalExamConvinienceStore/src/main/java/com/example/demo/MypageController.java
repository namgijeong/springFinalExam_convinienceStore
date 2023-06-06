package com.example.demo;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import myapp.dao.MemberDao;
import myapp.domain.Member;
import myapp.service.impl.MemberServiceImpl;
@Controller
public class MypageController {
		
	@Autowired
	MemberServiceImpl memberServiceImpl;
	@Autowired
	MemberDao memberDao;
	
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
	  public String mypageUpdate(HttpSession session, Model model) {
		  int primaryId=(int) session.getAttribute("primaryId");
		  Member member=memberDao.findIdByPrimaryId(primaryId);
		  model.addAttribute("currentMember",member);
		  return "mypage/mypage_update"; 
	  }
	  

	  @RequestMapping(value="/mypage_updateOk") 
	  public String mypageUpdateOk(HttpSession session,HttpServletRequest request,@RequestParam("memberId")String memberId, @RequestParam("password")String password) {
		  int primaryId=(int) session.getAttribute("primaryId");
		  Member member=new Member();
		  member.setPrimaryId(primaryId);
		  member.setMemberId(memberId);
		  member.setPassword(password);
		  memberDao.update(member);
		  
		  String referer = request.getHeader("Referer");
		  return "redirect:"+referer;
		   
	  }
}
