package report.service.bean;

import java.sql.SQLException;
import java.util.List;

import report.model.dto.ReportDTO;

public interface ReportService {

	public List reportList() throws SQLException;
	public List searchReport() throws SQLException;
	public void reportPopup(ReportDTO dto) throws SQLException;
	public ReportDTO detailReport() throws SQLException;
	public List myReportList() throws SQLException;
	
}
