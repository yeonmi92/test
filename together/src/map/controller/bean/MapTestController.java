package map.controller.bean;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import map.service.bean.MapService;



// RestController -> 요청을 받아 JSP뷰를 만들어내는 용도가 아니라, 요청을 받아 REST방식의 데이터를 처리/전송해주는 목적으로 사용. Spring 4.0 부터 생긴 어노테이션
// RestController = Controller + ResponseBody 사용하던 형태를 합쳐 놓은 듯한 어노테이션 (이거 하나만 클래스 위에 선언하면됨) 
// 클래스레벨에 선언하면, 클래스 안에 작성된 요청 메서드들은 모두 @ResponseBody 추가해줄 필요없이 그냥 사용해도 됨.  
//  --> 이 클래스는 ajax 요청, 데이터 json으로 주고받기 용으로 사용하면 편하겠다 
@RestController
@RequestMapping("/map/")
public class MapTestController {

	@Autowired
	private MapService mapService = null;
	
	
	// jsp 페이지 대신 문자 형태로 객체 등 요소 들을 결과로 리턴 -> json 으로 응답 데이터 보내기 
	@RequestMapping("getPositions.git")
	public Map<String, Object> getPositions(){
		
		/*
		//객체{ 
		"positions" = 배열[ 객체{ "lat": 37.27, "lng":127.0 }, 객체{}, ...   ]     }
		{
		  "positions": [
			    {
			      "lat": 37.27943075229118,
			      "lng": 127.01763998406159
			    },
			    {
			      "lat": 37.55915668706214,
			      "lng": 126.92536526611102
			    }
		    ]
		    "list" : [
		    	{
		    		"board_map"
		    	},
		    ]
		    
		}
		
		// 테스트용 데이터 -> DB에서 가져오는것으로 변경 
		LatLng latlng1 = new LatLng();
		latlng1.setLat(37.27943075229118);
		latlng1.setLng(127.01763998406159);
		LatLng latlng2 = new LatLng();
		latlng2.setLat(37.55915668706214);
		latlng2.setLng(126.92536526611102);
		
		List<LatLng> list = new ArrayList<LatLng>();
		list.add(latlng1);
		list.add(latlng2);
		
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("positions", list);
		
		// 위 비지니스 로직 처리하는 내용은 Service,Dao 로 이관시키면 좋을듯. 
		 */
		// 전체 좌표만 
		//Map<String, Object> map =  mapService.getLatLng(sel, search);
		Map<String, Object> map =  mapService.getLatLng();
		
		System.out.println("map >>>" + map);
		
		return map;
	}
	
	// 검색한 좌표 + 데이터 
	@RequestMapping("getSearchPositions.git")
	public Map<String, Object> getSearchPositions(String sel, String search){
		
		Map<String, Object> map =  mapService.getSearchMap(sel, search);
		System.out.println(map);
		
		return map;
	}
	
	
	
	
}
