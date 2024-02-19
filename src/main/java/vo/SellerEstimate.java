package vo;

import java.sql.Date;

public class SellerEstimate {
	
	private int sellerEstimateNo;
	private Seller seller;
	private UserEstimate userEstimate;
	private String amountSetting;
	private int amount;
	private String content;
	private Date regDate;
	private Date updateDate;
	private SellerEstimateStatus status;
	
	public SellerEstimate() {}

	public int getSellerEstimateNo() {
		return sellerEstimateNo;
	}

	public void setSellerEstimateNo(int sellerEstimateNo) {
		this.sellerEstimateNo = sellerEstimateNo;
	}

	public Seller getSeller() {
		return seller;
	}

	public void setSeller(Seller seller) {
		this.seller = seller;
	}

	public UserEstimate getUserEstimate() {
		return userEstimate;
	}

	public void setUserEstimate(UserEstimate userEstimate) {
		this.userEstimate = userEstimate;
	}

	public String getAmountSetting() {
		return amountSetting;
	}

	public void setAmountSetting(String amountSetting) {
		this.amountSetting = amountSetting;
	}

	public int getAmount() {
		return amount;
	}

	public void setAmount(int amount) {
		this.amount = amount;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public Date getRegDate() {
		return regDate;
	}

	public void setRegDate(Date regDate) {
		this.regDate = regDate;
	}

	public Date getUpdateDate() {
		return updateDate;
	}

	public void setUpdateDate(Date updateDate) {
		this.updateDate = updateDate;
	}

	public SellerEstimateStatus getStatus() {
		return status;
	}

	public void setStatus(SellerEstimateStatus status) {
		this.status = status;
	}

	@Override
	public String toString() {
		return "SellerEstimate [sellerEstimateNo=" + sellerEstimateNo + ", seller=" + seller + ", userEstimate="
				+ userEstimate + ", amountSetting=" + amountSetting + ", amount=" + amount + ", content=" + content
				+ ", regDate=" + regDate + ", updateDate=" + updateDate + ", status=" + status + "]";
	}
	
}
