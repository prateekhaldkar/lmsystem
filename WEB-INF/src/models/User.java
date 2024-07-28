package models;
import java.sql.*;
import org.jasypt.util.password.StrongPasswordEncryptor;

public class User {
  ///////////properties//////////
  private Integer userId;
  private String name;
  private String email;
  private String password;
  private Character gender;
  private Date dob;
  private City city;
  private String address;
  private String contact;
  private String profilePic;
  private String verificationCode;
  private Status status;
  private String documentPath;
  private UserType userType;

  private static StrongPasswordEncryptor spe = new StrongPasswordEncryptor();

  ///////////constructor//////////
  public User() {}

  public User(String email, String verificationCode) {
    this.email = email;
    this.verificationCode = verificationCode;
  }

  public User(String name, String email, String password, City city, String contact,String verificationCode, UserType userType){
    this.name = name;
    this.email = email;
    this.password = password;
    this.city = city;
    this.contact = contact;
    this.verificationCode = verificationCode;
    this.userType = userType;
  }

  public User(String email, String password, UserType userType) {
    this.email = email;
    this.password = password;
    this.userType = userType;
  }

  public void saveDobAndProfilePic() {
    try {
        Class.forName("com.mysql.cj.jdbc.Driver");
        Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/lmsdb?user=root&password=1234");

        String query = "update users set dob=?,profile_pic=?,status_id=? where user_id=?";
        PreparedStatement ps = con.prepareStatement(query);

        ps.setDate(1, dob);
        ps.setString(2, profilePic);
        ps.setInt(3, Status.ACTIVE);
        ps.setInt(4, userId);
        
        ps.executeUpdate();
        
        con.close();
    }catch(SQLException|ClassNotFoundException e) {
        e.printStackTrace();
    }
  }

  public void getEmailVerificationDetails() {
    try {
      Class.forName("com.mysql.cj.jdbc.Driver");
      Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/lmsdb?user=root&password=1234");

      String query = "update users set verification_code=? where email=?";

      PreparedStatement ps = con.prepareStatement(query);
      ps.setString(1, verificationCode);
      ps.setString(2, email);

      int val = ps.executeUpdate();

      query = "select name, user_type_id from users where email=?";
      ps = con.prepareStatement(query);

      ps.setString(1, email);
      ResultSet rs = ps.executeQuery();
      
      if(rs.next()) {
        name = rs.getString(1);
        userType = new UserType(rs.getInt(2));
      }

      con.close();
    }catch(SQLException|ClassNotFoundException e) {
      e.printStackTrace();
    }
  }

  public int login() {
    int result = 0; 

    try {
      Class.forName("com.mysql.cj.jdbc.Driver");
      Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/lmsdb?user=root&password=1234");

      String query = "select password,user_id,u.name,c.city_id,c.city,s.state_id,s.state,contact," + 
      "dob,gender,address,profile_pic,status_id from users as u inner join cities as c inner join " + 
      "states as s where c.state_id=s.state_id and u.city_id=c.city_id and email=?";
      // select password,user_id,u.name,c.city_id,c.city,s.state_id,s.state,contact,dob,gender,address,profilePic,status_id from users as u inner join cities as c inner join states as s where c.state_id=s.state_id and u.city_id=c.city_id and email=prateekhaldkar3865@gmai.com

      PreparedStatement ps = con.prepareStatement(query);
      ps.setString(1, email);//jisme query fire karna vo email yaha se set hogi

      ResultSet rs = ps.executeQuery();

      if(rs.next()) {
        if(spe.checkPassword(password, rs.getString(1))) {
          userId = rs.getInt(2);
          name = rs.getString(3);
          city = new City(rs.getInt(4), rs.getString(5), new State(rs.getInt(6), rs.getString(7)));
          contact = rs.getString(8);
          dob = rs.getDate(9);
          String gen = rs.getString(10);
          gender = gen!=null?gen.charAt(0):'-';
          address = rs.getString(11);
          profilePic = rs.getString(12);
          status = new Status(rs.getInt(13));
          result = 3;
        } else {
          result = 2;
        }
      } else {
        result = 1; 
      }
      con.close();
    } catch(SQLException|ClassNotFoundException e) {
      e.printStackTrace();
    }
    return result;
  }

  public static boolean verifyEmail(String email, String verificationCode, Integer userTypeId) {
    boolean flag = false;

    try {
      Class.forName("com.mysql.cj.jdbc.Driver");
      Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/lmsdb?user=root&password=1234");

      String query = "update users set verification_code=null,status_id=? where email=? and verification_code=?";
      PreparedStatement ps = con.prepareStatement(query);

      ps.setInt(1, userTypeId==2 || userTypeId==4 || userTypeId==3?Status.EMAIL_VERIFIED : Status.ACTIVE);
      ps.setString(2, email);
      ps.setString(3, verificationCode);

      int val = ps.executeUpdate();

      if(val == 1){
        flag = true;
      }
          con.close();

    }catch(SQLException|ClassNotFoundException e) {
      e.printStackTrace();
    }

    return flag;
  }

  public boolean saveUser() {
    boolean flag = false;

    try {
      Class.forName("com.mysql.cj.jdbc.Driver");
    } catch (ClassNotFoundException e) {
      e.printStackTrace();
    }

    Connection con = null;
    try{
      con = DriverManager.getConnection("jdbc:mysql://localhost:3306/lmsdb?user=root&password=1234");

      String query = "insert into users (name, email, password, gender, city_id, address, contact, verification_code, user_type_id) value (?,?,?,?,?,?,?,?,?)";
      
      PreparedStatement ps = con.prepareStatement(query);

      ps.setString(1,name);
      ps.setString(2,email);
      ps.setString(3,spe.encryptPassword(password));
      ps.setString(4,userType.getUserTypeId()==2 || userType.getUserTypeId()==4 ? "O":"-");
      ps.setInt(5, city.getCityId());
      ps.setString(6, address != null ? address : "-");  
      ps.setString(7,contact);
      ps.setString(8,verificationCode);
      ps.setInt(9,userType.getUserTypeId());

      int val = ps.executeUpdate();

      if(val == 1)
        flag = true;

    }catch(SQLException e){
      e.printStackTrace();
    }finally{
      try{
        con.close();
      }catch(SQLException e){
        e.printStackTrace();
      }finally{
      }
    }
    return flag;
  }

  public Integer getUserId() {
    return userId;
  }

  public void setUserId(Integer userId) {
    this.userId = userId;
  }

  public String getName() {
    return name;
  }

  public void setName(String name) {
    this.name = name;
  }

  public String getEmail() {
    return email;
  }

  public void setEmail(String email) {
    this.email = email;
  }

  public String getPassword() {
    return password;
  }

  public void setPassword(String password) {
    this.password = password;
  }

  public Character getGender() {
    return gender;
  }

  public void setGender(Character gender) {
    this.gender = gender;
  }

  public Date getDob() {
    return dob;
  }

  public void setDob(Date dob) {
    this.dob = dob;
  }

  public City getCity() {
    return city;
  }

  public void setCity(City city) {
    this.city = city;
  }

  public String getAddress() {
    return address;
  }

  public void setAddress(String address) {
    this.address = address;
  }

  public String getContact() {
    return contact;
  }

  public void setContact(String contact) {
    this.contact = contact;
  }

  public String getProfilePic() {
    return profilePic;
  }

  public void setProfilePic(String profilePic) {
    this.profilePic = profilePic;
  }

  public String getVerificationCode() {
    return verificationCode;
  }

  public void setVerificationCode(String verificationCode) {
    this.verificationCode = verificationCode;
  }

  public Status getStatus() {
    return status;
  }

  public void setStatus(Status status) {
    this.status = status;
  }

  public String getDocumentPath() {
    return documentPath;
  }

  public void setDocumentPath(String documentPath) {
    this.documentPath = documentPath;
  }

  public UserType getUserType() {
    return userType;
  }

  public void setUserType(UserType userType) {
    this.userType = userType;
  }

  /////////////GET-SET///////////
    
}
