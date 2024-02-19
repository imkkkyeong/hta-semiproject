package dao;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import com.ibatis.sqlmap.client.SqlMapClient;

import dto.SellerDepositDto;
import ibatis.IbatisUtil;

public class SellerDepositDao {

	private SqlMapClient ibatis = IbatisUtil.getSqlMapClient();
	
	@SuppressWarnings("unchecked")
	public List<SellerDepositDto> getSellerDeposits(Map<String, Object> param) throws SQLException{
		return (List<SellerDepositDto>) ibatis.queryForList("seller-deposit.getSellerDeposits", param);
	}
	
	public int getSellerDepositsRows(Map<String, Object> param) throws SQLException{
		return (int) ibatis.queryForObject("seller-deposit.getSellerDepositsRows", param);
	}
}
