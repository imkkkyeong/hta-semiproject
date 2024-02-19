package dto;

import java.util.Date;

public class SellerDepositDto {
	
	private int sellerEstimateNo;
	private String userName;
	private int sellerEstimateAmount;
	private Date userEstimateMovingDate;
	
	public SellerDepositDto() {}

	public int getSellerEstimateNo() {
		return sellerEstimateNo;
	}

	public void setSellerEstimateNo(int sellerEstimateNo) {
		this.sellerEstimateNo = sellerEstimateNo;
	}

	public String getUserName() {
		return userName;
	}

	public void setUserName(String userName) {
		this.userName = userName;
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
		return "SellerDepositDto [sellerEstimateNo=" + sellerEstimateNo + ", userName=" + userName
				+ ", sellerEstimateAmount=" + sellerEstimateAmount + ", userEstimateMovingDate="
				+ userEstimateMovingDate + "]";
	}
	
}
