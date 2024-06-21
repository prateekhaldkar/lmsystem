package models;

import java.sql.*;

public class Library extends User {

  //properties
  private Integer libraryId;
  private String details;
  private Time openTiming;
  private Time closeTiming;
  private Integer bookIssueDays;
  private Integer lateFine;
  private Integer depositAmount;

  //constructor
  public Library() {}

  public Library(String email, String password, UserType userType) {
    super(email, password, userType);
  }

  // methods

  public void saveDetails() {
    try {
      Class.forName("com.mysql.cj.jdbc.Driver");
      Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/lmsdb?user=root&password=1234");
      String query = "insert into libraries (user_id,details,open_timing,close_timing,book_issue_days,late_fine,deposit_amount) value (?,?,?,?,?,?,?)";

      PreparedStatement ps = con.prepareStatement(query);

      ps.setInt(1, getUserId());
      ps.setString(2, details);
      ps.setTime(3, openTiming);
      ps.setTime(4, closeTiming);
      ps.setInt(5, bookIssueDays);
      ps.setInt(6, lateFine);
      ps.setInt(7, depositAmount);

      ps.executeUpdate();

      con.close();
    } catch (SQLException | ClassNotFoundException e) {
      e.printStackTrace();
    }
  }

  public int login() {
    int result = super.login();

    if (result == 3 && getStatus().getStatusId() == Status.ACTIVE) {
      try {
        Class.forName("com.mysql.cj.jdbc.Driver");
        Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/lmsdb?user=root&password=1234");

        String query = "select * from libraries where user_id=?";

        PreparedStatement ps = con.prepareStatement(query);

        ps.setInt(1, getUserId());

        ResultSet rs = ps.executeQuery();

        if (rs.next()) {
          libraryId = rs.getInt("library_id");
          details = rs.getString("details");
          openTiming = rs.getTime("open_timing");
          closeTiming = rs.getTime("close_timing");
        }

        con.close();
      } catch (SQLException | ClassNotFoundException e) {
        e.printStackTrace();
      }
    }

    return result;
  }

  //GET/SET

  public Integer getLibratyId() {
    return libraryId;
  }

  public void setLibratyId(Integer libraryId) {
    this.libraryId = libraryId;
  }

  public String getDetails() {
    return details;
  }

  public void setDetails(String details) {
    this.details = details;
  }

  public Time getOpenTiming() {
    return openTiming;
  }

  public void setOpenTiming(Time openTiming) {
    this.openTiming = openTiming;
  }

  public Time getCloseTiming() {
    return closeTiming;
  }

  public void setCloseTiming(Time closeTiming) {
    this.closeTiming = closeTiming;
  }

  public Integer getBookIssueDays() {
    return bookIssueDays;
  }

  public void setBookIssueDays(Integer bookIssueDays) {
    this.bookIssueDays = bookIssueDays;
  }

  public Integer getLateFine() {
    return lateFine;
  }

  public void setLateFine(Integer lateFine) {
    this.lateFine = lateFine;
  }

  public Integer getDepositAmount() {
    return depositAmount;
  }

  public void setDepositAmount(Integer depositAmount) {
    this.depositAmount = depositAmount;
  }
}
