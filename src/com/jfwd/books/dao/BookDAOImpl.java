package com.jfwd.books.dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import com.jfwd.books.model.Author;
import com.jfwd.books.model.Book;
import com.jfwd.books.model.Category;

public class BookDAOImpl implements BookDAO{
	static {
		try{
			Class.forName("org.postgresql.Driver");
		}catch(ClassNotFoundException ex){
			
		}
	}
	
	private Connection getConnection() throws SQLException{
		return DriverManager.getConnection("jdbc:postgresql://localhost:5432/books","postgres","postgres");
	}
	
	private void closeConnection(Connection connection){
		if (connection ==null)
			return;
		try{
			connection.close();
		}catch (SQLException ex){
			
		}
	}

	public List<Book> findAllBooks(){
		List<Book>  result = new ArrayList<>();
		List<Author> authorList = new ArrayList<>();
		 String sql = "Select * from book b join author a on b.id = a.book_id";
		 
		 Connection connection =null;
		 try {
			 connection = getConnection();
			 PreparedStatement statement = connection.prepareStatement(sql);
			 ResultSet resultSet = statement.executeQuery();
			 
		 }catch (SQLException ex){
			 ex.printStackTrace();
		 }finally{
			 closeConnection(connection);
		 }
		 return result;
	}
	
	public List<Book> searchBooksByKeyword(String keyWord){
		List<Book> result = new ArrayList<>();
		List<Author> authorList = new ArrayList<>();
		
		String sql = "select * from book b join author a on b.id = author.book_id"
				+" where book_title like '%"+keyWord.trim()+"%'"
				+" or first_name like '%"+keyWord.trim()+"%'"
				+" or last_name like '%"+keyWord.trim()+"%'";
		
		Connection connection = null;
		try{
			
			connection = getConnection();
			PreparedStatement statement = connection.prepareStatement(sql);
			ResultSet resultSet = statement.executeQuery();
			while(resultSet.next()){
				Book book = new Book();
				Author author = new Author();
				book.setId(resultSet.getLong("id"));
				book.setBookTitle(resultSet.getString("book_title"));
				book.setCategoryId(resultSet.getLong("category_id"));
				author.setBookId(resultSet.getLong("book_id"));
				author.setFirstName(resultSet.getString("first_name"));
				author.setLastName(resultSet.getString("last_name"));
				authorList.add(author);
				book.setAuthors(authorList);
				book.setPublisherName(resultSet.getString("publisher"));
				result.add(book);
			}			
		}catch (SQLException ex){
			ex.printStackTrace();
		}finally{
			closeConnection(connection);
		}
		
		return result;
	}
	public List<Category> findAllCategories(){
		List<Category> result = new ArrayList<>();
		String sql = "select * from category";
		Connection connection =null;
		
		try{
			connection = getConnection();
			PreparedStatement statement = connection.prepareStatement(sql);
			ResultSet result = statement.executeQuery();
		}catch (SQLException ex){
			ex.printStackTrace();			
		}finally{
			closeConnection(connection);
		}
		
		
		
		return result;
	}
	public void insert(Book book){}
	public void update(Book book){}
	public void delete(Long bookId){}	
}
