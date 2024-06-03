package models;

import java.sql.Date;

public class Librarian {

  //properties
  private Integer librarianId;
  private User user;
  private Library library;
  private Status status;
  private Date joinedOn;
  private Date leftOn;
  
  //constructor
  public Librarian() {}
  
  //GET/SET
  public Integer getLibrarianId() {
    return librarianId;
  }
  
  public void setLibrarianId(Integer librarianId) {
    this.librarianId = librarianId;
  }

  public User getUser() {
    return user;
  }
  
  public void setUser(User user) {
    this.user = user;
  }
  
  public Library getLibrary() {
    return library;
  }
  
  public void setLibrary(Library library) {
    this.library = library;
  }
  
  public Status getStatus() {
    return status;
  }
  
  public void setStatus(Status status) {
    this.status = status;
  }
  
  public Date getJoinedOn() {
    return joinedOn;
  }
  
  public void setJoinedOn(Date joinedOn) {
    this.joinedOn = joinedOn;
  }
  
  public Date getLeftOn() {
    return leftOn;
  }
  
  public void setLeftOn(Date leftOn) {
    this.leftOn = leftOn;
  }
}
