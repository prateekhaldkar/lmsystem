package models;

public class BookAuthor {

  private Integer bookAuthorId;
  private BookEdition bookEdition;
  private User user;

  public Integer getBookAuthorId() {
    return bookAuthorId;
  }

  public void setBookAuthorId(Integer bookAuthorId) {
    this.bookAuthorId = bookAuthorId;
  }

  public BookEdition getBookEdition() {
    return bookEdition;
  }

  public void setBookEdition(BookEdition bookEdition) {
    this.bookEdition = bookEdition;
  }

  public User getUser() {
    return user;
  }

  public void setUser(User user) {
    this.user = user;
  }

  public BookAuthor() {

  }

  
}
