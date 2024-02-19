package vo;

public class SellerInfo {
	
	private int infoNo;
	// seller 테이블의 sellerNo 보다는 Seller seller 객체로 
	private Seller seller;
	private String nickname;
	private String memo;
	private String address;
	private Distance distance; // distance Name 이 필요 하기에 Distance distance로
	private int hireEmployeeCnt;
	private String description;
	private String businessNo;
	private int experienceYear;
	private String bankAccount; // 사업자 번호 
	private Bank bank;	// Bank No가 아닌 Bank bank를 통해 bankName 가져올수있게
	private String mainImgPath;
	
	public SellerInfo(){}
	
	public int getInfoNo() {
		return infoNo;
	}
	public void setInfoNo(int infoNo) {
		this.infoNo = infoNo;
	}
	public Seller getSeller() {
		return seller;
	}
	public void setSeller(Seller seller) {
		this.seller = seller;
	}
	public String getNickname() {
		return nickname;
	}
	public void setNickname(String nickname) {
		this.nickname = nickname;
	}
	public String getMemo() {
		return memo;
	}
	public void setMemo(String memo) {
		this.memo = memo;
	}
	public String getAddress() {
		return address;
	}
	public void setAddress(String address) {
		this.address = address;
	}
	public Distance getDistance() {
		return distance;
	}
	public void setDistance(Distance distance) {
		this.distance = distance;
	}
	public int getHireEmployeeCnt() {
		return hireEmployeeCnt;
	}
	public void setHireEmployeeCnt(int hireEmployeeCnt) {
		this.hireEmployeeCnt = hireEmployeeCnt;
	}
	public String getDescription() {
		return description;
	}
	public void setDescription(String description) {
		this.description = description;
	}
	public String getBusinessNo() {
		return businessNo;
	}
	public void setBusinessNo(String businessNo) {
		this.businessNo = businessNo;
	}
	public int getExperienceYear() {
		return experienceYear;
	}
	public void setExperienceYear(int experienceYear) {
		this.experienceYear = experienceYear;
	}
	public String getBankAccount() {
		return bankAccount;
	}
	public void setBankAccount(String bankAccount) {
		this.bankAccount = bankAccount;
	}
	public Bank getBank() {
		return bank;
	}
	public void setBank(Bank bank) {
		this.bank = bank;
	}
	public String getMainImgPath() {
		return mainImgPath;
	}
	public void setMainImgPath(String mainImgPath) {
		this.mainImgPath = mainImgPath;
	}
	
	@Override
	public String toString() {
		return "SellerInfo [infoNo=" + infoNo + ", seller=" + seller + ", nickname=" + nickname + ", memo=" + memo
				+ ", address=" + address + ", distance=" + distance + ", hireEmployeeCnt=" + hireEmployeeCnt
				+ ", description=" + description + ", businessNo=" + businessNo + ", experienceYear=" + experienceYear
				+ ", bankAccount=" + bankAccount + ", bank=" + bank + ", mainImgPath=" + mainImgPath + "]";
	}
}
