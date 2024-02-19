package vo;

public class Building {

	private int no;
	private String name;
	
	public Building() {
		
	}

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
		return "Building [no=" + no + ", name=" + name + "]";
	}
	
	
}
