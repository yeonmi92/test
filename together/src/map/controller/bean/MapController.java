package map.controller.bean;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import map.service.bean.MapService;

@Controller
@RequestMapping("/main/")
public class MapController {

	@Autowired
	private MapService mapService = null;
	
	@RequestMapping("main.git")
	public String main(String sel, String search, Model model) {
		
		// 최신글 5개 가져오기
		List mapBoard = mapService.getMapBoard();
		List boardList = mapService.getBoard();
		List myMapBoard = mapService.getMyMapBoard();
		
		System.out.println("myBoardList >>> " + myMapBoard);
		System.out.println(myMapBoard.size());
		model.addAttribute("mapBoard", mapBoard);
		model.addAttribute("boardList", boardList);
		model.addAttribute("myBoardList", myMapBoard);
		
		
		
		return "main/main.tiles";
	}
	
	
}
