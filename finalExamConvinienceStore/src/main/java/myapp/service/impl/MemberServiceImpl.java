package myapp.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import myapp.dao.MemberDao;
import myapp.domain.Member;
import myapp.service.MemberService;
@Component
public class MemberServiceImpl implements MemberService{
	@Autowired
	MemberDao memberDao;
	@Override
	public void save(Member user) {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void update(Member user) {
		// TODO Auto-generated method stub
		
	}

	@Override
	public Member getById(String id) {
		// TODO Auto-generated method stub
		return memberDao.findById(id);
	}



}
