package board.model.test;

import java.sql.SQLException;
import java.util.List;

import static org.hamcrest.CoreMatchers.is;
import static org.junit.Assert.assertThat;

import org.junit.Before;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.ApplicationContext;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import board.model.dto.BoardDTO;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = "/board/model/test/applicationContext.xml")
public class BoardDAOTest {
	
	@Autowired
	private ApplicationContext context;
	
	private BoardDAO dao;
	
	@Before
	public void prepare() {
		this.dao = context.getBean("BoardDAO", BoardDAO.class);
	}
	
	@Test
	public void addAndGet() throws ClassNotFoundException, SQLException{
		
		List articleList = dao.getAll();
		
		int sel = 1;
		List selectList = dao.getSelected(sel);
		
		
	}
	
}
