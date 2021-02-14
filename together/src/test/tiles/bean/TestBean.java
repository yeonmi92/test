package test.tiles.bean;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/test/")
public class TestBean {
	
	@RequestMapping("test.git")
	public String test() {
		
		return "test/test.tiles";
	}
	
	@RequestMapping("test1.git")
	public String test1() {
		
		return "test/test";
	}
	
	@RequestMapping("boot.git")
	public String boot() {
		return "bootstrap/index";
	}
}
