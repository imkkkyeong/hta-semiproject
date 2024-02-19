package dto;

import java.util.List;

import vo.Pay;
import vo.SellerSupportService;

public class SellerSupportDto {

	List<SellerSupportService> supportServices;
	List<Pay> supportPays;
	
	public SellerSupportDto() {}
	
	public void setSupportServices(List<SellerSupportService> supportServices) {
		this.supportServices = supportServices;
	}
	
	public void setSupportPays(List<Pay> supportPays) {
		this.supportPays = supportPays;
	}
	
	/**
	 * 대표 서비스 번호를 반환하는 메소드
	 * @return
	 */
	public int getMostServiceNo() {
		int sellerMostServiceNo = 0;
		for (SellerSupportService supportService : supportServices) {
			if ("Y".equals(supportService.getMostSerivceYn())) {
				sellerMostServiceNo = supportService.getService().getNo();
			}
		}
		return sellerMostServiceNo;
	}
	
	/**
	 * 서비스 번호를 전달받아서 해당 서비스를 지원하는 여부를 반환한다.
	 * @param serviceNo 서비스번호
	 * @return 지원여부
	 */
	public boolean isSupportService(int serviceNo) {
		if (serviceNo == getMostServiceNo()) {
			return false;
		}
		for (SellerSupportService supportService : supportServices) {
			if (supportService.getService().getNo() == serviceNo) {
				return true;
			}
		}
		return false;
	}
	
	public boolean isSupportPay(int payNo) {
		for (Pay pay : supportPays) {
			if (pay.getNo() == payNo) {
				return true;
			}
		}
		return false;
	}
}
