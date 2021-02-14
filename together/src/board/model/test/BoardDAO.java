package board.model.test;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import javax.sql.DataSource;

import board.model.dto.BoardDTO;

public class BoardDAO {
	
	private DataSource dataSource;
	public void setDataSource(DataSource dataSource) {
		this.dataSource = dataSource;
	}
	
	public List getAll() {
		List articleList = null;
		Connection conn = null;
		ResultSet rs = null;
		PreparedStatement pstmt = null;
		try {
			conn = dataSource.getConnection();
			pstmt = conn.prepareStatement("select * from board where sel != 3");
			rs = pstmt.executeQuery();
			if(rs.next()) {
				articleList = new ArrayList();
				System.out.println("--------------모든 목록------------------");
				do {
					BoardDTO dto = new BoardDTO();
					dto.setId(rs.getString("id"));
					dto.setSel(rs.getInt("sel"));
					dto.setTitle(rs.getString("title"));
					System.out.print(dto.getId() + "	");
					System.out.print(dto.getSel()+ "	");
					System.out.println(dto.getTitle()+ "		");
					
				}while(rs.next());
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} 
		finally {
			if(pstmt!=null) try { pstmt.close(); } catch (SQLException e) { e.printStackTrace(); }
			if(conn!=null) try { conn.close(); } catch (SQLException e) { e.printStackTrace(); }
			if(rs!=null) try { rs.close(); } catch (SQLException e) { e.printStackTrace(); }
		}
		
		return articleList;
	}
	
	public List getSelected(int sel) {
		List articleList = null;
		Connection conn = null;
		ResultSet rs = null;
		PreparedStatement pstmt = null;
		try {
			conn = dataSource.getConnection();
			pstmt = conn.prepareStatement("select * from board where sel = ?");
			pstmt.setInt(1, sel);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				articleList = new ArrayList();
				System.out.println("--------------분류 선택------------------");
				do {
					BoardDTO dto = new BoardDTO();
					dto.setId(rs.getString("id"));
					dto.setSel(rs.getInt("sel"));
					dto.setTitle(rs.getString("title"));
					System.out.print(dto.getId() + "	");
					System.out.print(dto.getSel()+ "	");
					System.out.println(dto.getTitle()+ "		");
					
				}while(rs.next());
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} 
		finally {
			if(pstmt!=null) try { pstmt.close(); } catch (SQLException e) { e.printStackTrace(); }
			if(conn!=null) try { conn.close(); } catch (SQLException e) { e.printStackTrace(); }
			if(rs!=null) try { rs.close(); } catch (SQLException e) { e.printStackTrace(); }
		}
		
		return articleList;
	}
	
	
}
