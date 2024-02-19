package vo;

import java.util.Date;

public class UserEstimate {

	private int no;
	private MovingType movingType;
	private Users users;
	private Date movingDate;
	private String movingFromAddress;
	private Building buildingType;
	private int squareFootage;
	private int floors;
	private int rooms;
	private String movingToAddress;
	private String elevatorYn;
	private String content;
	private Date regDate;
	private Date updatedDate;
	private Date closedDate;
	private double fromLat;
	private double fromLon;
	private double toLat;
	private double toLon;
	
	private String fromZipCode;
	private String fromDetailed;
	private String fromBname;
	
	private String toZipCode;
	private String toDetailed;
	private String toBname;
	
	private String delYn;
	
	
	
	
	public UserEstimate() {}


	public int getNo() {
		return no;
	}


	public void setNo(int no) {
		this.no = no;
	}


	public MovingType getMovingType() {
		return movingType;
	}


	public void setMovingType(MovingType movingType) {
		this.movingType = movingType;
	}


	public Users getUsers() {
		return users;
	}


	public void setUsers(Users users) {
		this.users = users;
	}


	public Date getMovingDate() {
		return movingDate;
	}


	public void setMovingDate(Date movingDate) {
		this.movingDate = movingDate;
	}


	public String getMovingFromAddress() {
		return movingFromAddress;
	}


	public void setMovingFromAddress(String movingFromAddress) {
		this.movingFromAddress = movingFromAddress;
	}


	public Building getBuildingType() {
		return buildingType;
	}


	public void setBuildingType(Building buildingType) {
		this.buildingType = buildingType;
	}


	public int getSquareFootage() {
		return squareFootage;
	}


	public void setSquareFootage(int squareFootage) {
		this.squareFootage = squareFootage;
	}


	public int getFloors() {
		return floors;
	}


	public void setFloors(int floors) {
		this.floors = floors;
	}


	public int getRooms() {
		return rooms;
	}


	public void setRooms(int rooms) {
		this.rooms = rooms;
	}


	public String getMovingToAddress() {
		return movingToAddress;
	}


	public void setMovingToAddress(String movingToAddress) {
		this.movingToAddress = movingToAddress;
	}


	public String getElevatorYn() {
		return elevatorYn;
	}


	public void setElevatorYn(String elevatorYn) {
		this.elevatorYn = elevatorYn;
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


	public Date getUpdatedDate() {
		return updatedDate;
	}


	public void setUpdatedDate(Date updatedDate) {
		this.updatedDate = updatedDate;
	}


	public Date getClosedDate() {
		return closedDate;
	}


	public void setClosedDate(Date closedDate) {
		this.closedDate = closedDate;
	}


	public double getFromLat() {
		return fromLat;
	}


	public void setFromLat(double fromLat) {
		this.fromLat = fromLat;
	}


	public double getFromLon() {
		return fromLon;
	}


	public void setFromLon(double fromLon) {
		this.fromLon = fromLon;
	}


	public double getToLat() {
		return toLat;
	}


	public void setToLat(double toLat) {
		this.toLat = toLat;
	}


	public double getToLon() {
		return toLon;
	}


	public void setToLon(double toLon) {
		this.toLon = toLon;
	}


	public String getFromZipCode() {
		return fromZipCode;
	}


	public void setFromZipCode(String fromZipCode) {
		this.fromZipCode = fromZipCode;
	}


	public String getFromDetailed() {
		return fromDetailed;
	}


	public void setFromDetailed(String fromDetailed) {
		this.fromDetailed = fromDetailed;
	}


	public String getFromBname() {
		return fromBname;
	}


	public void setFromBname(String fromBname) {
		this.fromBname = fromBname;
	}


	public String getToZipCode() {
		return toZipCode;
	}


	public void setToZipCode(String toZipCode) {
		this.toZipCode = toZipCode;
	}


	public String getToDetailed() {
		return toDetailed;
	}


	public void setToDetailed(String toDetailed) {
		this.toDetailed = toDetailed;
	}


	public String getToBname() {
		return toBname;
	}


	public void setToBname(String toBname) {
		this.toBname = toBname;
	}


	public String getDelYn() {
		return delYn;
	}


	public void setDelYn(String delYn) {
		this.delYn = delYn;
	}


	@Override
	public String toString() {
		return "UserEstimate [no=" + no + ", movingType=" + movingType + ", users=" + users + ", movingDate="
				+ movingDate + ", movingFromAddress=" + movingFromAddress + ", buildingType=" + buildingType
				+ ", squareFootage=" + squareFootage + ", floors=" + floors + ", rooms=" + rooms + ", movingToAddress="
				+ movingToAddress + ", elevatorYn=" + elevatorYn + ", content=" + content + ", regDate=" + regDate
				+ ", updatedDate=" + updatedDate + ", closedDate=" + closedDate + ", fromLat=" + fromLat + ", fromLon="
				+ fromLon + ", toLat=" + toLat + ", toLon=" + toLon + ", fromZipCode=" + fromZipCode + ", fromDetailed="
				+ fromDetailed + ", fromBname=" + fromBname + ", toZipCode=" + toZipCode + ", toDetailed=" + toDetailed
				+ ", toBname=" + toBname + ", delYn=" + delYn + "]";
	}


	
	
	
}

