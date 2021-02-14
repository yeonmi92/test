package report.service.bean;

import java.sql.SQLException;
import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.context.request.RequestAttributes;
import org.springframework.web.context.request.RequestContextHolder;

import report.model.dao.ReportDAO;
import report.model.dto.ReportDTO;

@Service
public class ReportServiceImpl implements ReportService{

	@Autowired
	private ReportDAO reportDAO = null;
	
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

		 reportDAO.reportPopup(dto);
		
	}

	@Override
	public ReportDTO detailReport() throws SQLException {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public List myReportList() throws SQLException {
		// TODO Auto-generated method stub
		return null;
	}


}
