package admin.model.dao;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;

public interface AdminDAO {
	public int getMemberCount() throws SQLException;
	public List getMembers(Map map) throws SQLException;
	public List getReports(Map map) throws SQLException;
	public int getSearchcnt(Map map) throws SQLException;
	public int getReportsCnt(Map map) throws SQLException;
	public List getSearchMember(Map map) throws SQLException;
	public void chStatus(Map map) throws SQLException;
	public void reportStatus(Map map) throws SQLException;
	public void insertReason(Map map) throws SQLException;
	public int getSearchReportCnt(Map map) throws SQLException;
}
