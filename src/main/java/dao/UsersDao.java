package dao;

import java.sql.SQLException;

import com.ibatis.sqlmap.client.SqlMapClient;

import ibatis.IbatisUtil;
import vo.Users;

public class UsersDao {

	// ibatis 변수에 핵심객체(IbatisUtil) 저장
	private SqlMapClient ibatis = IbatisUtil.getSqlMapClient();
	
	
	
	
	public Users getUserByNo(int no) throws SQLException {
		Users user = (Users) ibatis.queryForObject("users.getUserByNo", no);
		return user;
	}
	
	
	/**
	 * 등록된 ID에 해당하는 정보를 조회해서 반환
	 * @param id 조회할 사용자 아이디
	 * @return 입력한 id에 해당하는 Users 객체
	 * @throws SQLException
	 */
	public Users getUserById(String id) throws SQLException{
		Users user = (Users)ibatis.queryForObject("users.getUserById",id);
		return user;
	}
	
	public void insertUsers(Users user) throws SQLException {
		ibatis.insert("users.insertUsers",user);
	}
	
	public void updatedUsers(Users user) throws SQLException {
		ibatis.update("users.updatedUsers", user);
	}
	
	
}
