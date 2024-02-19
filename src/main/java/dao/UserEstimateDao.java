package dao;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import org.apache.catalina.User;

import com.ibatis.sqlmap.client.SqlMapClient;

import ibatis.IbatisUtil;
import vo.MainObjectCategory;
import vo.UserEstimate;
import vo.UserEstimateObject;

public class UserEstimateDao {

	private SqlMapClient ibatis = IbatisUtil.getSqlMapClient();
	
	
	public List<UserEstimate> getUserEstimates (Map<String, Object> param) throws SQLException {
		return (List<UserEstimate>) ibatis.queryForList("user_estimate.getUserEstimates", param);
	}
	
	
	public int getTotalRows(Map<String, Object> param) throws SQLException {
		return (Integer) ibatis.queryForObject("user_estimate.getTotalRows", param);
	}
	
	
	public List<UserEstimate> getAllUserEstimates (int userNo) throws SQLException {
		return (List<UserEstimate>) ibatis.queryForList("user_estimate.getAllUserEstimates", userNo);
	}
	
	public void insertUserEstimates(UserEstimate userEstimate) throws SQLException{
		ibatis.insert("user_estimate.insertUserEstimates",userEstimate);
	}
	
	public void insertUserEstimatesObject(UserEstimateObject userEstimateObject) throws SQLException {
		ibatis.insert("user_estimate.insertUserEstimatesObject",userEstimateObject);
	}
	
	public int getSequence() throws SQLException{
		return (int)ibatis.queryForObject("user_estimate.getSequence"); 
	}
	
	@SuppressWarnings("unchecked")
	public List<MainObjectCategory> getMainObjectCategories() throws SQLException{
		return (List<MainObjectCategory>)ibatis.queryForList("user_estimate.getMainObjectCategories");
	}
	
	/**
	 * 5개 글 미만 랜덤하게 출력해서  List로 값조회
	 * @methodNamd	:   getIndexEsti
	 * @author 		:	Han Gi Seon
	 * @date		:	2024.02.08
	 * @return
	 * @throws SQLException
	 */
	@SuppressWarnings("unchecked")
	public List<UserEstimate> getIndexEsti() throws SQLException {
		return (List<UserEstimate>)ibatis.queryForList("user_estimate.getIndexEsti");
	}
}
