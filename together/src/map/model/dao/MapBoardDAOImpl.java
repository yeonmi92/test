package map.model.dao;

import java.sql.SQLException;
import java.util.HashMap;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.web.bind.annotation.RequestAttribute;
import org.springframework.web.context.request.RequestContextHolder;

import map.model.dto.MapBoardDTO;
import member.model.dto.MemberDTO;

@Repository
public class MapBoardDAOImpl implements MapBoardDAO{
	
	@Autowired
	private SqlSessionTemplate sqlSession =null;
	public void setSqlSession(SqlSessionTemplate sqlSession) {
		this.sqlSession = sqlSession;
	}
	
	
// insertMap 	
	@Override
	public void insertMap(MapBoardDTO dto) throws SQLException {
		sqlSession.insert("board_map.insertMap", dto);
		
	}
	
// detailMap
	@Override
	public MapBoardDTO detailMap(int map_num) throws SQLException {
		
		MapBoardDTO article = sqlSession.selectOne("board_map.selectOne",map_num);
		
		return article;
	}
	
//modifyMap	
	@Override
	public void modifyMap(MapBoardDTO dto) throws SQLException {
		//System.out.println("여기까지");
		sqlSession.update("board_map.updateOne",dto);
		
		
	}

	@Override
	public List allList() throws SQLException {
		
		List list = sqlSession.selectList("board_map.selectAll");
		return list;
	}

	@Override
	public List searchInfo(MapBoardDTO dto) throws SQLException {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public void deleteMap(int map_num) throws SQLException {
		
		sqlSession.delete("board_map.deleteMap",map_num);
		
	}

	

	@Override
	public void joinMember(String id,int map_num) throws SQLException {
		
		HashMap joinMember = new HashMap();
		joinMember.put("id",id);
		joinMember.put("map_num",map_num);
	
		sqlSession.update("board_map.joinMember",joinMember);
		
	}

	@Override
	public void choiceMap(String id, int map_num) throws SQLException {
	
		HashMap choice = new HashMap();
		choice.put("id",id);
		choice.put("map_num",map_num);
		sqlSession.insert("board_map.insertId",choice);

	}

	@Override
	public void choiceDelete(String id, int map_num) throws SQLException {
		
		HashMap choiceDelete = new HashMap();
		choiceDelete.put("id",id);
		choiceDelete.put("map_num",map_num);
		
		sqlSession.delete("board_map.choiceDelete",choiceDelete);
		
	}
// 저요 기능 
	@Override
	public void applyMember(String id ,int map_num) throws SQLException {
		
		HashMap applyMember = new HashMap();
		applyMember.put("id", id);
		applyMember.put("map_num",map_num);
		
		
		sqlSession.insert("board_map.applyInsert",applyMember);
		
		
	}
	
	@Override
	public void applyDelete(String id, int map_num) throws SQLException {
		
		HashMap applyDelete = new HashMap();
		applyDelete.put("id", id);
		applyDelete.put("map_num",map_num);
		
		sqlSession.delete("board_map.applyDelete",applyDelete);
		
	} 
	
	@Override
	public List getMember(int map_num) throws SQLException {
		
		List ppl_avail2 =sqlSession.selectList("board_map.getMember", map_num);
		
		return ppl_avail2;
	}

// 찜기능 
	@Override
	public int choiceCheck(String id ,int map_num) throws SQLException {
		
		//System.out.println("id : " + id + "map_num" + map_num);
		HashMap choiceCheck = new HashMap();
		choiceCheck.put("checkId",id);
		choiceCheck.put("checkNum",map_num);
		int choice = sqlSession.selectOne("board_map.choiceCheck",choiceCheck);
		System.out.println("choice : " + choice);	
		
		return choice;
	}
	
	@Override
	public int applyCheck(String id, int map_num) throws SQLException {

		HashMap applyCheck = new HashMap();
		applyCheck.put("applyId", id);
		applyCheck.put("applyNum",map_num);
		int apply = sqlSession.selectOne("board_map.applyCheck",applyCheck);
		System.out.println("apply : "+ apply);
		
		return apply;
	}
	
	

	

}
