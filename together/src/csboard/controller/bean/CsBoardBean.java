package csboard.controller.bean;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import javax.crypto.Mac;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import csboard.model.dao.CsBoardDAO;
import csboard.model.dto.CsBoardDTO;
import csboard.model.dto.Paging;
import csboard.service.bean.CsBoardService;

@Controller
@RequestMapping("/csboard/")
public class CsBoardBean {
	
	@Autowired
	private CsBoardService csboardService = null;
	HttpSession session;
	
	// csboard 게시판 리스트
	@RequestMapping("cslist.git")
	public String csList(String pageNum, Model model, String sel, String type, String search) throws SQLException {
		if (sel == null) {
			sel = "0";
		}
		int tsel = Integer.parseInt(sel);
		Paging pag = csboardService.csList(pageNum, tsel, type, search);
		model.addAttribute("pag", pag);
		return "csboard/indexCs.tiles";
	}
	
	// csboard 게시판 글 작성
	@RequestMapping("insertcs.git")
	public String csboardinsertCs() throws SQLException {
		return "csboard/insertCs.tiles";
	}	
	@RequestMapping("insertcspro.git")
	public String insertCsPro(@ModelAttribute CsBoardDTO csboardDTO) throws SQLException {
		csboardService.insertCs(csboardDTO);
		return "redirect:cslist.git";
	}
	
	// csboard 게시판 글 수정
	@RequestMapping("modifycs.git")
	public String csboardmodifyCs(String cs_num, Model model) throws SQLException {		
		int num = Integer.parseInt(cs_num); 
		CsBoardDTO csboardDTO = csboardService.getArticle(num);
		model.addAttribute("csboardDTO", csboardDTO);
		return "csboard/modifyCs.tiles";
	}
	@RequestMapping("modifycspro.git")
	public String csboardmodifyCsPro(@ModelAttribute CsBoardDTO csboardDTO) throws SQLException {
		csboardService.modifyCs(csboardDTO);		
		return "redirect:cslist.git";
	}
	
	// csboard 게시판 글 삭제
	@RequestMapping("deletecs.git")
	public String csboarddeleteCs(int cs_num) throws SQLException {
		csboardService.deleteCs(cs_num);
		return "redirect:cslist.git";
	}
	
	// csboard 댓글
	@RequestMapping("reply.git")
	@ResponseBody
	public String csboardreply(String replyText, int cs_num) throws SQLException {
		csboardService.reply(cs_num, replyText);
		return "ok";
	}
	
	// csboard 조회수
	@RequestMapping("readcount.git")
	@ResponseBody
	public String csboardreadcountCs(int cs_num) throws SQLException {
		csboardService.readcountCs(cs_num);
		return "up";
	}
	
	// 이용방법
	@RequestMapping("use.git")
	public String howToUse() throws SQLException {
		return "csboard/howToUse.tiles";
	}
}