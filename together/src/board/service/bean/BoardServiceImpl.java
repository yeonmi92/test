package board.service.bean;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.io.PrintWriter;
import java.sql.SQLException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;
import org.springframework.web.context.request.RequestAttributes;
import org.springframework.web.context.request.RequestContextHolder;

import board.model.dao.BoardDAO;
import board.model.dto.BoardDTO;

@Service
public class BoardServiceImpl implements BoardService{

	@Autowired
	private BoardDAO boardDAO = null;
	
	@Override
	public Map getSearchList(String pageNum, int sel, String search, String keyword) throws SQLException {
		
		if(pageNum == null) {
			pageNum = "1";
		}
		
		
		int pageSize = 10;
		int currPage = Integer.parseInt(pageNum);
		int startRow = (currPage-1)*pageSize+1;
		int endRow = currPage*pageSize;
		int number = 0;
		
		List articleList = null;
		List noticeList = boardDAO.getNotice();
		
		Map info = new HashMap();
		info.put("search", search);
		info.put("sel", sel);
		info.put("keyword", keyword);
		info.put("start", startRow);
		info.put("end", endRow);
		
		int count = boardDAO.getSearchArticleCount(info);
		
		if(count > 0) {
			articleList = boardDAO.selectSearch(info);
		}
		
		
		number = count-(currPage-1)*pageSize;
		
		Map map = new HashMap();
		
		map.put("pageNum", pageNum);
		map.put("pageSize", pageSize);
		map.put("startRow", startRow);
		map.put("endRow", endRow);
		map.put("currPage", currPage);
		map.put("number", number);
		map.put("articleList", articleList);
		map.put("count", count);
		map.put("sel", sel);
		map.put("noticeList", noticeList);
		
		return map;
	}
	@Override
	public Map getList(String pageNum, int sel) throws SQLException {
		
		if(pageNum == null) {
			pageNum = "1";
		}
		
		
		int pageSize = 10;
		int currPage = Integer.parseInt(pageNum);
		int startRow = (currPage-1)*pageSize+1;
		int endRow = currPage*pageSize;
		int number = 0;
		
		List articleList = null;
		List noticeList = boardDAO.getNotice();
		
		int count = boardDAO.getArticleCount(sel);
		Map sMap = null;
		if(count > 0) {
			articleList = boardDAO.selectAll(startRow, endRow, sel);
		}
		
		
		number = count-(currPage-1)*pageSize;
		
		Map map = new HashMap();
		
		map.put("pageNum", pageNum);
		map.put("pageSize", pageSize);
		map.put("startRow", startRow);
		map.put("endRow", endRow);
		map.put("currPage", currPage);
		map.put("number", number);
		map.put("articleList", articleList);
		map.put("count", count);
		map.put("sel", sel);
		map.put("noticeList", noticeList);
		
		return map;
	}

	@Override
	public void modifyArticle(BoardDTO dto) throws SQLException {
		boardDAO.modifyArticle(dto);
	}

	@Override
	public BoardDTO getArticle(int num) throws SQLException {
		BoardDTO article = boardDAO.getArticle(num);
		return article;
	}

	@Override
	public void deleteArticle(int num) throws SQLException {
		boardDAO.deleteArticle(num);
		
	}

	@Override
	public String getId() throws SQLException {
		
		String id = (String)RequestContextHolder.getRequestAttributes().getAttribute("memId", RequestAttributes.SCOPE_SESSION);
		
		return id;
		
	}

	@Override
	public void insertArticle(BoardDTO dto) throws SQLException, IOException {
		boardDAO.insertArticle(dto);
	}

	@Override
	public void fileupload(HttpServletRequest request, HttpServletResponse response) throws SQLException {
		 
		
		try {

	         //파일정보

	         String sFileInfo = "";

	         //파일명을 받는다 - 일반 원본파일명

	         String filename = request.getHeader("file-name");

	         //파일 확장자

	         String filename_ext = filename.substring(filename.lastIndexOf(".")+1);

	         //확장자를소문자로 변경

	         filename_ext = filename_ext.toLowerCase();

	         //파일 기본경로

	         String dftFilePath = request.getSession().getServletContext().getRealPath("/");

	         //파일 기본경로 _ 상세경로

	         String filePath = dftFilePath + "save" + File.separator + "photo_upload" + File.separator;

	         System.out.println(filePath);

	         File file = new File(filePath);

	         if(!file.exists()) {

	            file.mkdirs();

	         }

	         String realFileNm = "";

	         SimpleDateFormat formatter = new SimpleDateFormat("yyyyMMddHHmmss");

	         String today= formatter.format(new java.util.Date());

	         realFileNm = today+UUID.randomUUID().toString() + filename.substring(filename.lastIndexOf("."));

	         String rlFileNm = filePath + realFileNm;

	         ///////////////// 서버에 파일쓰기 ///////////////// 

	         InputStream is = request.getInputStream();

	         OutputStream os=new FileOutputStream(rlFileNm);

	         int numRead;

	         byte b[] = new byte[Integer.parseInt(request.getHeader("file-size"))];

	         while((numRead = is.read(b,0,b.length)) != -1){

	            os.write(b,0,numRead);

	         }

	         if(is != null) {

	            is.close();

	         }

	         os.flush();

	         os.close();

	         ///////////////// 서버에 파일쓰기 /////////////////

	         // 정보 출력

	         sFileInfo += "&bNewLine=true";

	         // img 태그의 title 속성을 원본파일명으로 적용시켜주기 위함

	         sFileInfo += "&sFileName="+ filename;
	         
	         sFileInfo += "&sFileURL="+"/together/save/photo_upload/"+realFileNm;

	         PrintWriter print = response.getWriter();

	         print.print(sFileInfo);

	         print.flush();

	         print.close();

	    } catch (Exception e) {

	        e.printStackTrace();

	    }
		
		

	}

	@Override
	public void addReadcount(int board_num) throws SQLException {
		boardDAO.addReadcount(board_num);
	}

	@Override
	public void writeReply(String replyText, String id, int board_num) throws SQLException {
		Map map = new HashMap();
		map.put("replyText", replyText);
		map.put("id", id);
		map.put("board_num", board_num);
		boardDAO.writeReply(map);
	}

	@Override
	public List getReplies(int num) throws SQLException {
		List replies = boardDAO.getReplies(num);
		return replies;
	}




	
	

}
