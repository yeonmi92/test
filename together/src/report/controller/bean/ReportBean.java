package report.controller.bean;

import java.sql.SQLException;
import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import report.model.dto.ReportDTO;
import report.service.bean.ReportService;

@Controller
@RequestMapping("/report/")
public class ReportBean {

	@Autowired
	private ReportService reportService = null;
	
	
	@RequestMapping("reportPopup.git")
	public String reportPopup(String id, Model model) throws SQLException{
		
		System.out.println(id);
		model.addAttribute("id", id);
		
		return "report/reportPopup";
	}
	
	@RequestMapping("reportPopupPro.git")
	public String reportPopupPro(ReportDTO dto) throws SQLException{
		
		
		reportService.reportPopup(dto);
		
		
		return "report/reportPopupPro";
	}
	

}
