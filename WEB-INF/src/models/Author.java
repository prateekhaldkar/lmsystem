package models;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;


public class Author {


  //////////////////// Properties ////////////////////

  private Integer authorId;
  private String name;
  private String place;

  //////////////////// Constructor ////////////////////

  public Author() {}

  public Author(Integer authorId) {
    this.authorId = authorId;
  }

  public Author(String name) {
    this.name = name;
  }

  public Author(Integer authorId, String name){
    this.authorId = authorId; 
    this.name = name; 
  }
  
  public Author(String name, String place){
    this.name = name; 
    this.place = place; 
  }

  public Author(Integer authorId, String name, String place) {
    this.authorId = authorId;
    this.name = name;
    this.place = place;
  }

  //////////////////// METHODS ////////////////////

  public static ArrayList<Author> collectAllAuthors(){
    ArrayList<Author> authors = new ArrayList<>();
    
    try{
      Class.forName("com.mysql.cj.jdbc.Driver");
      
      Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/lmsdb?user=root&password=1234");
      String query = "SELECT author_id, name, place FROM authors";

      PreparedStatement ps = con.prepareStatement(query);

      ResultSet rs = ps.executeQuery();

      while(rs.next()){
        authors.add(new Author(rs.getInt(1), rs.getString(2), rs.getString(3)));
      }
      con.close();

    }catch(ClassNotFoundException |SQLException e){
      e.printStackTrace();
    }
    
    return authors;
  }

  //////////////////// GET // SET ////////////////////
  public Integer getAuthorId() {
    return authorId;
  }

  public void setAuthorId(Integer authorId) {
    this.authorId = authorId;
  }

  public String getName() {
    return name;
  }

  public void setName(String name) {
    this.name = name;
  }

  public String getPlace() {
    return place;
  }

  public void setPlace(String place) {
    this.place = place;
  }
}
