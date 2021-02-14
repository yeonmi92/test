package map.model.dao;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import map.model.dto.LatLngDTO;
import map.model.dto.MapBoardDTO;


@Repository
public class MapDAO {

	@Autowired
	private SqlSessionTemplate sqlSession = null;
	
	
	public List<MapBoardDTO> getLatLng() {
		
		List<MapBoardDTO> list = new ArrayList<MapBoardDTO>();
		list = sqlSession.selectList("map.getAllLatLlng");
		
		return list;
	}
	
	public List<MapBoardDTO> getSearchMap(String sel, String search) {
		
		List<MapBoardDTO> list = new ArrayList<MapBoardDTO>();
		if(sel != null && !search.equals("")) {
			HashMap map = new HashMap();
			map.put("sel", sel);
			map.put("search", search);
			System.out.println("sel >> " + sel);
			System.out.println("search >> " + search);
			list = sqlSession.selectList("map.getSearchMap", map);
			//list = sqlSession.selectList("map.getAllMap");
		}
		return list;
	}
	
	public List getMapBoard() {
		
		List mapBoard = sqlSession.selectList("map.getMapBoard");
		
		return mapBoard;
	}
	
	public List getBoard() {
		
		
		List board = sqlSession.selectList("map.getBoard");
		
		return board;
	}
	
	public List getAllMapBoard(String id) {
		
		List myMapBoard = sqlSession.selectList("map.allMapBoard", id);
		
		return myMapBoard;
	}
}
