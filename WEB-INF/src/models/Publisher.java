package models;

public class Publisher {

  //properties
  private Integer publishetId;
  private User user;
  private String details;
  private String website;

  //constructor
  public Publisher() {}

  //GET/SET

  public Integer getPublishetId() {
    return publishetId;
  }

  public void setPublishetId(Integer publishetId) {
    this.publishetId = publishetId;
  }

  public User getUser() {
    return user;
  }

  public void setUser(User user) {
    this.user = user;
  }

  public String getDetails() {
    return details;
  }

  public void setDetails(String details) {
    this.details = details;
  }

  public String getWebsite() {
    return website;
  }

  public void setWebsite(String website) {
    this.website = website;
  }
}
