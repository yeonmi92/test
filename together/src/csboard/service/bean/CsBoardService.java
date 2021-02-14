package csboard.service.bean;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import org.springframework.ui.Model;

import csboard.model.dto.CsBoardDTO;
import csboard.model.dto.Paging;

public interface CsBoardService {	
	// csboard 게시판 리스트
	public Paging csList(String pageNum, int sel, String type, String search) throws SQLException;
	
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
