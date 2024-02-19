package vo;

public class Bank {
	private int no;
	private String name;
	
	public Bank(){}
	
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
		return "Bank [no=" + no + ", name=" + name + "]";
	}
}