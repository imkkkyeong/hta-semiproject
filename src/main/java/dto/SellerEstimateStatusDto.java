package dto;

import java.util.Date;

public class SellerEstimateStatusDto {

	private int sellerEstimateNo;
	private int userEstimateNo;
	private String userName;
	private int userEstimateExpectedAmount;
	private int sellerEstimateAmount;
	private Date userEstimateMovingDate;
	
	public SellerEstimateStatusDto() {}
	
	public int getSellerEstimateNo() {
		return sellerEstimateNo;
	}
	public void setSellerEstimateNo(int sellerEstimateNo) {
		this.sellerEstimateNo = sellerEstimateNo;
	}
	public int getUserEstimateNo() {
		return userEstimateNo;
	}
	public void setUserEstimateNo(int userEstimateNo) {
		this.userEstimateNo = userEstimateNo;
	}
	public String getUserName() {
		return userName;
	}
	public void setUserName(String userName) {
		this.userName = userName;
	}
	public int getUserEstimateExpectedAmount() {
		return userEstimateExpectedAmount;
	}
	public void setUserEstimateExpectedAmount(int userEstimateExpectedAmount) {
		this.userEstimateExpectedAmount = userEstimateExpectedAmount;
	}
	public int getSellerEstimateAmount() {
		return sellerEstimateAmount;
	}
	public void setSellerEstimateAmount(int sellerEstimateAmount) {
		this.sellerEstimateAmount = sellerEstimateAmount;
	}
	public Date getUserEstimateMovingDate() {
		return userEstimateMovingDate;
	}
	public void setUserEstimateMovingDate(Date userEstimateMovingDate) {
		this.userEstimateMovingDate = userEstimateMovingDate;
	}

	@Override
	public String toString() {
		return "SellerEstimateStatusDto [sellerEstimateNo=" + sellerEstimateNo + ", userEstimateNo=" + userEstimateNo
				+ ", userName=" + userName + ", userEstimateExpectedAmount=" + userEstimateExpectedAmount
				+ ", sellerEstimateAmount=" + sellerEstimateAmount + ", userEstimateMovingDate="
				+ userEstimateMovingDate + "]";
	}

}
