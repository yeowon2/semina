package kr.co.kwins.bookshop.service;

import java.util.List;

import kr.co.kwins.bookshop.model.Book;
import kr.co.kwins.bookshop.pager.Pager;

public interface BookService {

	List<Book> list(Pager pager);

	void add(Book item);

	void delete(Long bookid);

	Book item(Long bookid);

	void update(Book item);

}
