package models;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;

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


  public LibraryBook(BookEdition bookEdition, Integer copies, Library library) {
    this.bookEdition = bookEdition;
    this.copies = copies;
    this.library = library;
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
