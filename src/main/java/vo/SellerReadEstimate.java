package vo;

public class SellerReadEstimate {

	private int userEstimateNo;
	private int sellerNo;
	
	public SellerReadEstimate() {}
	
	public int getUserEstimateNo() {
		return userEstimateNo;
	}
	public void setUserEstimateNo(int userEstimateNo) {
		this.userEstimateNo = userEstimateNo;
	}
	public int getSellerNo() {
		return sellerNo;
	}
	public void setSellerNo(int sellerNo) {
		this.sellerNo = sellerNo;
	}

	@Override
	public String toString() {
		return "SellerReadEstimate [userEstimateNo=" + userEstimateNo + ", sellerNo=" + sellerNo + "]";
	}
}
