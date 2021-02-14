package csboard.model.dao;

import java.sql.SQLException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import csboard.model.dto.CsBoardDTO;
import csboard.model.dto.Paging;

public interface CsBoardDAO {
	// csboard 게시판 리스트	
	public Paging csList(String pageNum, int sel, String type, String search) throws SQLException;
	
	// csboard 게시판 검색 개수
	public int getSearchArticleCount(String type, String search) throws SQLException;
	
	// csboard 게시판 검색 결과 
	public List getSearchArticles(int start, int end, String type, String search) throws SQLException;
	
	// csboard 게시판 글 전체 개수	
	public int getArticleCount(int sel) throws SQLException;
	
	// csboard 게시판 글 처음, 끝
	public List getArticles(int start, int end, int sel) throws SQLException;
	
	// csboard 게시판 글 작성
	public void insertCs(CsBoardDTO csboardDTO) throws SQLException;
	
	// csboard 게시판 글 정보(1개)
	public CsBoardDTO getArticle(int cs_num) throws SQLException;
	
	// csboard 게시판 글 수정
	public void modifyCs(CsBoardDTO csboardDTO) throws SQLException;
	
	// csboard 게시판 글 삭제
	public int deleteCs(int cs_num) throws SQLException;
	
	// csboard 댓글
	public void reply(int cs_num, String replyText) throws SQLException;
	
	// csboard 조회수
	public void readcountCs(int cs_num) throws SQLException;
}
