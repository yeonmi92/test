package map.model.dao;

import java.sql.SQLException;
import java.util.List;

import map.model.dto.MapBoardDTO;
import member.model.dto.MemberDTO;

public interface MapBoardDAO {
	
  public void insertMap(MapBoardDTO dto) throws SQLException;
  public MapBoardDTO detailMap(int map_num) throws SQLException;
  public void modifyMap(MapBoardDTO dto) throws SQLException;
  public List allList() throws SQLException;
  public List searchInfo(MapBoardDTO dto) throws SQLException;
  public void deleteMap(int map_num) throws SQLException;
  
  public void joinMember(String id,int map_num) throws SQLException;
  public void choiceMap(String id,int map_num) throws SQLException;
  public void choiceDelete(String id, int map_num) throws SQLException;
  public void applyMember(String id,int map_num) throws SQLException;
  public void applyDelete(String id, int map_num) throws SQLException;
  public List getMember(int map_num)throws SQLException;
  public int choiceCheck (String id,int map_num) throws SQLException;
  public int applyCheck(String id,int map_num) throws SQLException;
 
  
  
  
  
}
