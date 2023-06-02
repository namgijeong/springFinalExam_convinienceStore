package myapp.service;

import myapp.domain.Member;

public interface MemberService {
	void save(Member user);
	void update(Member user);
	Member getById(String id);
}
