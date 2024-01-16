package kr.co.kwins.hello.controller;

import java.util.ArrayList;
import java.util.List;

import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;

import kr.co.kwins.hello.model.Book;

@RestController
public class RootController {

	@GetMapping
	String index() {
		return "index";
	}
	
	@GetMapping("/list")
	List<Book> list() {
		List<Book> list = new ArrayList<>();
		
		list.add(new Book(1L, "도서명_1", "출판사_1", 1000));
		list.add(new Book(2L, "도서명_2", "출판사_2", 2000));
		list.add(new Book(3L, "도서명_3", "출판사_3", 3000));
		list.add(new Book(4L, "도서명_4", "출판사_4", 4000));
		list.add(new Book(5L, "도서명_5", "출판사_5", 5000));
		
		return list;
	}
}
