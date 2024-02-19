package dao.admin;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import com.ibatis.sqlmap.client.SqlMapClient;

import dto.admin.BookDto;
import dto.admin.BookInfo;
import dto.admin.CalendarDto;
import ibatis.IbatisUtil;
import vo.admin.BookStatus;
import vo.admin.BuildingType;

public class BookStatusDao {

private SqlMapClient ibatis = IbatisUtil.getSqlMapClient();
	
	public List<CalendarDto> getBooksByNo(int param) throws SQLException {
		return (List<CalendarDto>) ibatis.queryForList("books.getBooksByNo", param);
	}
	
	public List<BookDto> getBooks(Map<String, Object> param) throws SQLException {
		return (List<BookDto>) ibatis.queryForList("books.getBooks", param);
	}
	
	// modifyform.jsp에서 사용 -----------------------------------------------------------------------------
	
	public List<BuildingType> getAllBuildingTypes() throws SQLException {
		return (List<BuildingType>) ibatis.queryForList("books.getAllBuildingTypes");
	}
	
	public BookInfo getBookInfoByNo(int bookNo) throws SQLException {
		return (BookInfo) ibatis.queryForObject("books.getBookInfoByNo", bookNo);
	}
	
	public void updateUserEstimateByBookInfo(BookInfo bookInfo) throws SQLException {
		ibatis.update("books.updateUserEstimateByBookInfo", bookInfo);
	}
	
	// ---------------------------------------------------------------------------------------------------
	
	
	// delete.jsp에서 사용 ---------------------------------------------------------------------------------
	
	public void updateUserEstimateDelYNByBookNo(int bookNo) throws SQLException {
		ibatis.delete("books.updateUserEstimateDelYNByBookNo", bookNo);
	}
	
	// ---------------------------------------------------------------------------------------------------
	
	public int getTotalRows(Map<String, Object> param) throws SQLException {
		return (Integer) ibatis.queryForObject("books.getTotalRows", param);
	}
	
}
