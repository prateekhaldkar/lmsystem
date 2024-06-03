package models;

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
