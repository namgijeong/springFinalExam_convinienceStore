package myapp.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;

import org.apache.tomcat.jdbc.pool.DataSource;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.PreparedStatementCreator;
import org.springframework.jdbc.core.RowMapper;
import org.springframework.jdbc.support.GeneratedKeyHolder;
import org.springframework.jdbc.support.KeyHolder;

import myapp.domain.Member;

public class MemberDao {
	private JdbcTemplate jdbcTemplate;
	public MemberDao(DataSource dataSource) {
		this.jdbcTemplate=new JdbcTemplate(dataSource);
	}
	
	public List<Member> selectAll(){
		List<Member> results= jdbcTemplate.query("select * from MEMBER", 
				(ResultSet rs, int rowNum)->{
					Member member=new Member(rs.getString("EMAIL"), rs.getString("PASSWORD"),
							rs.getString("NAME"),rs.getTimestamp("REGDATE").toLocalDateTime());
					member.setId(rs.getLong("ID"));
					
					return member;
				}
				);
		
		return results;
	}
	
	public Member selectByEmail(String email) {
		List<Member> results= jdbcTemplate.query("select * from MEMBER where EMAIL=?", 
				new RowMapper<Member>() {

					/*@Override*/
					/*timestamp->localdatetime*/
					/*// LocalDateTime -> Timestamp
						Timdstamp timestamp = Timestamp.valueOf(localDateTime); //2019-10-31 08:45:54.874
						
						// Timestamp -> LocalDateTime
						LocalDateTime localDateTime = timestamp.toLocalDateTime() //2019-10-31T08:45:54.874
					 */
					public Member mapRow(ResultSet rs, int rowNum) throws SQLException{
						Member member= new Member(rs.getString("EMAIL"),rs.getString("PASSWORD"),rs.getString("NAME"),rs.getTimestamp("REGDATE").toLocalDateTime());
						
						member.setId(rs.getLong("ID"));
						
						return member;
					}
			
		},email	);
		
		return results.isEmpty()?null:results.get(0);
	}
	public void insert(final Member member) {
		KeyHolder keyHolder=new GeneratedKeyHolder();
		jdbcTemplate.update(
				new PreparedStatementCreator() {

					@Override
					public PreparedStatement createPreparedStatement(Connection con) throws SQLException {
						// TODO Auto-generated method stub
						PreparedStatement pstmt=con.prepareStatement(
								"insert into MEMBER(EMAIL,PASSWORD,NAME,REGDATE) values(?,?,?,?)",
								new String[] {"ID"});
							pstmt.setString(1, member.getEmail());
							pstmt.setString(2, member.getPassword());
							pstmt.setString(3, member.getName());
							//pstmt.setDate를 하기위해 java.sql.Date는 long타입을 넣어줘야함->getTime()으로 숫자반환하는 함수써야함
							//regdate는 datetime
							pstmt.setTimestamp(4, java.sql.Timestamp.valueOf(member.getRegisterDateTime()));
							return pstmt;
					}
				},keyHolder	);
						Number keyValue=keyHolder.getKey();
						member.setId(keyValue.longValue());
					
					
				}
}
