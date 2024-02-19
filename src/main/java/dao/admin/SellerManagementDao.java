package dao.admin;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import com.ibatis.sqlmap.client.SqlMapClient;

import dto.admin.SellerManagementDto;
import ibatis.IbatisUtil;

public class SellerManagementDao {

	private SqlMapClient ibatis = IbatisUtil.getSqlMapClient();
	
	public List<SellerManagementDto> getSellers(Map<String, Object> param) throws SQLException {
		return (List<SellerManagementDto>) ibatis.queryForList("seller-management.getSellers", param);
	}
	
	public int getTotalRows(Map<String, Object> param) throws SQLException {
		return (Integer) ibatis.queryForObject("seller-management.getTotalRows", param);
	}
}