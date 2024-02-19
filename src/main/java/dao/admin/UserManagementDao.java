package dao.admin;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import com.ibatis.sqlmap.client.SqlMapClient;

import ibatis.IbatisUtil;
import vo.Users;

public class UserManagementDao {

	private SqlMapClient ibatis = IbatisUtil.getSqlMapClient();
	
	public List<Users> getUsers(Map<String, Object> param) throws SQLException {
		return (List<Users>) ibatis.queryForList("user-management.getUsers", param);
	}
	

	public int getTotalRows(Map<String, Object> param) throws SQLException {
		return (Integer) ibatis.queryForObject("user-management.getTotalRows", param);
	}
}