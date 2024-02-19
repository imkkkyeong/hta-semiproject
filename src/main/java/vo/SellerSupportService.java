package vo;

public class SellerSupportService {
	
	SellerInfo sellerInfo;	// seller_info 테이블에 seller_INFO_NO 
	SellerService service;  // seller_service 테이블에 int no 
	String mostSerivceYn;
	
	public SellerSupportService(){}
	
	public SellerInfo getSellerInfo() {
		return sellerInfo;
	}
	
	public void setSellerInfo(SellerInfo sellerInfo) {
		this.sellerInfo = sellerInfo;
	}
	
	public SellerService getService() {
		return service;
	}
	
	public void setService(SellerService service) {
		this.service = service;
	}

	public String getMostSerivceYn() {
		return mostSerivceYn;
	}

	public void setMostSerivceYn(String mostSerivceYn) {
		this.mostSerivceYn = mostSerivceYn;
	}


	
}
