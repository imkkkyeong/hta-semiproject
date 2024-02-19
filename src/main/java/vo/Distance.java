package vo;

public class Distance {
	private int no;
	private String name;
	
	public Distance(){}
	
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
		return "Distance [no=" + no + ", name=" + name + "]";
	}
	
}