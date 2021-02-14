package admin.service.bean;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;

public interface AdminService {
	
	public Map getMembers(String pageNum) throws SQLException;
	public Map getReports(String pageNum, String sel, String status) throws SQLException;
	public Map getSearchMembers(String pageNum, String search, String keyword) throws SQLException;
	public void chStatus(int res, int num) throws SQLException;
	public void reasonStatus(int num, int res, String reason) throws SQLException;
	public Map getSearchReports(String pageNum, String sel, String status, String keyword, String search) throws SQLException;

}
