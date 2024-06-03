package models;

public class UserType {

  ///////////properties//////////
  private Integer userTypeId;
  private String type;

  public static String[] types = {"candidate", "library", "publisher","librarian"};
  
  ///////////constructor//////////
  public UserType(Integer userTypeId) {
    this.userTypeId = userTypeId;
  }

  /////////////GET-SET///////////
  public Integer getUserTypeId() {
    return userTypeId;
  }

  public void setUserTypeId(Integer userTypeId) {
    this.userTypeId = userTypeId;
  }

  public String getType() {
    return type;
  }

  public void setType(String type) {
    this.type = type;
  }
}
