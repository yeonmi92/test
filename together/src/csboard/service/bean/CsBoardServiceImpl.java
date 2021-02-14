package csboard.service.bean;

import java.sql.SQLException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Isolation;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.Model;

import csboard.model.dao.CsBoardDAO;
import csboard.model.dto.CsBoardDTO;
import csboard.model.dto.Paging;

@Service
public class CsBoardServiceImpl implements CsBoardService{
	
	@Autowired
	private CsBoardDAO csboardDAO = null;
	
	// csboard 게시판 리스트
	@Override
	public Paging csList(String pageNum, int sel, String type, String search) throws SQLException {
		if(pageNum == null) {
			pageNum = "1";
		}
		
		int pageSize = 10;
		int currPage = Integer.parseInt(pageNum);
		int startRow = (currPage - 1) * pageSize + 1;
		int endRow = currPage * pageSize;
		int number = 0;
				
		List csboardList = null;
		int count = 0;
		Paging paging = new Paging();		
		
		if(type != null && search != null) { // 검색 리스트
			count = csboardDAO.getSearchArticleCount(type, search);			
			if(count > 0) { 
				csboardList = csboardDAO.getSearchArticles(startRow, endRow, type, search);
			}
		}else {	// 일반 리스트
			count = csboardDAO.getArticleCount(sel);
			if(count > 0) { 
				csboardList = csboardDAO.getArticles(startRow, endRow, sel);
			}
		}
		
		number = count - (currPage - 1) * pageSize;		
		paging.setPageNum(pageNum);
		paging.setPageSize(pageSize);
		paging.setCurrPage(currPage);
		paging.setStartRow(startRow);
		paging.setEndRow(endRow);
		paging.setCount(count);
		paging.setNumber(number);
		paging.setType(type);
		paging.setSearch(search);
		paging.setCsboardList(csboardList);
		
		return paging;
	}
	
	// csboard 게시판 글 작성
	@Override
	public void insertCs(CsBoardDTO csboardDTO) throws SQLException {
		String subject = csboardDTO.getSubject();
		int sel = csboardDTO.getSel();
		String id = csboardDTO.getId();
		String content = csboardDTO.getContent();
		csboardDTO.setSubject(subject);
		csboardDTO.setSel(sel);
		csboardDTO.setId(id);
		csboardDTO.setContent(content);
		csboardDAO.insertCs(csboardDTO);
	}
	
	// csboard 게시판 글 정보(1개)
	@Override
	public CsBoardDTO getArticle(int cs_num) throws SQLException {
		CsBoardDTO csboardDTO = csboardDAO.getArticle(cs_num);
		return csboardDTO;
	}
	
	// csboard 게시판 글 수정
	@Override
	public void modifyCs(CsBoardDTO csboardDTO) throws SQLException {
		csboardDAO.modifyCs(csboardDTO);
	}	

	// csboard 게시판 글 삭제
	@Override
	public int deleteCs(int cs_num) throws SQLException {
		return csboardDAO.deleteCs(cs_num);
	}	

	// csboard 댓글
	@Override
	public void reply(int cs_num, String replyText) throws SQLException {
		csboardDAO.reply(cs_num, replyText);
	}

	// csboard 조회수
	@Override
	public void readcountCs(int cs_num) throws SQLException {
		csboardDAO.readcountCs(cs_num);
	}
}
