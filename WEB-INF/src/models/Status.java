package models;

public class Status {

  ///////////properties//////////
  private Integer statusId;
  private String name;

  public static final int ACTIVE = 1;
  public static final int INACTIVE = 2;
  public static final int BLOCKED = 3;
  public static final int CLOSED = 4;
  public static final int LEFT = 5;
  public static final int PHONE_VERIFIED = 6;
  public static final int EMAIL_VERIFIED = 7;
  public static final int MANUAL_VERIFICATION_DONE = 8;

  ///////////constructor//////////
  public Status() {}

  public Status(Integer statusId) {
    this.statusId = statusId;
  }

  ///////////GET/SET//////////
  public Integer getStatusId() {
    return statusId;
  }

  public void setStatusId(Integer statusId) {
    this.statusId = statusId;
  }

  public String getName() {
    return name;
  }

  public void setName(String name) {
    this.name = name;
  }
}
