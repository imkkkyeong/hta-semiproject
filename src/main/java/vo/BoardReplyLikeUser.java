package vo;

public class BoardReplyLikeUser {
	private BoardReply boardReply;
	private Users users;
	
	public BoardReplyLikeUser () {}
	
	public BoardReply getBoardReply() {
		return boardReply;
	}
	public void setBoardReply(BoardReply boardReply) {
		this.boardReply = boardReply;
	}
	public Users getUsers() {
		return users;
	}
	public void setUsers(Users users) {
		this.users = users;
	}
	
	
}
