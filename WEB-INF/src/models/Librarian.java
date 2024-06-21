package models;

import java.sql.Connection;
import java.sql.Date;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class Librarian extends User {

  //properties
  private Integer librarianId;
  private Library library;
  private Date joinedOn;
  private Date leftOn;
  private String qualification;
  private Integer experience;
  private Character gender;


  
  //constructor
  public Librarian() {}


  public Librarian(String email, String password, UserType userType){
    super(email, password, userType);
  }

  // methods
  public void saveDetails(){
    try{
      Class.forName("com.mysql.cj.jdbc.Driver");
      Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/lmsdb?user=root&password=1234");
      String query = "insert into librarians (user_id,qualification,experience) value (?,?,?)";

      PreparedStatement ps = con.prepareStatement(query);

      ps.setInt(1, getUserId());
      ps.setString(2, qualification);
      ps.setInt(3,experience);

      ps.executeUpdate();

      con.close();
    }catch(SQLException | ClassNotFoundException e){
      e.printStackTrace();
    }
  }

  public int login(){
    int result = super.login();
    
    // test
    System.out.println("1" + Status.ACTIVE + "-");
    System.out.println("2" + getStatus().getStatusId()+"--");
    System.out.println("3" + (getStatus().getStatusId() == Status.ACTIVE)+"---");


    if(result == 3 && getStatus().getStatusId() == Status.ACTIVE){
      try {
        Class.forName("com.mysql.cj.jdbc.Driver");
        Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/lmsdb?user=root&password=1234");

        String query = "select * from librarians where user_id=?";

        PreparedStatement ps = con.prepareStatement(query);

        ps.setInt(1, getUserId());

        ResultSet rs = ps.executeQuery();

        if (rs.next()) {
          librarianId = rs.getInt("librarian_id");
          qualification = rs.getString("qualification");
          experience = rs.getInt("experience");
        }

        con.close();
      } catch (SQLException | ClassNotFoundException e) {
        e.printStackTrace();
      }
    }

    return result;
  }

  
  //GET/SET

  public Character getGender() {
    return gender;
  }

  public void setGender(Character gender) {
    this.gender = gender;
  }

  public Integer getLibrarianId() {
    return librarianId;
  }

  public void setLibrarianId(Integer librarianId) {
    this.librarianId = librarianId;
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

  public String getQualification() {
    return qualification;
  }

  public void setQualification(String qualification) {
    this.qualification = qualification;
  }

  public Integer getExperience() {
    return experience;
  }

  public void setExperience(Integer experience) {
    this.experience = experience;
  }
}
