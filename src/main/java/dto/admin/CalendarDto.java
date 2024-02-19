package dto.admin;

import java.util.Date;

import vo.MovingType;
import vo.SellerEstimate;
import vo.SellerEstimateStatus;
import vo.UserEstimate;
import vo.Users;

public class CalendarDto {
	
	private int estimateNo;
	private String status;
	private Date movingDate;
	private String movingType;
	private String name;
	private String tel;
	
	public CalendarDto() {}

	public int getEstimateNo() {
		return estimateNo;
	}

	public void setEstimateNo(int estimateNo) {
		this.estimateNo = estimateNo;
	}

	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
	}

	public Date getMovingDate() {
		return movingDate;
	}

	public void setMovingDate(Date movingDate) {
		this.movingDate = movingDate;
	}

	public String getMovingType() {
		return movingType;
	}

	public void setMovingType(String movingType) {
		this.movingType = movingType;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getTel() {
		return tel;
	}

	public void setTel(String tel) {
		this.tel = tel;
	}
	
}
