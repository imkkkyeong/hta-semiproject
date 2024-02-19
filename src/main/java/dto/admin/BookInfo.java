package dto.admin;

import java.util.Date;

public class BookInfo {
	
	private int bookNo;
	private String userName;
	private String userId;
	private String userTel;
	private Date movingDate;
	private int buildingTypeNo;
	private String buildingTypeName;
	private double squareFootage;
	private int floor;
	private int roomCnt;
	private String hasElevator;
	private String content;
	
	public int getBookNo() {
		return bookNo;
	}
	public void setBookNo(int bookNo) {
		this.bookNo = bookNo;
	}
	public String getUserName() {
		return userName;
	}
	public void setUserName(String userName) {
		this.userName = userName;
	}
	public String getUserId() {
		return userId;
	}
	public void setUserId(String userId) {
		this.userId = userId;
	}
	public String getUserTel() {
		return userTel;
	}
	public void setUserTel(String userTel) {
		this.userTel = userTel;
	}
	public Date getMovingDate() {
		return movingDate;
	}
	public void setMovingDate(Date movingDate) {
		this.movingDate = movingDate;
	}
	public int getBuildingTypeNo() {
		return buildingTypeNo;
	}
	public void setBuildingTypeNo(int buildingTypeNo) {
		this.buildingTypeNo = buildingTypeNo;
	}
	public String getBuildingTypeName() {
		return buildingTypeName;
	}
	public void setBuildingTypeName(String buildingTypeName) {
		this.buildingTypeName = buildingTypeName;
	}
	public double getSquareFootage() {
		return squareFootage;
	}
	public void setSquareFootage(double squareFootage) {
		this.squareFootage = squareFootage;
	}
	public int getFloor() {
		return floor;
	}
	public void setFloor(int floor) {
		this.floor = floor;
	}
	public int getRoomCnt() {
		return roomCnt;
	}
	public void setRoomCnt(int roomCnt) {
		this.roomCnt = roomCnt;
	}
	public String getHasElevator() {
		return hasElevator;
	}
	public void setHasElevator(String hasElevator) {
		this.hasElevator = hasElevator;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	
	
}
