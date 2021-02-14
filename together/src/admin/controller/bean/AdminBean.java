package admin.controller.bean;

import java.sql.SQLException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import admin.model.dto.ReportDTO;
import admin.service.bean.AdminService;

@Controller
@RequestMapping("/admin/")
public class AdminBean {
	
	@Autowired
	private AdminService service = null;
	
	@RequestMapping("memberList.git")
	public String adminMemberList(String pageNum, String search, Model model, String keyword) throws SQLException {
		// 정렬시 매개변수 추가
		
		if(pageNum==null) {
			pageNum = "1";
		}

		Map map = null;
		
		if(keyword==null) {
			map = service.getMembers(pageNum);
			System.out.println("전체");
		}else{
			System.out.println("검색");
			if(search==null) {
				search = "all"; 
			}
			map = service.getSearchMembers(pageNum, search, keyword);
		}
		
		model.addAttribute("pageNum", map.get("pageNum"));
		model.addAttribute("pageSize", map.get("pageSize"));
		model.addAttribute("currPage", map.get("currPage"));
		model.addAttribute("startRow", map.get("startRow"));
		model.addAttribute("endRow", map.get("endRow"));
		model.addAttribute("number", map.get("number"));
		model.addAttribute("count", map.get("count"));
		model.addAttribute("memberList", map.get("memberList"));
		model.addAttribute("search", map.get("search"));
		
		System.out.println("-----------------------------------------------------------------");
		
		return "admin/memberList.tiles";
	}
	
	@RequestMapping("reportList.git")
	public String adminReportList(String pageNum, Model model, String sel, String status, String search, String keyword) throws SQLException {
		if(pageNum==null) {
			pageNum = "1";
		}
		
		if(sel==null) {
			sel="6";
		}
		
		if(status==null) {	//전체
			status="2";
		}
		
		Map map = null;
		
		if(search==null && keyword==null) {
			map = service.getReports(pageNum, sel, status);
		}else if(search!=null || keyword!=null) {
			map = service.getSearchReports(pageNum, sel, status, keyword, search);
		}
		
		
		
		model.addAttribute("pageNum", map.get("pageNum"));
		model.addAttribute("pageSize", map.get("pageSize"));
		model.addAttribute("currPage", map.get("currPage"));
		model.addAttribute("startRow", map.get("startRow"));
		model.addAttribute("endRow", map.get("endRow"));
		model.addAttribute("number", map.get("number"));
		model.addAttribute("count", map.get("count"));
		model.addAttribute("report", map.get("report"));
		model.addAttribute("sel", sel);
		model.addAttribute("status", status);
		model.addAttribute("search", search);
		model.addAttribute("keyword", keyword);
		
		return "admin/reportList.tiles";
	}
	
	@RequestMapping("reject.git")
	public String adminReject(String num, Model model) {
		
		model.addAttribute("num", num);
		 return "admin/rejectPopup";
	}
	
	@RequestMapping("res.git")
	@ResponseBody
	public String adminRes(int res, int num, String reason) throws SQLException {
		System.out.println("res : " + res);
		System.out.println("num : " + num);
		System.out.println("reason : " + reason);
		
		// 0 추방 1 경고 처리
		// num으로 신고 당한 아이디 받아와서 해당 아이디에 추방/경고 처리 해주기
		 service.chStatus(res, num);
		return "ok";
	}
	
	@ResponseBody
	@RequestMapping("writeReason.git")
	public String adminReason(String num, int res, String reason) throws SQLException{
		System.out.println("writeReason num : " + num + " / res : " + res + " / reason : " + reason);
		// 2 반려 처리 -> 사유 데이터까지 받아서 reason에 넣어주기
		int b_num = Integer.parseInt(num);
		service.reasonStatus(b_num, res, reason);
		return "ok";
	}
}
