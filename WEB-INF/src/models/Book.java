package models;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import models.*;

public class Book {

  //properties
  private Integer bookId;
  private String title;
  private Category category;
  private Publisher publisher;
  private String bookPic;

  //constructor
  public Book() {}

  public Book(Integer bookId ){
    this.bookId = bookId; 
  }

  public Book(String title, Category category, Publisher publisher) {
    this.title = title;
    this.category = category;
    this.publisher = publisher;
  }

  public Book(Publisher publisher){
    this.publisher = publisher;
  }

  public Book(String title,Category catedory,Publisher publihser,String bookPic){ 
    this.title = title;
    this.category = catedory;
    this.publisher = publihser;
    this.bookPic = bookPic;
  }
  public Book(Integer bookId,String title,Category catedory, String bookPic){
    this.bookId = bookId;
    this.title = title;
    this.category = catedory;
    this.bookPic = bookPic;
  }



  ////// methods //////
  public ArrayList<Book> collectAllBooks(Integer publisherId){
    ArrayList<Book> list = new ArrayList<>();

    try{
      Class.forName("com.mysql.cj.jdbc.Driver");
      Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/lmsdb?user=root&password=1234");
            
      String query = "select book_id,title,c.category_id,name, book_pic from books as b inner join categories as c where b.category_id=c.category_id and publisher_id = ?";

      PreparedStatement ps = con.prepareStatement(query);

      ps.setInt(1,publisherId);

      ResultSet rs = ps.executeQuery();

      while(rs.next()){
        list.add(new Book(rs.getInt(1),rs.getString(2),new Category(rs.getInt(3),rs.getString(4)),rs.getString(5)));
      }
      con.close();
    }catch(SQLException|ClassNotFoundException e){
      e.printStackTrace();
    }
    return list;
  }



  public void saveBookPic() {
    try {
        Class.forName("com.mysql.cj.jdbc.Driver");
        Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/lmsdb?user=root&password=1234");

        String query = "update books set book_pic=? where book_id=?";
        PreparedStatement ps = con.prepareStatement(query);

        ps.setString(1, bookPic);
        ps.setInt(2, bookId);
        
        ps.executeUpdate();
        
        con.close();
    }catch(SQLException|ClassNotFoundException e) {
        e.printStackTrace();
    }
  }



  
  public boolean saveBook() {
    boolean flag = false;

      try {
        Class.forName("com.mysql.cj.jdbc.Driver");
        Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/lmsdb?user=root&password=1234");

        String query = "insert into books (title,category_id,publisher_id) value (?,?,?)";

        PreparedStatement ps = con.prepareStatement(query);

        ps.setString(1, title);
        ps.setInt(2, category.getCategoryId());
        ps.setInt(3, publisher.getPublisherId());

        int val = ps.executeUpdate();

        if(val == 1) 
          flag = true;

          con.close();
        } catch(SQLException|ClassNotFoundException e) {
          e.printStackTrace();
        }

        return flag;
    }

    public void deleteBook(Book book){
      try{
        Class.forName("com.mysql.cj.jdbc.Driver");
        Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/lmsdb?user=root&password=1234");
        
        String query = "DELETE from books WHERE book_id=?";
        BookEdition e = new BookEdition(book);
        e.deleteBookEdition(1);

        PreparedStatement ps = con.prepareStatement(query);
        ps.setInt(1,bookId);

        ps.executeUpdate();
        con.close();

      }catch(SQLException | ClassNotFoundException e){
        e.printStackTrace();
      }

    }



  //GET/SET

  public Integer getBookId() {
    return bookId;
  }

  public void setBookId(Integer bookId) {
    this.bookId = bookId;
  }

  public String getTitle() {
    return title;
  }

  public void setTitle(String title) {
    this.title = title;
  }

  public Category getCategory() {
    return category;
  }

  public void setCategory(Category category) {
    this.category = category;
  }
  
  public Publisher getPublisher() {
    return publisher;
  }

  public void setPublisher(Publisher publisher) {
    this.publisher = publisher;
  }

  public String getBookPic() {
    return bookPic;
  }

  public void setBookPic(String bookPic) {
    this.bookPic = bookPic;
  }

}
