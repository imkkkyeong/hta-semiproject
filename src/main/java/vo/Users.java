package vo;

import java.util.Date;

public class Users {
	private int no;
	private String id;
	private String pwd;
	private String name;
	private String email;
	private String tel;
	private String delYn;
	private Date updateDate;
	private Date regDate;
	private String zipcode;
	private String address;
	private String bname;
	private String detailed;
	private String userImgPath;
	
	public Users() {}

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

	public String getPwd() {
		return pwd;
	}

	public void setPwd(String pwd) {
		this.pwd = pwd;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getTel() {
		return tel;
	}

	public void setTel(String tel) {
		this.tel = tel;
	}

	public String getDelYn() {
		return delYn;
	}

	public void setDelYn(String delYn) {
		this.delYn = delYn;
	}

	public Date getUpdateDate() {
		return updateDate;
	}

	public void setUpdateDate(Date updateDate) {
		this.updateDate = updateDate;
	}

	public Date getRegDate() {
		return regDate;
	}

	public void setRegDate(Date regDate) {
		this.regDate = regDate;
	}

	public String getZipcode() {
		return zipcode;
	}

	public void setZipcode(String zipcode) {
		this.zipcode = zipcode;
	}

	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address;
	}

	public String getBname() {
		return bname;
	}

	public void setBname(String bname) {
		this.bname = bname;
	}

	public String getDetailed() {
		return detailed;
	}

	public void setDetailed(String detailed) {
		this.detailed = detailed;
	}

	public String getUserImgPath() {
		return userImgPath;
	}

	public void setUserImgPath(String userImgPath) {
		this.userImgPath = userImgPath;
	}

	@Override
	public String toString() {
		return "Users [no=" + no + ", id=" + id + ", pwd=" + pwd + ", name=" + name + ", email=" + email + ", tel="
				+ tel + ", delYn=" + delYn + ", updateDate=" + updateDate + ", regDate=" + regDate + ", zipcode="
				+ zipcode + ", address=" + address + ", bname=" + bname + ", detailed=" + detailed + ", userImgPath="
				+ userImgPath + "]";
	}

	
}
	