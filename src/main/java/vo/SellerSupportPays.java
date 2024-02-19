package vo;

public class SellerSupportPays {

	SellerInfo sellerInfo;
	Pay pay;
	
	public SellerSupportPays(){}

	public SellerInfo getSellerInfo() {
		return sellerInfo;
	}

	public void setSellerInfo(SellerInfo sellerInfo) {
		this.sellerInfo = sellerInfo;
	}

	public Pay getPay() {
		return pay;
	}

	public void setPay(Pay pay) {
		this.pay = pay;
	}

	@Override
	public String toString() {
		return "SellerSupportPays [sellerInfo=" + sellerInfo + ", pay=" + pay + "]";
	}
	
	
	
	
}
