package myapp.dao;

import org.apache.ibatis.annotations.Mapper;

import myapp.domain.Member;

@Mapper
public interface MemberDao {
	void save(Member member);
	void update(Member member);
	Member findById(String id);
	Member findIdByPrimaryId(int primaryId);
}
