package member.model.dao;

import java.sql.SQLException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Repository;

import member.model.dto.MemberDTO;

public interface MemberDAO {
	
	public void insertMember(MemberDTO dto) throws SQLException;
	public void updateMember(MemberDTO dto) throws SQLException;
	public void deleteMember() throws SQLException;
	public int login(MemberDTO dto) throws SQLException;
	public void logout() throws SQLException;
	public MemberDTO myInfoView(String id) throws SQLException;
	public List memberList() throws SQLException;
	public List reviewList(String id) throws SQLException;
	public void insertReview(String reviewId, String review, String val, String id) throws SQLException;
	public HashMap historyList(String id, String sel, String search, String sort) throws SQLException;
	public List blackList(String id) throws SQLException;
	public int blackcnt(String id) throws SQLException;
	public void deleteBlack() throws SQLException;
	public List searchBlack() throws SQLException;
	public List choiceList(String id, String sel, String search, int startRow, int endRow) throws SQLException;
	public List pplJoin(List choiceList) throws SQLException;
	public List history_pplJoin(String map_num) throws SQLException;
	public boolean idCheck(String id) throws SQLException;
	public boolean pwCheck(HashMap map) throws SQLException;
	public int myChoiceCount(String id, String sel, String search) throws SQLException;
	public int getmyArticleCount(Map map) throws SQLException;
	public List getMyArticles(Map map) throws SQLException;
	public void black(String id, String memId) throws SQLException;
	public void unblock(Map map) throws SQLException;
}
