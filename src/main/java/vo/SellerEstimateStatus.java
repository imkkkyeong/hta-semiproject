package vo;

public class SellerEstimateStatus {
	
	private int no;
	private String name;
	
	public SellerEstimateStatus() {}
	
	public int getNo() {
		return no;
	}
	public void setNo(int no) {
		this.no = no;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}

	@Override
	public String toString() {
		return "SellerEstimateStatus [no=" + no + ", name=" + name + "]";
	}
}
