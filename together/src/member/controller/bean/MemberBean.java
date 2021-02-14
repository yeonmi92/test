package member.controller.bean;

import java.io.File;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;

import com.oracle.jrockit.jfr.ContentType;

import member.model.dto.MemberDTO;
import member.service.bean.MemberService;

@Controller
@RequestMapping("/member/")
public class MemberBean {
	
	@Autowired 
	private MemberService memberService = null;
	
	@RequestMapping("myArticleList.git")
	public String membermyArticleList(Model model,String pageNum, String sel) throws SQLException {
		if(sel==null) {
			sel  = "2";
		}
		int tSel = Integer.parseInt(sel);
		
		System.out.println("bean int : " + tSel);
		System.out.println("bean String : " + sel);
		
		Map map = null;
		
		map = memberService.getList(pageNum, tSel);
		
		model.addAttribute("pageSize", map.get("pageSize"));
		model.addAttribute("pageNum", map.get("pageNum"));
		model.addAttribute("startRow", map.get("startRow"));
		model.addAttribute("endRow", map.get("endRow"));
		model.addAttribute("currPage", map.get("currPage"));
		model.addAttribute("number", map.get("number"));
		model.addAttribute("articleList", map.get("articleList"));
		model.addAttribute("noticeList", map.get("noticeList"));
		model.addAttribute("count", map.get("count"));
		model.addAttribute("sel", map.get("sel"));
		
		return "member/myArticleList.tiles";
	}
	
	
	@RequestMapping("signupForm.git")
	public String signupForm() {
		
		return "member/signupForm.tiles";
	}
	
	@RequestMapping("signupForm2.git")
	public String signupForm2(MemberDTO member, Model model) {
		
		System.out.println("id : " + member.getId());
		System.out.println("pw : " + member.getPw());
		MemberDTO dto = new MemberDTO();
		dto.setName(member.getName());
		dto.setId(member.getId());
		dto.setPw(member.getPw());
		
		System.out.println("dtoId : " + dto.getId());
		
		model.addAttribute("dto", dto);
			
		return "member/signupForm2.tiles";
	}
	
	@RequestMapping("signupForm3.git")
	public String signupForm3(MemberDTO member, Model model) {
		
		System.out.println("id : " + member.getId());
		System.out.println("pw : " + member.getPw());
		System.out.println(member.getTel());
		
		MemberDTO dto = new MemberDTO();
		dto.setId(member.getId());
		dto.setName(member.getName());
		dto.setPw(member.getPw());
		dto.setBirth(member.getBirth());
		dto.setGender(member.getGender());
		dto.setEmail(member.getEmail());
		dto.setTel(member.getTel());
		
		model.addAttribute("dto", dto);
			
		return "member/signupForm3.tiles";
	}
	
	@RequestMapping("signupPro.git")
	public String signupPro(MemberDTO dto, String hobby, @RequestParam("file") MultipartFile file, MultipartHttpServletRequest request) throws SQLException{
		
		String imgName = memberService.updateImg(file, request);
		
		System.out.println(imgName);
		
		memberService.insertMember(dto, hobby, imgName);
		
		return "member/login.tiles";
	}
	
	@RequestMapping("confirmId.git")
	public String confirmId(String id, Model model) throws SQLException {
		
		boolean check = memberService.idCheck(id);
		model.addAttribute("trialId", id);
		model.addAttribute("check", check);
		
		return "member/confirmId";
	}
	
	@RequestMapping("login.git")
	public String login() {
	
		return "member/login.tiles";
	}
	
	@RequestMapping("loginPro.git")
	public String loginPro(HttpSession session, MemberDTO dto, Model model) throws SQLException {
		
		int check = memberService.login(dto);
		
		System.out.println(check);
		if(check == 1) {
			session.setAttribute("memId", dto.getId());
		}
		model.addAttribute("check", check);
		
		return "member/loginPro";
	}
	
	@RequestMapping("logout.git")
	public String memberlogout() throws SQLException{
		
		memberService.logout("memId");
		
		return "member/login.tiles";
	}
	@RequestMapping("myInfoView.git")
	public String membermyInfoView(Model model) throws SQLException {
		
		HashMap map = memberService.myInfoView();
		MemberDTO dto = (MemberDTO)map.get("dto");
		
		System.out.println("id : " + dto.getId());
		System.out.println("name : " + dto.getName());
		System.out.println("gender : " + dto.getGender());
		System.out.println("birth : " + dto.getBirth());
		System.out.println("hobby1 : " + dto.getHobby1());
		System.out.println("hobby2 : " + dto.getHobby2());
		System.out.println("hobby3 : " + dto.getHobby3());
		
		
		List reviewList = (List)map.get("reviewList");
		int count = reviewList.size();
		System.out.println(reviewList);
		model.addAttribute("dto", dto);
		model.addAttribute("reviewList", reviewList);
		model.addAttribute("count", count);
		
		return "member/myInfoView.tiles";
	}
	
	@RequestMapping("infoView.git")
	public String memberinfoView(String id, Model model) throws SQLException {
		
		
		HashMap map = memberService.infoView(id);
		MemberDTO dto = (MemberDTO)map.get("dto");
		List reviewList = (List)map.get("reviewList");
		int count = reviewList.size();
		model.addAttribute("dto", dto);
		model.addAttribute("reviewList", reviewList);
		model.addAttribute("count", count);
		
		return "member/infoView";
	}
	
	
	@RequestMapping("modifyForm.git")
	public String membermodifyForm(Model model) throws SQLException{
		
		HashMap map = memberService.myInfoView();
		
		model.addAttribute("dto", map.get("dto"));
		
		return "member/modifyForm.tiles";
	}
	
	@RequestMapping("modifyPro.git")
	public String membermodifyPro(MemberDTO dto, String hobby, @RequestParam("file") MultipartFile file, MultipartHttpServletRequest request) throws SQLException{
		
		String imgName;
		
		System.out.println("pw : " + dto.getPw());
		System.out.println("tel : " + dto.getTel());
		System.out.println("hobby : " + hobby);
		
		// file이 null이 아닌지 확인
		if(file.getContentType() != null) {
			
			String[] contentType = file.getContentType().split("/");
			// 이미지 파일인지 확인
			if(contentType[0].equals("image")) {
				imgName = memberService.updateImg(file, request);
				memberService.updateMember(dto, hobby, imgName);
			}else {
				// 아닐경우 "notexist" 넣어주기
				imgName = "notexist";
				memberService.updateMember(dto, hobby, imgName);
			}
		}
		return "member/modifyPro";
	}
	
	@RequestMapping("pwConfirm.git")
	public String memberpwConfirm(Model model) {
		
		return "member/pwConfirm";
	}
	
	@RequestMapping("pwConfirmPro.git")
	public String memberpwConfirmPro(String pw, Model model) throws SQLException {
		
		boolean check = memberService.pwCheck(pw);
		System.out.println("check : " + check);
		model.addAttribute("check", check);
		
		return "member/pwConfirmPro";
	}
	
	@RequestMapping("choiceList.git")
	public String memberchoiceList(String pageNum, String sel, String search, Model model) throws SQLException{
	
		
		HashMap page = null;
		page = memberService.choiceList(pageNum, sel, search);
		
		List choiceList = (List)page.get("choiceList");
		List pplJoin = memberService.choice_pplJoin(choiceList);
		
		System.out.println("pplJoin" + pplJoin);
		model.addAttribute("choiceList", choiceList);
		model.addAttribute("pplJoin", pplJoin);
		model.addAttribute("pageNum", page.get("pageNum"));
		model.addAttribute("pageSize", page.get("pageSize"));
		model.addAttribute("currPage", page.get("currPage"));
		model.addAttribute("startRow", page.get("startRow"));
		model.addAttribute("endRow", page.get("endRow"));
		model.addAttribute("number", page.get("number"));
		model.addAttribute("count", page.get("count"));
		return "member/choiceList.tiles";
	}

	@RequestMapping("historyList.git")
	public String memberhistoryList(String pageNum, String sel, String search, String sort, Model model) throws SQLException {
		
		HashMap page = memberService.historyList(pageNum, sel, search, sort);
		List historyList = (List)page.get("historyList");
		
		List pplJoin = memberService.history_pplJoin(historyList);
		System.out.println("historyList : " + historyList);
		System.out.println("pplJoin" + pplJoin);
		model.addAttribute("historyList", historyList);
		model.addAttribute("pplJoin", pplJoin);
		model.addAttribute("pageNum", page.get("pageNum"));
		model.addAttribute("pageSize", page.get("pageSize"));
		model.addAttribute("currPage", page.get("currPage"));
		model.addAttribute("startRow", page.get("startRow"));
		model.addAttribute("endRow", page.get("endRow"));
		model.addAttribute("number", page.get("number"));
		model.addAttribute("count", page.get("count"));
		System.out.println("currPage : " + page.get("currPage"));
		System.out.println("count : " + page.get("count"));
		
		return "member/historyList.tiles";
	}
	
	@RequestMapping("review.git")
	@ResponseBody
	public void memberreview(String reviewId, String review, String val) throws SQLException{
		
		System.out.println(reviewId);
		System.out.println(review);
		System.out.println(val);
		
		memberService.insertReview(reviewId, review, val);
		
	}
	
	@RequestMapping("blackList.git")
	public String blackList(Model model) throws SQLException {
		
		Map map = memberService.blackList();
		
		
		model.addAttribute("blackList", map.get("blackList"));
		model.addAttribute("count", map.get("count"));
		
		return "member/blackList.tiles";
	}
	
	@RequestMapping("deleteMember.git")
	@ResponseBody
	public void delete(String id) throws SQLException{
		
		memberService.black(id);
		
	}
	
	@RequestMapping("unblock.git")
	@ResponseBody
	public void unblock(String block_id) throws SQLException{
		memberService.unblock(block_id);
	}
	
}
