package board.model.dao;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import board.model.dto.BoardDTO;

public interface BoardDAO {
	
	public List selectAll(int start, int end, int sel) throws SQLException;
	public List getNotice() throws SQLException;
	public void insertArticle(BoardDTO dto) throws SQLException;
	public void deleteArticle(int num) throws SQLException;
	public int getArticleCount(int sel) throws SQLException;
	public int getSearchArticleCount(Map map) throws SQLException;	
	public List selectSearch(Map map) throws SQLException;		
	public BoardDTO getArticle(int num) throws SQLException;
	public void modifyArticle(BoardDTO dto) throws SQLException;
	public void addReadcount(int board_num) throws SQLException;
	public void writeReply(Map map) throws SQLException;
	public List getReplies(int num) throws SQLException;
}
