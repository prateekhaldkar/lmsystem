package models;

import java.sql.*;

public class Publisher extends User {

  //properties
  private Integer publisherId;
  private String details;
  private String website;

  //constructor
  public Publisher() {}

  public Publisher(String email, String password, UserType userType) {
    super(email, password, userType);
  }
  
  // methods

  public void saveDetails() {
    try {
      Class.forName("com.mysql.cj.jdbc.Driver");
      Connection con = DriverManager.getConnection(
        "jdbc:mysql://localhost:3306/lmsdb?user=root&password=1234"
      );
      String query = "insert into publishers (user_id,details,website) value (?,?,?)";

      PreparedStatement ps = con.prepareStatement(query);

      ps.setInt(1, getUserId());
      ps.setString(2, details);
      ps.setString(3, website);

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

        String query = "select * from publisher where user_id=?";

        PreparedStatement ps = con.prepareStatement(query);

        ps.setInt(1, getUserId());

        ResultSet rs = ps.executeQuery();

        if (rs.next()) {
          publisherId = rs.getInt("publisher_id");
          details = rs.getString("details");
          website = rs.getString("website");
        }

        con.close();
      } catch (SQLException | ClassNotFoundException e) {
        e.printStackTrace();
      }
    }

    return result;
  }

  public void savePublisher(Integer userId) {
    try {
      Class.forName("com.mysql.cj.jdbc.Driver");
    } catch (ClassNotFoundException e) {
      e.printStackTrace();
    }
    try (
      Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/lmsdb?user=root&password=1234")) {
      String query ="insert into publisher (user_id, details, website) value (?,?,?)";

      PreparedStatement ps = con.prepareStatement(query);
      ps.setInt(1, userId);
      ps.setString(2, details);
      ps.setString(3, website);

      ps.executeUpdate();
    } catch (SQLException e) {
      e.printStackTrace();
    }
  }

  //GET/SET

  public Integer getPublisherId() {
    return publisherId;
  }

  public void setPublisherId(Integer publisherId) {
    this.publisherId = publisherId;
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
