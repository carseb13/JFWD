package com.jfwd.books.dao;
import java.util.List;

import com.jfwd.books.model.Book;
import com.jfwd.books.model.Category;
public interface BookDAO {
	/**
	 * Interface DAO para CRUD
	 * @author cesquivel
	 */
	
	public List<Book> findAllBooks();
	public List<Book> searchBooksByKeyword(String keyword);
	public List<Category> findAllCategories();
	public void insert(Book book);
	public void update(Book book);
	public void delete(Long bookId);	
}
