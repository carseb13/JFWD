package com.jfwd.books.client;
import java.util.List;
import com.jfwd.books.dao.BookDAO;
import com.jfwd.books.dao.BookDAOImpl;
import com.jfwd.books.model.Book;

public class BookApp {
	private static BookDAO bookDao = new BookDAOImpl();
	
	public static void main(String[] args){
		//Listar libros
		System.err.println("Listando los libros");
		findAllBooks();
		System.out.println();
		//Search book by keyword
		System.err.println("Search books by keyword in book's title: Groovy");
		searchBooks("Groovy");
		System.out.println();
		
		System.err.println("Search books by keyword in author's Name: Josh");
		searchBooks("Josh");
	}
	
	private static void findAllBooks(){
		List<Book> books = bookDao.findAllBooks();
		for ( Book book : books){
			System.out.println(book);			
		}
	}
	
	private static void searchBooks(String keyword){
		List<Book> books = bookDao.searchBooksByKeyword(keyword);
		for ( Book book : books){
			System.out.println(book);			
		}
	}
}
