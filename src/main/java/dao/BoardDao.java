package dao;

import vo.Board;
import vo.BoardCategory;
import vo.Location;
import vo.SellerService;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import com.ibatis.sqlmap.client.SqlMapClient;

import ibatis.IbatisUtil;

public class BoardDao {
	private SqlMapClient ibatis = IbatisUtil.getSqlMapClient();

    /**
     * 신규 게시글 정보가 포함된 Board 객체를 전달받아 게시글 정보를 테이블에 저장한다
     *
     * @param board 신규 게시글 정보가 포함된 Board 객체
     * @throws SQLException
     */
    public void insertBoard(Board board) throws SQLException {
        ibatis.insert("boards.insertBoard", board);

    }
   
    
    /**
     * getAllBoardCategories() 메서드는 Boardcategory의 이름과 번호를 전체 조회한다
     * @return
     * @throws SQLException
     */
    @SuppressWarnings("unchecked")
	public List<BoardCategory> getAllBoardCategories() throws SQLException {
    	return (List<BoardCategory>)ibatis.queryForList("boards.getAllBoardCategories");
    }
    
    /**
     * getSidoLocations() 메서드는 Location의 이름과 번호를 전체 조회한다.
     * @return
     * @throws SQLException
     */
    @SuppressWarnings("unchecked")
	public List<Location> getSidoLocations() throws SQLException {
    	return (List<Location>)ibatis.queryForList("boards.getSidoLocations");
    }
    
    
    /**
     * 지정된 게시글 번호에 해당하는 게시글 상세정보를 조회해서 반환
     *
     * @param no 조회할 게시글 번호
     * @return 게시글 정보를 포함하는 Board객체
     * @throws SQLException
     */

    public Board getBoardByNo(int no) throws SQLException {
        return (Board) ibatis.queryForObject("boards.getBoardByNo", no);
    }
    
    /**
     * 게시글 전체 행 갯수 반환(게시판 list에서 사용)
     *
     * @return 전체 행 개수
     * @throws SQLException
     */
    public int getTotalRows(Map<String,Object> param) throws SQLException {
        return (Integer) ibatis.queryForObject("boards.getTotalRows",param);
    }
    
    
    public int getBoardNo() throws SQLException {
    	return (Integer) ibatis.queryForObject("boards.getBoardNo");
    }
   
   
    /**
     * 게시글 목록을 반환(게시판 list에서 사용)
     *
     * @param param
     * @return 게시글 목록
     * @throws SQLException
     */
    
    @SuppressWarnings("unchecked")
    public List<Board> getBoards(Map<String, Object> param) throws SQLException {
        return (List<Board>) ibatis.queryForList("boards.getBoards", param);
    }

	public void updateBoard(Board board) throws SQLException {
	    ibatis.update("boards.updateBoard", board);
	}
	
	@SuppressWarnings("unchecked")
	   public List<Board> getRandomBoard() throws SQLException {
	      return (List<Board>)ibatis.queryForList("boards.getRandomBoard");
	   }

}

