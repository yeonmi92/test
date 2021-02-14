package member.service.bean;

import java.sql.SQLException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import member.model.dto.MemberDTO;

public interface MemberService {

	public void insertMember(MemberDTO dto, String hobby, String imgName) throws SQLException;
	public void updateMember(MemberDTO dto, String hobby, String imgName) throws SQLException;
	public void deleteMember() throws SQLException;
	public int login(MemberDTO dto) throws SQLException;
	public void logout(String sessionName) throws SQLException;
	public HashMap myInfoView() throws SQLException;
	public HashMap infoView(String id) throws SQLException;
	public List memberList() throws SQLException;
	public List reviewList() throws SQLException;
	public void insertReview(String reviewId, String review, String val) throws SQLException;
	public HashMap historyList(String pageNum, String sel, String search, String sort) throws SQLException;
	public Map blackList() throws SQLException;
	public void deleteBlack() throws SQLException;
	public List searchBlack() throws SQLException;
	public HashMap choiceList(String pageNum, String sel, String search) throws SQLException;
	public List choice_pplJoin(List choiceList) throws SQLException;
	public List history_pplJoin(List historyList) throws SQLException;
	public boolean idCheck(String id) throws SQLException;
	public boolean pwCheck(String pw) throws SQLException;
	public String updateImg(MultipartFile multipartFile, MultipartHttpServletRequest request) throws SQLException;
	public Map getList(String pageNum, int sel) throws SQLException;
	public void black(String id) throws SQLException;
	public void unblock(String block_id) throws SQLException;
	
}
