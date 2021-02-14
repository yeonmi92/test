package report.model.dao;

import java.sql.SQLException;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import report.model.dto.ReportDTO;

@Repository
public class ReportDAOImpl implements ReportDAO{

	@Autowired
	private SqlSessionTemplate sqlSession = null;
	
	@Override
	public List reportList() throws SQLException {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public List searchReport() throws SQLException {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public void reportPopup(ReportDTO dto) throws SQLException {
		
		sqlSession.insert("report.insertReport", dto);
		
	}

	@Override
	public ReportDTO detailReport() throws SQLException {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public List myReportList(String id) throws SQLException {
		List myReportList = sqlSession.selectList("report.myReportList", id);
		
		return myReportList;
	}

}
