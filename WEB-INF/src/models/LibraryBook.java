package models;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import models.BookEdition;

public class LibraryBook {

  //properties
  private Integer libraryBookId;
  private Library library;
  private BookEdition bookEdition;
  private Integer copies;
  private Integer booksIssued;
  private Boolean scraped;

  //constructor
  public LibraryBook() {}

  public LibraryBook(BookEdition bookEdition){
    this.bookEdition = bookEdition;
}


  public LibraryBook(BookEdition bookEdition, Integer copies, Library library) {
    this.bookEdition = bookEdition;
    this.copies = copies;
    this.library = library;
  }

  public LibraryBook(Integer libraryBookId,Integer bookIssued,Integer copies,BookEdition bookEdition){
    this.libraryBookId = libraryBookId;
    this.booksIssued = bookIssued;
    this.copies = copies;
    this.bookEdition = bookEdition;
  }

  // methods
  public boolean addLibraryBooks(){
    boolean flag = false;

    try{
      Class.forName("com.mysql.cj.jdbc.Driver");
      Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/lmsdb?user=root&password=1234");

      String query = "insert into library_books (library_id, book_edition_id, copies) values(?,?,?)";

      PreparedStatement ps = con.prepareStatement(query);

      ps.setInt(1, library.getLibraryId());
      ps.setInt(2, bookEdition.getBookEditionId());
      ps.setInt(3, copies);

      int val = ps.executeUpdate();

        if (val == 1)
            flag = true;
    }catch(SQLException | ClassNotFoundException e){
      e.printStackTrace();
    }


    return flag;
  }

  // Search Book available In Library
  public ArrayList<LibraryBook> searchBookAvalableInLibrary(Integer id){
      ArrayList<LibraryBook> list = new ArrayList<>();
        try{
          Class.forName("com.mysql.cj.jdbc.Driver");
          Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/lmsdb?user=root&password=1234");
          
          String query = "SELECT lb.library_book_id, lb.books_issued, lb.copies, be.book_edition_id, b.title, b.book_id,be.book_edition_pic,be.edition  FROM library_books AS lb INNER JOIN book_editions AS be ON lb.book_edition_id = be.book_edition_id INNER JOIN books AS b ON be.book_id = b.book_id WHERE library_id = ? and  b.title LIKE ?";
          
          PreparedStatement ps = con.prepareStatement(query);  
          ps.setInt(1,id);
          ps.setString(2,"%"+bookEdition.getBook().getTitle()+"%");

          ResultSet rs = ps.executeQuery();

          while(rs.next()){
            list.add(new LibraryBook(rs.getInt(1),rs.getInt(2),rs.getInt(3),new BookEdition(rs.getInt(4),new Book(rs.getString(5),rs.getInt(6)),rs.getString(7),rs.getInt(8))));
          }
        }catch(SQLException | ClassNotFoundException e){
          e.printStackTrace();
        }

      return list;
  }

  //GET/SET
  public Integer getLibraryBookId() {
    return libraryBookId;
  }

  public void setLibraryBookId(Integer libraryBookId) {
    this.libraryBookId = libraryBookId;
  }

  public Library getLibrary() {
    return library;
  }

  public void setLibrary(Library library) {
    this.library = library;
  }

  public BookEdition getBookEdition() {
    return bookEdition;
  }

  public void setBookEdition(BookEdition bookEdition) {
    this.bookEdition = bookEdition;
  }

  public Integer getCopies() {
    return copies;
  }

  public void setCopies(Integer copies) {
    this.copies = copies;
  }

  public Integer getBooksIssued() {
    return booksIssued;
  }

  public void setBooksIssued(Integer booksIssued) {
    this.booksIssued = booksIssued;
  }

  public Boolean getScraped() {
    return scraped;
  }

  public void setScraped(Boolean scraped) {
    this.scraped = scraped;
  }
}
