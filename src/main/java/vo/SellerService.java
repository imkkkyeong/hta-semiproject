package vo;

public class SellerService {

	private int no;
	private String name;
	
	public SellerService() {}
	
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
		return "SellerServices [no=" + no + ", name=" + name + "]";
	}
}
