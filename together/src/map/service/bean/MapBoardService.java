package map.service.bean;

import java.sql.SQLException;
import java.util.List;

import map.model.dto.MapBoardDTO;
import member.model.dto.MemberDTO;

public interface MapBoardService {
	
  public void insertMap(MapBoardDTO dto) throws SQLException;
  public MapBoardDTO detailMap(int map_num) throws SQLException;
  public void modifyMap(MapBoardDTO dto) throws SQLException;
  public List allList() throws SQLException;
  public List searchInfo(MapBoardDTO dto) throws SQLException;
  public void deleteMap(int map_num) throws SQLException;
  
  public void joinMember(String id,int map_num) throws SQLException;
  public void choiceMap(int map_num) throws SQLException;
  public void choiceDelete(int map_num) throws SQLException;
  public void applyMember(int map_num) throws SQLException;
  public void choiceId(MapBoardDTO dto) throws SQLException;
  public int choiceCheck(int map_num) throws SQLException;
  public int applyCheck(int map_num) throws SQLException;
  public void applyDelete(int map_num) throws SQLException;
  public List getMember(int map_num) throws SQLException;
  
  
  

}
