package dao;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import com.ibatis.sqlmap.client.SqlMapClient;

import dto.SellerEstimateStatusDto;
import ibatis.IbatisUtil;
import vo.SellerEstimate;
import vo.SellerReadEstimate;
import vo.UserEstimate;
import vo.UserEstimateObject;

public class SellerEstimateDao {
	
	private SqlMapClient ibatis = IbatisUtil.getSqlMapClient();
	
	public int getTotalUserEstimatesRows(Map<String, Object> param) throws SQLException{
		return (int)ibatis.queryForObject("seller-estimates.getTotalUserEstimatesRows", param);
	}
	
	@SuppressWarnings("unchecked")
	public List<UserEstimate> getUserEstimates(Map<String, Object> param) throws SQLException{
		return (List<UserEstimate>) ibatis.queryForList("seller-estimates.getUserEstimates", param);
	}
	
	public SellerReadEstimate getSellerNoByUserEstimateNo(int no) throws SQLException{
		return (SellerReadEstimate)ibatis.queryForObject("seller-estimates.getSellerNoByUserEstimateNo", no);
	}
	
	public void insertSellerReadEstimate(Map<String, Integer> param) throws SQLException{
		ibatis.insert("seller-estimates.insertSellerReadEstimate", param);
	}
	
	public UserEstimate getUserEstimateByNo(int no) throws SQLException {
		return (UserEstimate) ibatis.queryForObject("seller-estimates.getUserEstimateById", no);
	}
	
	@SuppressWarnings("unchecked")
	public List<UserEstimateObject> getObjectsByNo(int no) throws SQLException{
		return (List<UserEstimateObject>) ibatis.queryForList("seller-estimates.getObjectsById", no);
	}
	
	public void insertSellerEstimate(SellerEstimate sellerEstimate) throws SQLException {
		ibatis.insert("seller-estimates.insertSellerEstimate", sellerEstimate);
	}
	
	@SuppressWarnings("unchecked")
	public List<SellerEstimateStatusDto> getSellerEstimatesByStatus(Map<String, Integer> param) throws SQLException{
		return (List<SellerEstimateStatusDto>) ibatis.queryForList("seller-estimates.getSellerEstimatesByStatus", param);
	}
	
	public SellerEstimate getSellerEstimateByNo(int no) throws SQLException{
		return (SellerEstimate)ibatis.queryForObject("seller-estimates.getSellerEstimateById", no);
	}
	
	public void updateSellerEstimate(SellerEstimate sellerEstimate) throws SQLException{
		ibatis.update("seller-estimates.updateSellerEstimate", sellerEstimate);
	}
	
	public void deleteSellerEstimate(int no) throws SQLException{
		ibatis.update("seller-estimates.deleteSellerEstimate", no);
	}
	
	public int getSequence() throws SQLException{
		return (int)ibatis.queryForObject("seller-estimates.getSequence");
	}
	
	public void insertSellerEstimateImages(Map<String, Object> param) throws SQLException{
		ibatis.insert("seller-estimates.insertSellerEstimateImages", param);
	}
	
	@SuppressWarnings("unchecked")
	public List<SellerEstimate> getSellerEstimateList(int userNo) throws SQLException{
		return (List<SellerEstimate>)ibatis.queryForList("seller-estimates.getSellerEstimateList", userNo);
	}
}
