package vo;

import java.util.Date;

public class Board {
	private long no;
	private String title; 
	private String content;
	private Users users;
	private int viewCnt;
	private int likeCnt;
	private BoardCategory boardCategory;
	private SellerService sellerService;
	private Location location;
	private String delYn;
	private Date updateDate;
	private Date regDate;
	private int replyCnt;
	


	public Board() {}


	public long getNo() {
		return no;
	}


	public void setNo(int no) {
		this.no = no;
	}


	public String getTitle() {
		return title;
	}


	public void setTitle(String title) {
		this.title = title;
	}


	public String getContent() {
		return content;
	}


	public void setContent(String content) {
		this.content = content;
	}


	public Users getUsers() {
		return users;
	}


	public void setUsers(Users users) {
		this.users = users;
	}


	public int getViewCnt() {
		return viewCnt;
	}


	public void setViewCnt(int viewCnt) {
		this.viewCnt = viewCnt;
	}


	public int getLikeCnt() {
		return likeCnt;
	}


	public void setLikeCnt(int likeCnt) {
		this.likeCnt = likeCnt;
	}


	public BoardCategory getBoardCategory() {
		return boardCategory;
	}


	public void setBoardCategory(BoardCategory boardCategory) {
		this.boardCategory = boardCategory;
	}

	public SellerService getSellerService() {
		return sellerService;
	}


	public void setSellerService(SellerService sellerService) {
		this.sellerService = sellerService;
	}

	public Location getLocation() {
		return location;
	}


	public void setLocation(Location location) {
		this.location = location;
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
	
	public int getReplyCnt() {
		return replyCnt;
	}


	public void setReplyCnt(int replyCnt) {
		this.replyCnt = replyCnt;
	}
}

