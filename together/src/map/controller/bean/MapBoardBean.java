package map.controller.bean;

import java.sql.SQLException;
import java.util.List;

import javax.servlet.http.HttpSession;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.validation.ObjectError;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.context.request.RequestAttributes;
import org.springframework.web.context.request.RequestContextHolder;
import org.springframework.web.servlet.config.annotation.EnableWebMvc;

import map.model.dao.MapBoardDAOImpl;
import map.model.dto.MapBoardDTO;
import map.service.bean.MapBoardService;
import member.model.dto.MemberDTO;

@Controller
@EnableWebMvc
@RequestMapping("/mapboard/")
public class MapBoardBean {
	
	@Autowired
	private MapBoardService mapboardService  = null;
	
	
//지도 모임 등록 페이지 
	@RequestMapping("insertMap.git")
	public String mapinsertMap() {
		
		return "mapboard/insertMap.tiles";
	}

	
// 지도 모임 등록 페이지 
	@RequestMapping("insertMapPro.git")
	// interface 에 없음 
	public String mapinsertMapPro(MapBoardDTO dto, BindingResult bindingResult , Model model)throws SQLException{//bindingRsult 서버다운 오류 때문에

			//System.out.println("end_date" + dto.getEnd_date());
			mapboardService.insertMap(dto);
			model.addAttribute("article",dto);
			
			//System.out.println("id"+dto.getId());
			return "mapboard/insertMapPro";
		}
	
//모임 지도 상세 페이지 
	@RequestMapping("detailMap.git")
	public String mapdetailMap(int map_num, String pageNum, Model model, HttpSession session)throws SQLException{
		
		String memId = (String)session.getAttribute("memId");
		System.out.println(map_num);
		if(memId != null) {
			System.out.println(memId);
		}
		
		MapBoardDTO article = mapboardService.detailMap(map_num);
		//System.out.println(map_num);
		
		//System.out.println(article.getId());
		
		model.addAttribute("article",article);
		model.addAttribute("pageNum",pageNum);
		//System.out.println(article);	
			
// 디테일 맵 들어 가기전에 찜 체크  
		int check = mapboardService.choiceCheck(map_num);
		//System.out.println(check);
		model.addAttribute("check",check);

//디테일 맵 들어가기전에 ppl_avail 쳌 	
		int ppl_avail = mapboardService.applyCheck(map_num);
		model.addAttribute("ppl_avail",ppl_avail);

//참여 가능리스트 뿌려주기 	
		List ppl_avail2 = mapboardService.getMember(map_num);
		System.out.println("ppl_avail2 :"+ppl_avail2);
		
		model.addAttribute("ppl_avail2",ppl_avail2);
		
		
//		List ppl_join = mapboardService.joinMember(map_num);
//		System.out.println("ppl_join : " + ppl_join);
//		model.addAttribute("ppl_join",ppl_join);
		
		
		return"mapboard/detailMap.tiles";
	}
	
// 찜 기능
	@RequestMapping("choiceList.git")
	@ResponseBody
	public String mapchoice(int map_num) throws SQLException{
		
		mapboardService.choiceMap(map_num);
		//model.addAttribute(id);
		System.out.println("map_num :" + map_num);

		return "ok";
	}
	
	@RequestMapping("choiceDelete.git")
	@ResponseBody
	public String mapchoiceDelete(int map_num) throws SQLException{
		
		mapboardService.choiceDelete(map_num);
		
		return "ok";
	}

//ppl_avail
	@RequestMapping("ppl_avail.git")
	@ResponseBody
	public String mapapply(int map_num)throws SQLException{
		
		mapboardService.applyMember(map_num);
		System.out.println("map_num : " + map_num);
		
		return "ok";
		
	}
	
	@RequestMapping("ppl_availDelete.git")
	@ResponseBody
	public String mapapplyDelete(int map_num) throws SQLException{
		
		mapboardService.applyDelete(map_num);
		
		return "ok";
	}
	
	@RequestMapping("joinMember.git")
	@ResponseBody
	public String mapjoinMember(String id,int map_num)throws SQLException{
		// 체크 된 id 
		mapboardService.joinMember(id,map_num);
		
		return "ok";
	}
	
	
	
	
	
	
// 지도 모임 수정 페이지 
	@RequestMapping("modifyMap.git")
	public String mapmodifyMap(int map_num, String pageNum, Model model, MapBoardDTO dto,HttpSession session) throws SQLException {

		//int map_num = 6;
		
		String memId = (String)session.getAttribute("memId");
		System.out.println(map_num);	
		if(memId != null) {
		
		}
		
		MapBoardDTO article = mapboardService.detailMap(map_num);
		//System.out.println(map_num);
		
		//System.out.println(article.getId());
		
		model.addAttribute("article",article);
		model.addAttribute("pageNum",pageNum);
		//System.out.println(article);	
		
		return "mapboard/modifyMap.tiles";
		
	}
	
	@RequestMapping("modifyMapPro.git")
	public String mapmodifyMapPro(int map_num,MapBoardDTO dto, String pageNum, Model model)throws SQLException{
		
		//int map_num = 6;
		
		mapboardService.modifyMap(dto);
		model.addAttribute("pageNum", pageNum);
		model.addAttribute("map_num", map_num);
		
		
		return "mapboard/modifyMapPro";
	}

// 모임 글 삭제 
	@RequestMapping("deleteMap.git")
	public String mapdeleteMap(int map_num)throws SQLException{
		
		//int map_num = 6;
		
		mapboardService.deleteMap(map_num);
		
		return "mapboard/main.tiles";
	}
	
	
	

}
