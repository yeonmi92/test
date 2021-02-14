package board.controller.bean;

import java.io.IOException;
import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import board.model.dto.BoardDTO;
import board.service.bean.BoardService;

@Controller
@RequestMapping("/board/")
public class BoardBean {

	@Autowired
	private BoardService service = null;
	
	@RequestMapping("indexBoard.git")
	public String indexBoard(String pageNum, Model model, String sel, String search, String keyword) throws SQLException {
		
		if(sel==null) {
			sel  = "2";
		}
		int tSel = Integer.parseInt(sel);
		
		System.out.println("ssssssssssssssssssearch : " + search);
		System.out.println("ssssssssssssssssskeyword : " + keyword);
		
		System.out.println("bean int : " + tSel);
		System.out.println("bean String : " + sel);
		
		Map map = null;
		
		if(search==null && keyword==null) {
			map = service.getList(pageNum, tSel);
		}else if(search!=null || keyword!=null) {
			map = service.getSearchList(pageNum, tSel, search, keyword);
		}
		
		if(keyword==null) {
			keyword="all";
		}
		
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
		model.addAttribute("search", search);
		model.addAttribute("keyword", keyword);
		
		System.out.println(search);
		System.out.println(keyword);
		
		
		return "board/indexBoard.tiles";
	}
	
	@RequestMapping("insertForm.git")
	public String boardInsertForm(Model model) throws SQLException {
		
		String id = service.getId();

		model.addAttribute("id", id);
		
		return "board/insertForm.tiles";
	}
	
	@RequestMapping("insertPro.git")
	public String boardInsertPro(BoardDTO dto) throws SQLException, IOException {

		service.insertArticle(dto);

		return "board/insertPro";
	}
	
	@RequestMapping("fileupload.git")
	public void boardMultiplePhotoUpload(HttpServletRequest request, HttpServletResponse response) throws SQLException {
		service.fileupload(request, response);
	}
	
	@RequestMapping("modifyForm.git")
	public String boardModifyForm(String board_num, Model model, String pageNum) throws SQLException {
		// board_num으로 데이터 가져와서 model에 데이터 담고, form에 뿌려준다.
		int num = Integer.parseInt(board_num);
		BoardDTO article = service.getArticle(num);
		model.addAttribute("article", article);
		model.addAttribute("board_num", board_num);
		model.addAttribute("pageNum", pageNum);
		return "board/modifyForm.tiles";
	}
	
	@RequestMapping("modifyPro.git")
	public String boardModifyPro(BoardDTO dto, String board_num, String pageNum, Model model) throws SQLException {
		int num = Integer.parseInt(board_num);
		dto.setBoard_num(num);
		service.modifyArticle(dto);
		
//		String url = "redirect: /together/board/content.git?board_num=";
//		url += board_num + "&pageNum=" + pageNum;
		
		model.addAttribute("board_num", board_num);
		model.addAttribute("pageNum", pageNum);
		
		System.out.println("modifyPro pageNum : " + pageNum);
		
		return "redirect: /together/board/content.git";
	}
	
	@RequestMapping("content.git")
	public String boardContent(String board_num, String pageNum, Model model) throws SQLException {
		int num = Integer.parseInt(board_num);
		service.addReadcount(num);
		
		BoardDTO article = service.getArticle(num);
		List replies = service.getReplies(num);
		String id = service.getId();
		
		model.addAttribute("article", article);
		model.addAttribute("board_num", board_num);
		model.addAttribute("pageNum", pageNum);
		model.addAttribute("id", id);
		model.addAttribute("replies", replies);
		
		return "board/content.tiles";
	}
	
	@RequestMapping("delete.git")
	public String boardDelete(String board_num) throws SQLException {
		int num = Integer.parseInt(board_num);
		service.deleteArticle(num);
		return "redirect: /together/board/indexBoard.git";
	}
	
	@RequestMapping("reply.git")
	@ResponseBody
	public void boardReply(String replyText, int board_num) throws SQLException {
		String id = service.getId();
		service.writeReply(replyText, id, board_num);
		
//		return "board/content.tiles";
	}
}
