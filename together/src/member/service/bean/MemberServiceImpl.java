package member.service.bean;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOError;
import java.io.IOException;
import java.sql.SQLException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.context.request.RequestAttributes;
import org.springframework.web.context.request.RequestContextHolder;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import map.model.dto.MapBoardDTO;
import member.model.dao.MemberDAOImpl;
import member.model.dto.MemberDTO;


@Service
public class MemberServiceImpl implements MemberService{

	@Autowired
	private MemberDAOImpl memberDAO = null;
	
	
	@Override
	public void insertMember(MemberDTO dto, String hobby, String imgName) throws SQLException {
		
		String[] hobbies = hobby.split(",");
		
		if(hobbies.length != 0) {
			if(hobbies.length == 1) {
				dto.setHobby1(hobbies[0]);
			}else if(hobbies.length == 2) {
				dto.setHobby1(hobbies[0]);
				dto.setHobby2(hobbies[1]);
			}else {
				dto.setHobby1(hobbies[0]);
				dto.setHobby2(hobbies[1]);
				dto.setHobby3(hobbies[2]);
			}
		}
		dto.setImg(imgName);
		
		memberDAO.insertMember(dto);
	}

	@Override
	public void updateMember(MemberDTO dto, String hobby, String imgName) throws SQLException {

		String id = (String)RequestContextHolder.getRequestAttributes().getAttribute("memId", RequestAttributes.SCOPE_SESSION);
		System.out.println(id);
		System.out.println(hobby);
		
		String[] hobbies = hobby.split(",");
		
		if(hobbies.length != 0) {
			if(hobbies.length == 1) {
				dto.setHobby1(hobbies[0]);
			}else if(hobbies.length == 2) {
				dto.setHobby1(hobbies[0]);
				dto.setHobby2(hobbies[1]);
			}else {
				dto.setHobby1(hobbies[0]);
				dto.setHobby2(hobbies[1]);
				dto.setHobby3(hobbies[2]);
			}
		}
		dto.setId(id);
		if(!imgName.equals("notexist")) {
			dto.setImg(imgName);
		}
		memberDAO.updateMember(dto);
		
	}

	@Override
	public void deleteMember() throws SQLException {
		// TODO Auto-generated method stub
		
	}

	@Override
	public int login(MemberDTO dto) throws SQLException {
		
		int result = memberDAO.login(dto);
		
		return result;
		
	}

	@Override
	public void logout(String sessionName) throws SQLException {

		RequestContextHolder.getRequestAttributes().removeAttribute(sessionName, RequestAttributes.SCOPE_SESSION);
		
	}

	@Override
	public HashMap myInfoView() throws SQLException {

		String id = (String)RequestContextHolder.getRequestAttributes().getAttribute("memId", RequestAttributes.SCOPE_SESSION);
		
		HashMap map = new HashMap();
		
		MemberDTO dto = memberDAO.myInfoView(id);
		List reviewList = memberDAO.reviewList(id);

		map.put("dto", dto);
		map.put("reviewList", reviewList);
		
		return map;
	}

	@Override
	public HashMap infoView(String id) throws SQLException {

		HashMap map = new HashMap();
		
		MemberDTO dto = memberDAO.myInfoView(id);
		List reviewList = memberDAO.reviewList(id);
		
		map.put("dto", dto);
		map.put("reviewList", reviewList);
		
		return map;
	}
	
	@Override
	public List memberList() throws SQLException {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public List reviewList() throws SQLException {

		
		
		
		return null;
	}

	@Override
	public void insertReview(String reviewId, String review, String val) throws SQLException {

		String id = (String)RequestContextHolder.getRequestAttributes().getAttribute("memId", RequestAttributes.SCOPE_SESSION);
		
		memberDAO.insertReview(reviewId, review, val, id);
		
		
	}

	@Override
	public HashMap historyList(String pageNum, String sel, String search, String sort) throws SQLException {

		String id = (String)RequestContextHolder.getRequestAttributes().getAttribute("memId", RequestAttributes.SCOPE_SESSION);
		
		HashMap page = new HashMap();
		if(pageNum == null) {
			pageNum = "1";
		}
		int pageSize = 10;
		// 현재 페이지에 보여줄 게시글의 시작과 끝 등등 정보 세팅
		int currPage = Integer.parseInt(pageNum); // 페이지 계산을 위해 숫자로 형변환
		int startRow = (currPage-1) * pageSize + 1;
		int endRow = currPage * pageSize;
		int count = 0; // DB에 있는 게시글의 총 개수를 담을 변수 미리 선언
		int number = 0; // 게시판 상의 글번호 뿌려줄 변수 미리 선언
		
		List historyList = null;
		
		number = count - (currPage - 1) * pageSize;
		
		List allList = null;
		
		if(sort == null) { sort = "0"; }
		
		HashMap history = memberDAO.historyList(id, sel, search, sort);
		historyList = (List)history.get("history");
		count = (int)history.get("count");
		/*
		int emp = 0;
		if(allList != null) {
			for(int i = 0; i < allList.size(); i++) {
					HashMap mapList = (HashMap)allList.get(i);
					String[] pplJoin = mapList.get("PPL_JOIN").toString().split("-");
				if(emp < currPage*pageSize) {
					for(String a : pplJoin) {
						if(a.equals(id)) {
							if(emp >= startRow -1) {
								historyList.add(allList.get(i));
							}
							emp ++;
							System.out.println("emp" + emp);
						}
					}
				}
			}
			for(int i = 0; i < allList.size(); i++) {
				HashMap mapList = (HashMap)allList.get(i);
				String[] pplJoin = mapList.get("PPL_JOIN").toString().split("-");
				for(String a : pplJoin) {
					if(a.equals(id)) {
						count ++;
					}
				}
			}
		}
		*/
		
		page.put("pageNum", pageNum);
		page.put("pageSize", pageSize);
		page.put("currPage", currPage);
		page.put("startRow", startRow);
		page.put("endRow", endRow);
		page.put("count", count);
		page.put("number", number);
		page.put("historyList", historyList);
		
		return page;
	}

	@Override
	public Map blackList() throws SQLException {
		String id = (String)RequestContextHolder.getRequestAttributes().getAttribute("memId", RequestAttributes.SCOPE_SESSION);
		
		int count = memberDAO.blackcnt(id);
		
		List blackList = null;
		
		if(count > 0) {
			blackList = memberDAO.blackList(id);
		}
		
		Map map = new HashMap();
		map.put("count", count);
		map.put("blackList", blackList);
		
		return map;
	}

	@Override
	public void deleteBlack() throws SQLException {
		// TODO Auto-generated method stub
		
	}

	@Override
	public List searchBlack() throws SQLException {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public HashMap choiceList(String pageNum, String sel, String search) throws SQLException {

		String id = (String)RequestContextHolder.getRequestAttributes().getAttribute("memId", RequestAttributes.SCOPE_SESSION);
		
		HashMap page = new HashMap();
		
		if(pageNum == null) {
			pageNum = "1";
		}
		int pageSize = 10;
		// 현재 페이지에 보여줄 게시글의 시작과 끝 등등 정보 세팅
		int currPage = Integer.parseInt(pageNum); // 페이지 계산을 위해 숫자로 형변환
		int startRow = (currPage-1) * pageSize + 1;
		int endRow = currPage * pageSize;
		int count = 0; // DB에 있는 게시글의 총 개수를 담을 변수 미리 선언
		int number = 0; // 게시판 상의 글번호 뿌려줄 변수 미리 선언
		 
		List choiceList = null;
		
		if(sel != null && search != null) {
			count = memberDAO.myChoiceCount(id, sel, search);
			System.out.println("count" + count);
			if(count > 0) {
				choiceList = memberDAO.choiceList(id, sel, search, startRow, endRow);
			}
			
		}else {
			count = memberDAO.myChoiceCount(id,  sel, search);
			
			if(count > 0) {
				//articleList = boardDAO.getArticles(startRow, endRow);
				choiceList = memberDAO.choiceList(id, sel, search, startRow, endRow); 
			}
		}
		System.out.println("count : " + count);
		number = count - (currPage - 1) * pageSize;
		
		page.put("pageNum", pageNum);
		page.put("pageSize", pageSize);
		page.put("currPage", currPage);
		page.put("startRow", startRow);
		page.put("endRow", endRow);
		page.put("count", count);
		page.put("number", number);
		page.put("choiceList", choiceList);
		
				
		return page;
	}

	@Override
	public boolean idCheck(String id) throws SQLException {

		boolean result = memberDAO.idCheck(id);
		
		return result;
	}

	@Override
	public boolean pwCheck(String pw) throws SQLException {

		String id = (String)RequestContextHolder.getRequestAttributes().getAttribute("memId", RequestAttributes.SCOPE_SESSION);
		
		HashMap map = new HashMap();
		map.put("id", id);
		map.put("pw", pw);
		
		boolean result = memberDAO.pwCheck(map);
		
		return result;
	}

	private static final String SAVE_PATH = "/save";
	//private static final String PREFIX_URL = "/save/";
	
	@Override
	public String updateImg(MultipartFile multipartFile, MultipartHttpServletRequest request) {

		//String url = null;
		  String newImg = "";
		try {
			// 파일 정보
			// 원본 이름
			String originFilename = multipartFile.getOriginalFilename();
			// 이름만 추출
			String imgName = originFilename.substring(0, originFilename.lastIndexOf('.'));
			// 확장자만 추출
			String ext = originFilename.substring(originFilename.lastIndexOf('.'));
			
			Long date = System.currentTimeMillis();
			
			// String extName = originFilename.substring(originFilename.lastIndexOf("."), originFilename.length());
			Long size = multipartFile.getSize();
			
			// 서버에서 저장 할 파일 이름
			//String saveFileName = genSaveFileName(extName);
			
			String path = request.getRealPath("save");
			
			String saveFileName = path + "\\" + imgName + date + ext;
			
			System.out.println("originFilename : " + originFilename);
			System.out.println("extensionName : " + ext);
			System.out.println("size : " + size);
			System.out.println("saveFileName : " + saveFileName);
			
			
			writeFile(multipartFile, saveFileName);
			//url = PREFIX_URL + saveFileName;
			
			newImg = imgName + date + ext; 
		}catch(IOException e) {
			throw new RuntimeException(e);
		}
		
		return newImg;
	}
		
		// 파일을 실제로 write 하는 메서드
		private boolean writeFile(MultipartFile multipartFile, String saveFileName)
									throws IOException{
			boolean result = false;
			
			byte[] data = multipartFile.getBytes();
			FileOutputStream fos = new FileOutputStream(saveFileName);
			fos.write(data);
			fos.close();
			
			return result;
		}

		@Override
		public List choice_pplJoin(List choiceList) throws SQLException {
			
			
			List pplJoin = null;
			
			// choiceList가 null이 아니면
			if(choiceList != null) {
				pplJoin = new ArrayList();
				for(int i = 0; i<choiceList.size(); i ++) {
					
					HashMap choice = (HashMap)choiceList.get(i);
					String join = choice.get("PPL_JOIN").toString();
					System.out.println("join : " + join);
					
					if(join.equals("0")) {
						pplJoin.add("0");
						
					}else {
						
					String[] ppl = join.split("-");
					List ppl_join = new ArrayList();
					
					System.out.println("ppl" + ppl);
					System.out.println("ppl" + ppl);
					
					for(int j = 0; j < ppl.length; j ++) {
						if(!ppl[j].equals('0')) {
							String id = ppl[j];
							MemberDTO member = memberDAO.myInfoView(id);
							ppl_join.add(member);
						}
					}
					pplJoin.add(ppl_join);
					}
				}
			}
			return pplJoin;
		}

		@Override
		public List history_pplJoin(List historyList) throws SQLException {

			
			List pplJoin = null;
			if(historyList != null) {
				pplJoin = new ArrayList();
				for(int i = 0; i < historyList.size(); i++) {
					List ppl_join = new ArrayList();
					HashMap map = (HashMap)historyList.get(i);
					String map_num = map.get("MAP_NUM").toString();
					
					ppl_join = memberDAO.history_pplJoin(map_num);
					pplJoin.add(ppl_join);
				}
			}
			
			return pplJoin;
		}

		@Override
		public Map getList(String pageNum, int sel) throws SQLException {
			if(pageNum == null) {
				pageNum = "1";
			}
			
			String id = (String)RequestContextHolder.getRequestAttributes().getAttribute("memId", RequestAttributes.SCOPE_SESSION);
			
			System.out.println("service id : " + id);
			
			int pageSize = 10;
			int currPage = Integer.parseInt(pageNum);
			int startRow = (currPage-1)*pageSize+1;
			int endRow = currPage*pageSize;
			int number = 0;
			
			List articleList = null;
			
			Map info = new HashMap();
			info.put("sel", sel);
			info.put("start", startRow);
			info.put("end", endRow);
			info.put("id", id);
			
			int count = memberDAO.getmyArticleCount(info);
			
			System.out.println("dao count : " + count);
			
			if(count > 0) {
				System.out.println("111");
				articleList = memberDAO.getMyArticles(info);
				System.out.println("222");
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
			
			return map;
		}
		
		@Override
		public void black(String id) throws SQLException {
			String memId = (String)RequestContextHolder.getRequestAttributes().getAttribute("memId", RequestAttributes.SCOPE_SESSION);
			
			memberDAO.black(id, memId);
		}

		@Override
		public void unblock(String block_id) throws SQLException {
			String id = (String)RequestContextHolder.getRequestAttributes().getAttribute("memId", RequestAttributes.SCOPE_SESSION);
			Map map = new HashMap();
			map.put("block_id", block_id);
			map.put("id", id);
			memberDAO.unblock(map);
		}

		

		


}
