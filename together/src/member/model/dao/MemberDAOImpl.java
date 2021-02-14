package member.model.dao;

import java.sql.SQLException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import member.model.dto.MemberDTO;

@Repository
public class MemberDAOImpl implements MemberDAO {

	@Autowired
	private SqlSessionTemplate sqlSession = null;
	
	@Override
	public void insertMember(MemberDTO dto) throws SQLException {
		
		sqlSession.insert("member.insertMember", dto);
	}

	@Override
	public void updateMember(MemberDTO dto) throws SQLException {

		sqlSession.update("member.updateMember", dto);
	}

	@Override
	public void deleteMember() throws SQLException {
		// TODO Auto-generated method stub
		
	}

	@Override
	public int login(MemberDTO dto) throws SQLException {

		int result = sqlSession.selectOne("member.idPwCheck", dto);
		
		return result;
		
	}

	@Override
	public void logout() throws SQLException {
		// TODO Auto-generated method stub
		
	}

	@Override
	public MemberDTO myInfoView(String id) throws SQLException {

		MemberDTO dto = sqlSession.selectOne("member.selectMember", id);
		
		return dto;
	}

	@Override
	public List memberList() throws SQLException {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public List reviewList(String id) throws SQLException {

		List reviewList = sqlSession.selectList("member.reviewList", id);		
		
		return reviewList;
	}

	@Override
	public void insertReview(String reviewId, String review, String val, String id) throws SQLException {
		HashMap map = new HashMap();
		if(val.equals('1')) { // 추천
			sqlSession.update("member.likes", reviewId);
			int likes = sqlSession.selectOne("member.getlikes", reviewId);
			if(likes > 10 && likes <= 20) {
				sqlSession.update("member.grade", reviewId);
				map.put("reviewId", reviewId);
				map.put("review", review);
				map.put("val", val);
				map.put("memId", id);
				sqlSession.insert("member.insertReview", map);
			}else if(likes >= 21 && likes <= 30) {
				sqlSession.update("member.grade", reviewId);
				map.put("reviewId", reviewId);
				map.put("review", review);
				map.put("val", val);
				map.put("memId", id);
				sqlSession.insert("member.insertReview", map);
			}else if(likes >= 31 && likes <= 40) {
				sqlSession.update("member.grade", reviewId);
				map.put("reviewId", reviewId);
				map.put("review", review);
				map.put("val", val);
				map.put("memId", id);
				sqlSession.insert("member.insertReview", map);
			}else if(likes >= 41 && likes <= 50) {
				sqlSession.update("member.grade", reviewId);
				map.put("reviewId", reviewId);
				map.put("review", review);
				map.put("val", val);
				map.put("memId", id);
				sqlSession.insert("member.insertReview", map);
			}else {
				map.put("reviewId", reviewId);
				map.put("review", review);
				map.put("val", val);
				map.put("memId", id);
				sqlSession.insert("member.insertReview", map);
			}
		}else {	// 비추천
			map.put("reviewId", reviewId);
			map.put("review", review);
			map.put("val", val);
			map.put("memId", id);
			sqlSession.insert("member.insertReview", map);			
		}		
	}

	@Override
	public HashMap historyList(String id, String sel, String search, String sort) throws SQLException {
		
		HashMap hm = new HashMap();
		int count = 0;
		List history = null;
		System.out.println("sort : " + sort);
		if(sel != null && search != null) {
			HashMap map = new HashMap();
			map.put("id", id);
			map.put("sel", sel);
			map.put("search", search);
			map.put("sort", sort);

			history = sqlSession.selectList("member.allMapSearchList", map);
			count = sqlSession.selectOne("member.allMapSearchCount", map);
			hm.put("history", history);
			hm.put("count", count);
			
		}else {
			history = sqlSession.selectList("member.allMapList", id);
			count = sqlSession.selectOne("member.allMapCount", id);
			hm.put("history", history);
			hm.put("count", count);
		}
		
		return hm;
	}

	@Override
	public List blackList(String id) throws SQLException {
		List blackList = sqlSession.selectList("member.blackList", id);
		return blackList;
	}

	@Override
	public void deleteBlack() throws SQLException {
		// TODO Auto-generated method stub
		
	}

	@Override
	public List searchBlack() throws SQLException {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public List choiceList(String id, String sel, String search, int startRow, int endRow) throws SQLException {

		List choiceList = null;
		if(sel != null && search != null) {
			HashMap map = new HashMap();
			map.put("id", id);
			map.put("sel", sel);
			map.put("search", search);
			map.put("startRow", startRow);
			map.put("endRow", endRow);
			System.out.println(map);
			choiceList = sqlSession.selectList("member.searchChoiceList", map);
			
		}else {
			HashMap map = new HashMap();
			map.put("id", id);
			map.put("startRow", startRow);
			map.put("endRow", endRow);
			
			choiceList = sqlSession.selectList("member.choiceList", map);
		}
		
		System.out.println(choiceList);
		
		return choiceList;
	}

	@Override
	public boolean idCheck(String id) throws SQLException {
		
		boolean result = sqlSession.selectOne("member.idCheck", id);
		System.out.println(result);
		return result;
	}

	@Override
	public boolean pwCheck(HashMap map) throws SQLException {

		boolean result = sqlSession.selectOne("member.pwConfirm", map);
		System.out.println("boolean" + result);
		return result;
	}

	@Override
	public List pplJoin(List choiceList) throws SQLException {

		
		
		return null;
	}

	@Override
	public int myChoiceCount(String id, String sel, String search) throws SQLException {

		int count = 0;
		
		if(sel != null && search != null) {
			HashMap map = new HashMap();
			map.put("id", id);
			map.put("sel", sel);
			map.put("search", search);
			System.out.println("map---->" + map);
			count = sqlSession.selectOne("member.myChoiceSearchCount", map);
		}else {
			count = sqlSession.selectOne("member.myChoiceCount", id);
		}
		
		
		return count;
	}

	@Override
	public List history_pplJoin(String map_num) throws SQLException {

		List history_pplJoin = sqlSession.selectList("member.history_pplJoin", map_num);
		
		
		return history_pplJoin;
	}

	@Override
	public int getmyArticleCount(Map map) throws SQLException {
		int count = sqlSession.selectOne("member.myArticleCount", map);
		return count;
	}

	@Override
	public List getMyArticles(Map map) throws SQLException {
		List list = sqlSession.selectList("member.myArticles", map);
		return list;
	}
	
	@Override
	public int blackcnt(String id) throws SQLException {
		int count = sqlSession.selectOne("member.getBlackcnt", id);
		return count;
	}

	@Override
	public void black(String id, String memId) throws SQLException {
		Map map = new HashMap();
		map.put("id", id);
		map.put("memId", memId);
	
		sqlSession.insert("member.black", map);
	}

	@Override
	public void unblock(Map map) throws SQLException {
		sqlSession.delete("member.unblock", map);
	}

}
