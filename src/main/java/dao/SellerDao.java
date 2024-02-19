package dao;

import java.sql.SQLException;
import com.ibatis.sqlmap.client.SqlMapClient;
import ibatis.IbatisUtil;
import vo.Seller;

public class SellerDao {

	private SqlMapClient ibatis = IbatisUtil.getSqlMapClient();
	
	public void insertSeller(Seller seller) throws SQLException {
		ibatis.insert("sellers.insertSeller", seller);
	}
	
	public Seller getSellerById(String id) throws SQLException {
		
		Seller seller = (Seller) ibatis.queryForObject("sellers.getSellerById",id);
		return seller;
	}
}
