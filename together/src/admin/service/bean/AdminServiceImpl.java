package admin.service.bean;

import java.sql.SQLException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import admin.model.dao.AdminDAO;
import admin.model.dto.ReportDTO;

@Service
public class AdminServiceImpl implements AdminService{

	@Autowired
	private AdminDAO dao = null;
	
	@Override
	public Map getMembers(String pageNum) throws SQLException {
		
		int pageSize = 20;
		int currPage = Integer.parseInt(pageNum);
		int startRow = (currPage-1)*pageSize+1;
		int endRow = currPage*pageSize;
		int number = 0;
		
		List memberList = null;
		
		int count = dao.getMemberCount();
		
		if(count > 0) {
			Map rows = new HashMap();
			rows.put("start", startRow);
			rows.put("end", endRow);
			memberList = dao.getMembers(rows);
		}
		number = count-(currPage-1)*pageSize;
		
		Map map = new HashMap();
		
		
		map.put("pageNum", pageNum);
		map.put("pageSize", pageSize);
		map.put("currPage", currPage);
		map.put("startRow", startRow);
		map.put("endRow", endRow);
		map.put("number", number);
		map.put("count", count);
		map.put("memberList", memberList);
		
		
		
		return map;
	}

	@Override
	public Map getSearchMembers(String pageNum, String search, String keyword) throws SQLException {
		int pageSize = 20;
		int currPage = Integer.parseInt(pageNum);
		int startRow = (currPage-1)*pageSize+1;
		int endRow = currPage*pageSize;
		int number = 0;
		
		List memberList = null;
		
		Map rows = new HashMap();
		rows.put("start", startRow);
		rows.put("end", endRow);
		rows.put("search", search);
		rows.put("keyword", keyword);
		
		int count = dao.getSearchcnt(rows);
		
		if(count > 0) {
			memberList = dao.getSearchMember(rows);
		}
		
		number = count-(currPage-1)*pageSize;
		
		Map map = new HashMap();
		
		map.put("pageNum", pageNum);
		map.put("pageSize", pageSize);
		map.put("currPage", currPage);
		map.put("startRow", startRow);
		map.put("endRow", endRow);
		map.put("number", number);
		map.put("count", count);
		map.put("memberList", memberList);
		map.put("search", search);
		
		return map;
	}

	@Override
	public Map getReports(String pageNum, String sel, String status) throws SQLException {
		
		int tSel = Integer.parseInt(sel);
		int statuss = Integer.parseInt(status);
		
		int pageSize = 20;
		int currPage = Integer.parseInt(pageNum);
		int startRow = (currPage-1)*pageSize+1;
		int endRow = currPage*pageSize;
		int number = 0;
		
		List report = null;
		
		Map rows = new HashMap();
		
		rows.put("start", startRow);
		rows.put("end", endRow);
		rows.put("sel", tSel);
		rows.put("status", statuss);
		int count = 0;
		
		count = dao.getReportsCnt(rows);
		
		if(count > 0) {
			report = dao.getReports(rows);
		}
			
		
		
		number = count-(currPage-1)*pageSize;
		
		Map map = new HashMap();
		
		map.put("pageNum", pageNum);
		map.put("pageSize", pageSize);
		map.put("currPage", currPage);
		map.put("startRow", startRow);
		map.put("endRow", endRow);
		map.put("number", number);
		map.put("count", count);
		map.put("report", report);
		
		return map;
	}

	@Override
	public void chStatus(int res, int num) throws SQLException {
		Map map = new HashMap();
		map.put("res", res);
		map.put("num", num);
		dao.chStatus(map);
		dao.reportStatus(map);
	}

	@Override
	public void reasonStatus(int num, int res, String reason) throws SQLException {
		Map map = new HashMap();
		map.put("num", num);
		map.put("res", res);
		map.put("reason", reason);
		dao.chStatus(map);
		dao.insertReason(map);
		
	}

	@Override
	public Map getSearchReports(String pageNum, String sel, String status, String keyword, String search) throws SQLException {
		int tSel = Integer.parseInt(sel);
		int statuss = Integer.parseInt(status);
		
		int pageSize = 20;
		int currPage = Integer.parseInt(pageNum);
		int startRow = (currPage-1)*pageSize+1;
		int endRow = currPage*pageSize;
		int number = 0;
		
		List report = null;
		
		Map rows = new HashMap();
		
		rows.put("start", startRow);
		rows.put("end", endRow);
		rows.put("sel", tSel);
		rows.put("status", statuss);
		rows.put("search", search);
		rows.put("keyword", keyword);
		
		int count = 0;
		
		count = dao.getSearchReportCnt(rows);
		
		if(count > 0) {
			report = dao.getReports(rows);
		}
			
		
		
		number = count-(currPage-1)*pageSize;
		
		Map map = new HashMap();
		
		map.put("pageNum", pageNum);
		map.put("pageSize", pageSize);
		map.put("currPage", currPage);
		map.put("startRow", startRow);
		map.put("endRow", endRow);
		map.put("number", number);
		map.put("count", count);
		map.put("report", report);
		
		return map;
	}

}
