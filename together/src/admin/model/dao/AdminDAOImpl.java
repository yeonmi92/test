package admin.model.dao;

import java.sql.SQLException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import admin.model.dto.ReportDTO;

@Repository
public class AdminDAOImpl implements AdminDAO{

	@Autowired
	private SqlSessionTemplate sqlSession = null;
	
	@Override
	public int getMemberCount() throws SQLException {
		int count = sqlSession.selectOne("admin.getMemberCount");
		return count;
	}

	@Override
	public List getMembers(Map map) throws SQLException {
		List members = sqlSession.selectList("admin.getMembers", map);
		return members;
	}

	@Override
	public int getSearchcnt(Map map) throws SQLException {
		int count = sqlSession.selectOne("admin.getSearchCnt", map);
		return count;
	}

	@Override
	public List getSearchMember(Map map) throws SQLException {
		List members = sqlSession.selectList("admin.getSearchMembers", map);
		return members;
	}

	@Override
	public int getReportsCnt(Map map) throws SQLException {
		int count = sqlSession.selectOne("admin.getReportsCnt", map);
		return count;
	}

	@Override
	public List getReports(Map map) throws SQLException {
		List reports = sqlSession.selectList("admin.getReports", map);
		
		return reports;
	}

	@Override
	public void chStatus(Map map) throws SQLException {
		// report table status 변겅
		sqlSession.update("admin.updateStatus", map);
	}

	// selectkey로 바꿀 수 있을까..? 한번에....
	@Override
	public void reportStatus(Map map) throws SQLException {
		// report sq -> member id 가져오기
		String id = sqlSession.selectOne("admin.getReportId", map);
		map.put("id", id);
		// 가져온 id 값으로 경고면 + 1, 추방이면 member status 0으로 변경
		sqlSession.update("admin.updateMember", map);
		// warning==3이면 status==0
		sqlSession.update("admin.updateWarns");
	}

	@Override
	public void insertReason(Map map) throws SQLException {
		sqlSession.update("admin.insertReason", map);
	}

	@Override
	public int getSearchReportCnt(Map map) throws SQLException {
		int count = sqlSession.selectOne("admin.getReportsCnt", map);
		return count;
	}

	
	
	
}
