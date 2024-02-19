package vo;

public class MovingType {

	private int no;
	private String name;
	
	public MovingType() {}

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
		return "MovingType [no=" + no + ", name=" + name + "]";
	}
	
	
}
