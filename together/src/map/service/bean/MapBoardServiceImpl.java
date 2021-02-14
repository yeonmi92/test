package map.service.bean;

import java.sql.SQLException;
import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestAttribute;
import org.springframework.web.context.request.RequestAttributes;
import org.springframework.web.context.request.RequestContextHolder;

import map.model.dao.MapBoardDAOImpl;
import map.model.dto.MapBoardDTO;
import member.model.dao.MemberDAO;
import member.model.dto.MemberDTO;

@Service
public class MapBoardServiceImpl implements MapBoardService {
	
	@Autowired	
	private MapBoardDAOImpl mapboardDAO = null;
	
	@Override
	public void insertMap(MapBoardDTO dto) throws SQLException {
		
		String id = (String)RequestContextHolder.getRequestAttributes().getAttribute("memId", RequestAttributes.SCOPE_SESSION);
		dto.setId(id);
		
		mapboardDAO.insertMap(dto);
		
	}
	
	@Override
	public MapBoardDTO detailMap(int map_num) throws SQLException {
		
		MapBoardDTO article = mapboardDAO.detailMap(map_num);
		
		return article;
	}
	
	@Override
	public void  modifyMap(MapBoardDTO dto) throws SQLException {
		
		mapboardDAO.modifyMap(dto);

	}

	@Override
	public List allList() throws SQLException {
		
		List articles = mapboardDAO.allList();
		
		return articles;
	}

	@Override
	public List searchInfo(MapBoardDTO dto) throws SQLException {
		// TODO Auto-generated method stub
		return null;
	}

// 모임 삭제
	@Override
	public void deleteMap(int map_num) throws SQLException {
		
		mapboardDAO.deleteMap(map_num);
		
	}
	@Override
	public void joinMember(String id,int map_num) throws SQLException {
		
		mapboardDAO.joinMember(id,map_num);

		
	}

// 찜 기능
	@Override
	public void choiceMap(int map_num) throws SQLException {
		
		String id = (String)RequestContextHolder.getRequestAttributes().getAttribute("memId", RequestAttributes.SCOPE_SESSION);
		mapboardDAO.choiceMap(id,map_num);
		
	}

	@Override
	public void choiceDelete(int map_num) throws SQLException {
		
		String id =(String)RequestContextHolder.getRequestAttributes().getAttribute("memId", RequestAttributes.SCOPE_SESSION);
		mapboardDAO.choiceDelete(id,map_num);
		
		
		
	}
// 저요 기능 
	@Override
	public void applyMember(int map_num) throws SQLException {
		
		
		String id = (String)RequestContextHolder.getRequestAttributes().getAttribute("memId", RequestAttributes.SCOPE_SESSION);
		mapboardDAO.applyMember(id ,map_num);
			
	}
	
	@Override
	public void applyDelete(int map_num) throws SQLException {
		
		String id = (String)RequestContextHolder.getRequestAttributes().getAttribute("memId", RequestAttributes.SCOPE_SESSION);
		mapboardDAO.applyDelete(id ,map_num);
		
	}
	
	@Override
	public List getMember(int map_num) throws SQLException {
		
		List ppl_avail2 = mapboardDAO.getMember(map_num);
		
		return ppl_avail2;
	}
	
	
	@Override
	public void choiceId(MapBoardDTO dto) throws SQLException {
		
		//mapboardDAO.insertId(dto);
		
	}
	
//찜 , 참여가능 체크 
	@Override
	public int choiceCheck(int map_num) throws SQLException {
		
		String id = (String)RequestContextHolder.getRequestAttributes().getAttribute("memId", RequestAttributes.SCOPE_SESSION);
		int choice = mapboardDAO.choiceCheck(id, map_num);
		
		return choice;
	}
	
	@Override
	public int applyCheck(int map_num) throws SQLException {
		
		String id = (String)RequestContextHolder.getRequestAttributes().getAttribute("memId", RequestAttributes.SCOPE_SESSION);
		int ppl_avail = mapboardDAO.applyCheck(id ,map_num);
		
		return ppl_avail;
	}
	
	

	

	

}
