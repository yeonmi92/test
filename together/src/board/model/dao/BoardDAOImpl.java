package board.model.dao;

import java.sql.SQLException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.catalina.core.ApplicationContext;
import org.apache.ibatis.session.SqlSession;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import board.model.dto.BoardDTO;

@Repository
public class BoardDAOImpl implements BoardDAO {
	
	@Autowired
	private SqlSessionTemplate sqlSession = null;
	
	
	@Override
	public List selectAll(int start, int end, int sel) throws SQLException {
		
		HashMap map = new HashMap();
		map.put("start", start);
		map.put("end", end);
		map.put("sel", sel);
		
		List list = null;
		
		list = sqlSession.selectList("board.getList", map);
		
		return list;
	}


	@Override
	public void insertArticle(BoardDTO dto) throws SQLException {
		sqlSession.insert("board.insertArticle", dto);
	}
	

	@Override
	public void deleteArticle(int num) throws SQLException {
		sqlSession.delete("board.delete", num);
	}

	@Override
	public int getArticleCount(int sel) throws SQLException {
		
		System.out.println("dao getArticleCount sel : " + sel);
		
		int count = sqlSession.selectOne("board.getCount", sel);
		
		System.out.println("dao getCount: " + count);
		
		return count;
	}

	@Override
	public BoardDTO getArticle(int num) throws SQLException {
		BoardDTO article = sqlSession.selectOne("board.getArticle", num);
		return article;
	}

	@Override
	public void modifyArticle(BoardDTO dto) throws SQLException {
		sqlSession.update("board.updateArticle", dto);
	}

	@Override
	public void addReadcount(int board_num) throws SQLException {
		sqlSession.update("board.addReadcount", board_num);
	}


	@Override
	public int getSearchArticleCount(Map map) throws SQLException {
		int count = sqlSession.selectOne("board.searchCnt", map);
		System.out.println("search count dao : " + count);
		return count;
	}


	@Override
	public List selectSearch(Map map) throws SQLException {
		
		List list = sqlSession.selectList("board.searchList", map);
		
		System.out.println("search list count : " + list.size());
		
		return list;
	}


	@Override
	public void writeReply(Map map) throws SQLException {
		sqlSession.insert("board.writeReply", map);
	}


	@Override
	public List getReplies(int num) throws SQLException {
		List replies = sqlSession.selectList("board.getReplies", num);
		return replies;
	}


	@Override
	public List getNotice() throws SQLException {
		List notice = sqlSession.selectList("board.getNotice");
		return notice;
	}

	public void test() throws SQLException {
		
		// 사용자가 분류 선택을 하지 않음
		System.out.println("1. 사용자가 분류 선택을 하지 않음");	
		List listAll = selectAll(1, 10, 2);
		System.out.println("분류	제목	작성자		작성 날짜");
		for(int i = 0; i < listAll.size(); i++) {
			BoardDTO dto = (BoardDTO)listAll.get(i);
			System.out.println(dto.getSel() + "" + dto.getTitle() + "" + dto.getId() + "" + dto.getReg());
		}
		
		
		
		// 사용자가 일반 분류 선택
		
		// 사용자가 후기 분류 선택
		
		// 사용자가 분류 선택을 하고, 검색 기능을 사용함.
		
		
		
		
		
		
	}

	



}
