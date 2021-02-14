package csboard.model.dao;

import java.sql.SQLException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import csboard.model.dto.CsBoardDTO;
import csboard.model.dto.Paging;

@Repository
public class CsBoardDAOImpl implements CsBoardDAO {
	
	@Autowired
	private SqlSessionTemplate session = null;
	
	// csboard 게시판 리스트
	@Override
	public Paging csList(String pageNum, int sel, String type, String search) throws SQLException {
		// TODO Auto-generated method stub
		return null;
	}
	
	// csboard 게시판 검색 개수
	@Override
	public int getSearchArticleCount(String type, String search) throws SQLException {
		HashMap map = new HashMap();
		map.put("type", type);
		map.put("search", search);
		int count = session.selectOne("csboard.getSearchArticleCount", map);
		return count;
	}
	
	// csboard 게시판 검색 결과 
	@Override
	public List getSearchArticles(int start, int end, String type, String search) throws SQLException {
		HashMap map = new HashMap();
		map.put("start", start);
		map.put("end", end);	
		map.put("type", type);
		map.put("search", search);
		List list = session.selectList("csboard.getSearchArticles", map);		
		return list;
	}
	
	// csboard 게시판 글 전체 개수
	@Override
	public int getArticleCount(int sel) throws SQLException {
		int count = session.selectOne("csboard.countAll", sel);
		return count;
	}
	
	// csboard 게시판 글 처음, 끝
	public List getArticles(int start, int end, int sel) throws SQLException {
		HashMap map = new HashMap();
		map.put("start", start);
		map.put("end", end);	
		map.put("sel", sel);	
		List list = session.selectList("csboard.selectAll", map);		
		return list;
	}
	
	// csboard 게시판 글 작성
	@Override
	public void insertCs(CsBoardDTO csboardDTO) throws SQLException {
		session.insert("csboard.insertCs", csboardDTO);
	}
	
	// csboard 게시판 글 정보(1개)
	@Override
	public CsBoardDTO getArticle(int cs_num) throws SQLException {
		CsBoardDTO csboardDTO = session.selectOne("csboard.selectOne", cs_num);
		return csboardDTO;
	}
	
	// csboard 게시판 글 수정
	@Override
	public void modifyCs(CsBoardDTO csboardDTO) throws SQLException {
		session.update("csboard.updateOne", csboardDTO);
	}
	
	// csboard 게시판 글 삭제
	public int deleteCs(int cs_num) throws SQLException {
		int result = session.delete("csboard.deleteCs", cs_num);
		return result;
	}
	
	// csboard 댓글
	@Override
	public void reply(int cs_num, String replyText) throws SQLException {
		HashMap map = new HashMap();
		map.put("cs_num", cs_num);
		map.put("reply", replyText);
		session.update("csboard.reply", map);
	}
	
	// csboard 조회수
	@Override
	public void readcountCs(int cs_num) throws SQLException {
		session.update("csboard.readcountCs", cs_num);
	}	
}
