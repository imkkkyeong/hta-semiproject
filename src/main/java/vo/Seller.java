package vo;

import java.util.Date;

public class Seller {
	Integer no;
	String id;
	String password;
	String name;
	String tel;
	String email;
	Date regDate;
	Date updateDate;
	String delYn;
	Integer rsnNo;

	public Seller(){}

	public Seller(Integer no, String id, String password, String name, String tel, String email, Date regDate,
               Date updateDate, String delYn, Integer rsnNo) {
     this.no = no;
     this.id = id;
     this.password = password;
     this.name = name;
     this.tel = tel;
     this.email = email;
     this.regDate = regDate;
     this.updateDate = updateDate;
     this.delYn = delYn;
     this.rsnNo = rsnNo;
 }
	
	
	
	@Override
	public String toString() {
		return "Seller [no=" + no + ", id=" + id + ", password=" + password + ", name=" + name + ", tel=" + tel
				+ ", email=" + email + ", regDate=" + regDate + ", updateDate=" + updateDate + ", delYn=" + delYn
				+ ", rsnNo=" + rsnNo + "]";
	}





	public Integer getNo() {
		return no;
	}


	public void setNo(Integer no) {
		this.no = no;
	}


	public String getId() {
		return id;
	}


	public void setId(String id) {
		this.id = id;
	}


	public String getPassword() {
		return password;
	}


	public void setPassword(String password) {
		this.password = password;
	}


	public String getName() {
		return name;
	}


	public void setName(String name) {
		this.name = name;
	}


	public String getTel() {
		return tel;
	}


	public void setTel(String tel) {
		this.tel = tel;
	}


	public String getEmail() {
		return email;
	}


	public void setEmail(String email) {
		this.email = email;
	}


	public Date getRegDate() {
		return regDate;
	}


	public void setRegDate(Date regDate) {
		this.regDate = regDate;
	}


	public Date getUpdateDate() {
		return updateDate;
	}


	public void setUpdateDate(Date updateDate) {
		this.updateDate = updateDate;
	}


	public String getDelYn() {
		return delYn;
	}


	public void setDelYn(String delYn) {
		this.delYn = delYn;
	}


	public Integer getRsnNo() {
		return rsnNo;
	}


	public void setRsnNo(Integer rsnNo) {
		this.rsnNo = rsnNo;
	}
}
