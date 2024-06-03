package models;

import java.sql.Date;

public class Membership {

  //properties
  private Integer membershipId;
  private User user;
  private Library library;
  private Date joinedOn;
  private Date leftOn;
  private Integer currentDues;

  //constructor
  public Membership() {}

  //GET/SET
  public Integer getMembershipId() {
    return membershipId;
  }

  public void setMembershipId(Integer membershipId) {
    this.membershipId = membershipId;
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

  public Integer getCurrentDues() {
    return currentDues;
  }

  public void setCurrentDues(Integer currentDues) {
    this.currentDues = currentDues;
  }
}
