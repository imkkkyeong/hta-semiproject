package dto.admin;

import java.util.Date;

public class BookDto {
	
	private int bookNo;
	private String name;
	private String tel;
	private Date updateDate;
	
	public Date getUpdateDate() {
		return updateDate;
	}
	public void setUpdateDate(Date updateDate) {
		this.updateDate = updateDate;
	}
	public int getBookNo() {
		return bookNo;
	}
	public void setBookNo(int bookNo) {
		this.bookNo = bookNo;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getTell() {
		return tel;
	}
	public void setTell(String tell) {
		this.tel = tell;
	}
	
}
