package models;

import java.sql.Timestamp;

public class IssuedBook {

  //properties
  private Integer issuedBookId;
  private BookEdition bookEdition;
  private Membership membership;
  private Timestamp issueDate;
  private Timestamp returnDate;
  private Integer fine;

  //constructor
  public IssuedBook() {}

  //GET/SET
  public Integer getIssuedBookId() {
    return issuedBookId;
  }

  public void setIssuedBookId(Integer issuedBookId) {
    this.issuedBookId = issuedBookId;
  }

  public BookEdition getBookEdition() {
    return bookEdition;
  }

  public void setBookEdition(BookEdition bookEdition) {
    this.bookEdition = bookEdition;
  }

  public Membership getMembership() {
    return membership;
  }

  public void setMembership(Membership membership) {
    this.membership = membership;
  }

  public Timestamp getIssueDate() {
    return issueDate;
  }

  public void setIssueDate(Timestamp issueDate) {
    this.issueDate = issueDate;
  }

  public Timestamp getReturnDate() {
    return returnDate;
  }

  public void setReturnDate(Timestamp returnDate) {
    this.returnDate = returnDate;
  }

  public Integer getFine() {
    return fine;
  }

  public void setFine(Integer fine) {
    this.fine = fine;
  }
}
