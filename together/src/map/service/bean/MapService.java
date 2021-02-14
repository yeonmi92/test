package map.service.bean;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.context.request.RequestAttributes;
import org.springframework.web.context.request.RequestContextHolder;

import map.model.dao.MapDAO;
import map.model.dto.LatLngDTO;
import map.model.dto.MapBoardDTO;

@Service
public class MapService {

	@Autowired
	private MapDAO mapDAO = null;
	
	
	public Map<String, Object> getLatLng() {
		
		// 테스트용 데이터 -> DB에서 가져오는것으로 변경 
		
		//List<LatLngDTO> list = mapDAO.getLatLng(sel, search);
		List<MapBoardDTO> list = mapDAO.getLatLng();
		
		
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("positions", list);
		
		
		return map;
	}
	
	public Map<String, Object> getSearchMap(String sel, String search) {
		
		List<MapBoardDTO> list = mapDAO.getSearchMap(sel, search);
		
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("positions", list);
		
		
		return map;
	}
	
	
	public List getMapBoard() {
		
		List mapBoard = mapDAO.getMapBoard();
		
		return mapBoard;
	}
	
	public List getBoard() {
		
		List board = mapDAO.getBoard();
		
		return board;
	}
	
	public List getMyMapBoard() {
		
		String id = (String)RequestContextHolder.getRequestAttributes().getAttribute("memId", RequestAttributes.SCOPE_SESSION);
		
		List myMapList = mapDAO.getAllMapBoard(id);

		return myMapList;
		 
	}
	
	
	
}
