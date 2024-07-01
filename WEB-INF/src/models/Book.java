package models;

public class Book {

  //properties
  private Integer bookId;
  private String isbnNo;
  private String title;
  private Category category;
  private Publisher publisher;

  //constructor
  public Book() {}

  //GET/SET

  public Integer getBookId() {
    return bookId;
  }

  public void setBookId(Integer bookId) {
    this.bookId = bookId;
  }

  public String getIsbnNO() {
    return isbnNo;
  }

  public void setIsbnNO(String isbnNo) {
    this.isbnNo = isbnNo;
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
}
