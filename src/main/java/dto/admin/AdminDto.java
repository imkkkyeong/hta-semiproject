package dto.admin;

public class AdminDto {

	private int no;
	private String id;
	private String name;
	
	public AdminDto() {
	}

	public int getNo() {
		return no;
	}

	public void setNo(int no) {
		this.no = no;
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	@Override
	public String toString() {
		return "LoginAdmin [no=" + no + ", id=" + id + ", name=" + name + "]";
	}
	
}
