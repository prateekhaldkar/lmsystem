package models;

import java.sql.Connection;
import java.sql.Date;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

public class BookEdition  {

  //properties
  private Integer bookEditionId;
  private Book book;
  private Integer edition;
  private Date publishedOn;
  private Integer price;
  private String details;
  private Integer isbnNo;
  private String bookEditionPic;

  //constructor

  public BookEdition(){

  }

  public BookEdition(Book book) {
    this.book = book;
  }

  public BookEdition(Integer bookEditionId, Integer edition, Date publishedOn, Integer price, String details,Integer isbnNo, String bookEditionPic) {
    this.bookEditionId = bookEditionId;
    this.edition = edition;
    this.publishedOn = publishedOn;
    this.price = price;
    this.details = details;
    this.isbnNo = isbnNo;
    this.bookEditionPic = bookEditionPic;
  }  

  public BookEdition(Book book, Integer edition, Date publishedOn, Integer price, String details, Integer isbnNo) {
    this.book = book;
    this.edition = edition;
    this.publishedOn = publishedOn;
    this.price = price;
    this.details = details;
    this.isbnNo = isbnNo;
  }

  // methods 


  public ArrayList<BookEdition> collectAllEditions(){
        ArrayList<BookEdition> list = new ArrayList<>();
        try{Class.forName("com.mysql.cj.jdbc.Driver");}catch(ClassNotFoundException e){e.printStackTrace();}
        
        String query = "select book_edition_id,edition,published_on,price,details,isbn_no,book_edition_pic from book_editions where book_id=?";
        
        try(Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/lmsdb?user=root&password=1234")){
            PreparedStatement ps = con.prepareStatement(query);  
            ps.setInt(1,book.getBookId());

            ResultSet rs = ps.executeQuery();
            while(rs.next()){
                list.add(new BookEdition(rs.getInt(1),rs.getInt(2),rs.getDate(3),rs.getInt(4),rs.getString(5),rs.getInt(6),rs.getString(7)));
            }
        }catch(SQLException e){
            e.printStackTrace();
        }
        return list;
    }

 

  public void saveBookEdition(){
        try{
            Class.forName("com.mysql.cj.jdbc.Driver");
            Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/lmsdb?user=root&password=1234");
            String query = "insert into book_editions(book_id,edition,published_on,price,details,isbn_no) value(?,?,?,?,?,?)";
            PreparedStatement ps = con.prepareStatement(query);
            
            ps.setInt(1,book.getBookId());
            ps.setInt(2,edition);
            ps.setDate(3,publishedOn);
            ps.setInt(4,price);
            ps.setString(5,details);
            ps.setInt(6,isbnNo);

            ps.executeUpdate();
            
            con.close();
            

        }catch(SQLException|ClassNotFoundException e){
            e.printStackTrace();
        }
    }





  //GET/SET
  public Integer getBookEditionId() {
    return bookEditionId;
  }

  public void setBookEditionId(Integer bookEditionId) {
    this.bookEditionId = bookEditionId;
  }

  public Book getBook() {
    return book;
  }

  public void setBook(Book book) {
    this.book = book;
  }

  public Integer getEdition() {
    return edition;
  }

  public void setEdition(Integer edition) {
    this.edition = edition;
  }

  public Date getPublishedOn() {
    return publishedOn;
  }

  public void setPublishedOn(Date publishedOn) {
    this.publishedOn = publishedOn;
  }

  public Integer getPrice() {
    return price;
  }

  public void setPrice(Integer price) {
    this.price = price;
  }

  public String getDetails() {
    return details;
  }

  public void setDetails(String details) {
    this.details = details;
  }

  public Integer getIsbnNo() {
    return isbnNo;
  }

  public void setIsbnNo(Integer isbnNo) {
    this.isbnNo = isbnNo;
  }

  public String getBookEditionPic() {
    return bookEditionPic;
  }

  public void setBookEditionPic(String bookEditionPic) {
    this.bookEditionPic = bookEditionPic;
  }  
}
