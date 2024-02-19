package dao;

import java.sql.SQLException;
import java.util.List;

import com.ibatis.sqlmap.client.SqlMapClient;

import ibatis.IbatisUtil;
import vo.Bank;
import vo.Distance;
import vo.Pay;
import vo.SellerInfo;
import vo.SellerService;
import vo.SellerSupportPays;
import vo.SellerSupportService;

public class SellerProfileDao {
	
	private SqlMapClient ibatis = IbatisUtil.getSqlMapClient();
	
	/**
	 * Service , 제공하는 서비스의 종류를 조회한다.
	 * @methodNamd	:   getAllServices
	 * @author 		:	Han Gi Seon
	 * @date		:	2024.02.04  
	 * @return
	 * @throws SQLException
	 */
	@SuppressWarnings("unchecked")
	public List<SellerService> getAllServices() throws SQLException{
		return ibatis.queryForList("seller-profiles.getAllServices");
	}
	
	/**
	 * Pay 결제방식의 종류를 조회한다
	 * @methodNamd	:   getAllPays
	 * @author 		:	Han Gi Seon
	 * @date		:	2024.02.04  
	 * @return
	 * @throws SQLException
	 */
	@SuppressWarnings("unchecked")
	public List<Pay> getAllPays() throws SQLException{
		return ibatis.queryForList("seller-profiles.getAllPays");
	}
	
	/**
	 *  Distance 거리의 종류를 조회한다
	 * @methodNamd	:   getAllDistances
	 * @author 		:	Han Gi Seon
	 * @date		:	2024.02.04 
	 * @return
	 * @throws SQLException
	 */
	@SuppressWarnings("unchecked")
	public List<Distance> getAllDistances() throws SQLException{
		return ibatis.queryForList("seller-profiles.getAllDistances");
	}
	
	/**
	 * Bank, 즉 은행의 종류를 조회하기 위해 만들었다.
	 * @methodNamd	:   getAllBanks
	 * @author 		:	Han Gi Seon
	 * @date		:	2024.02.04 
	 * @return
	 * @throws SQLException
	 */
	@SuppressWarnings("unchecked")
	public List<Bank> getAllBanks() throws SQLException {
		return ibatis.queryForList("seller-profiles.getAllBanks");
	}
	
	/**
	 * SellerInfo , 판매자 프로필에 대한 정보를 조회한다
	 * @methodNamd	:   getSellerProfileBySellerNo
	 * @author 		:	Han Gi Seon
	 * @date		:	2024.02.05  
	 * @param sellerNo
	 * @return
	 * @throws SQLException
	 */
	public SellerInfo getSellerProfileBySellerNo(int sellerNo) throws SQLException {
		return (SellerInfo) ibatis.queryForObject("seller-profiles.getSellerProfileBySellerNo",sellerNo);
	}
	
	/**
	 * 판매자가 제공하는 서비스의 종류를 조회한다
	 * @methodNamd	:   getSellerServiceByInfoNo
	 * @author 		:	Han Gi Seon
	 * @date		:	2024.02.05 
	 * @param InfoNo
	 * @return
	 * @throws SQLException
	 */
	@SuppressWarnings("unchecked")
	public List<SellerSupportService> getSellerServiceByInfoNo(int InfoNo)throws SQLException {
		return ibatis.queryForList("seller-profiles.getSellerServiceByInfoNo", InfoNo);
	}
	
	/**
	 * 판매자가 지원하는 결제종류 조회 
	 * @methodNamd	:   getSellerPayByInfoNo
	 * @author 		:	Han Gi Seon
	 * @date		:	2024.02.05 
	 * @param InfoNo
	 * @return
	 * @throws SQLException
	 */
	@SuppressWarnings("unchecked")
	public List<Pay> getSellerPayByInfoNo(int InfoNo) throws SQLException {
		return ibatis.queryForList("seller-profiles.getSellerPayByInfoNo",InfoNo);
	}
	
	/**
	 * 시퀀스 번호를 조회한다 .
	 * 조회한 시퀀스 번호로 Pay 와 Service 를 등록하기 위해 이용했다.
	 * @methodNamd	:   getSellerInfoSequence
	 * @author 		:	Han Gi Seon
	 * @date		:	2024.02.06
	 * @return
	 * @throws SQLException
	 */
	public int getSellerInfoSequence() throws SQLException{
		return	 (int) ibatis.queryForObject("seller-profiles.getSellerInfoSequence");
	}
	
	/**
	 * SllerInfo 판매자에 프로필에서 Pay 결제 방식을 등록한다
	 * @methodNamd	:   insertPay
	 * @author 		:	Han Gi Seon
	 * @date		:	2024.02.06  
	 * @param ssPay
	 * @throws SQLException
	 */
	public void insertPay(SellerSupportPays ssPay) throws SQLException {
		ibatis.insert("seller-profiles.insertPay",ssPay);
	}
	
	/**
	 * SellerInfo 판매자에 프로필에서 제공하는 Service  등록
	 * @methodNamd	:   insertService
	 * @author 		:	Han Gi Seon
	 * @date		:	2024.02.06 
	 * @param ssService
	 * @throws SQLException
	 */
	public void insertService(SellerSupportService ssService) throws SQLException {
		ibatis.insert("seller-profiles.insertService",ssService);
	}
	
//	public void insertServiceSub(SellerSupportService ssService) throws SQLException {
//		ibatis.insert("seller-profiles.insertServiceSub",ssService);
//	}

	
	/**
	 * SellerInfo 판매자에 프로필 정보를 작성한다.
	 * @methodNamd	:   insertInfo
	 * @author 		:	Han Gi Seon
	 * @date		:	2024.02.06
	 * @param sellerInfo
	 * @throws SQLException
	 */
	public void insertInfo(SellerInfo sellerInfo) throws SQLException{
		ibatis.insert("seller-profiles.insertInfo",sellerInfo);
	}
	
	/**
	 * SellerInfo 에 정보를 수정한다
	 * @methodNamd	:   updateSellerInfo
	 * @author 		:	Han Gi Seon
	 * @date		:	2024.02.06
	 * @param sellerInfo
	 * @throws SQLException
	 */
	public void updateSellerInfo(SellerInfo sellerInfo) throws SQLException {
		ibatis.update("seller-profiles.updateSellerInfo",sellerInfo);
	}
	
	/**
	 * sellerInfo 판매자에 service 종류 삭제한다.
	 * @methodNamd	:   deleteServiceBySellerInfo
	 * @author 		:	Han Gi Seon
	 * @date		:	2024.02.07
	 * @param infoNo
	 * @throws SQLException
	 */
	public void deleteServiceBySellerInfo(int infoNo) throws SQLException {
		ibatis.delete("seller-profiles.deleteServiceBySellerInfo",infoNo);
	}
	
	/**
	 * sellerInfo 판매자에 pay 결제방식을 삭제한다
	 * @methodNamd	:   deletePayBySellerInfo
	 * @author 		:	Han Gi Seon
	 * @date		:	2024.02.07
	 * @param infoNo
	 * @throws SQLException
	 */
	public void deletePayBySellerInfo(int infoNo) throws SQLException {
		ibatis.delete("seller-profiles.deletePayBySellerInfo",infoNo);
	}

	/**
	 * 랜덤한 값으로 SellerInfo 에 정보를 List 형식으로 조회한다.
	 * @methodNamd	:   getSellerInfoAll
	 * @author 		:	Han Gi Seon
	 * @date		:	2024.02.08
	 * @return
	 * @throws SQLException
	 */
	@SuppressWarnings("unchecked")
	public List<SellerInfo> getSellerInfoAll() throws SQLException {
		return ibatis.queryForList("seller-profiles.getSellerInfoAll");
	}
}
