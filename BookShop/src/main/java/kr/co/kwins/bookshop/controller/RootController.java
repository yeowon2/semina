package kr.co.kwins.bookshop.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller // Thymeleaf를 사용해주기 위해 그냥 controller
public class RootController {
	
	@GetMapping("/")
	String index() {
		return "index";
	}
}
