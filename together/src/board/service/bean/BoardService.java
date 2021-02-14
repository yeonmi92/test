package board.service.bean;

import java.io.IOException;
import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import board.model.dto.BoardDTO;


@Service
public interface BoardService {
	
	public Map getSearchList(String pageNum, int sel, String search, String keyword) throws SQLException;
	public Map getList(String pageNum, int sel) throws SQLException;
	public void modifyArticle(BoardDTO dto) throws SQLException;
	public BoardDTO getArticle(int num) throws SQLException;
	public void deleteArticle(int num) throws SQLException;
	public String getId() throws SQLException;
	public void insertArticle(BoardDTO dto) throws SQLException, IOException;
	public void fileupload(HttpServletRequest request, HttpServletResponse response) throws SQLException;
	public void addReadcount(int board_num) throws SQLException;
	public void writeReply(String replyText, String id, int board_num) throws SQLException;
	public List getReplies(int num) throws SQLException;
	
}
