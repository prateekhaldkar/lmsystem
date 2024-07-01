package models;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

public class Category {


  ///////////properties//////////
  private Integer categoryId;
  private String name;

// {
//   public static final int GeneralNarrative = 1;
//   public static final int Mystery = 2;
//   public static final int Horror = 3;
//   public static final int Fantasy = 4;
//   public static final int ScienceNarrative = 5;
//   public static final int HistoricalNarrative = 6;
//   public static final int ChildrensNarrative = 7;
//   public static final int BiographyandAutobiography = 8;
//   public static final int HealthAndWellnes = 9;
//   public static final int Travel = 10;
//   public static final int TrueCrime = 11;
//   public static final int History = 12;
//   public static final int Science = 13;
//   public static final int Philosophy = 14;
//   public static final int ReligionAndSpirituality = 15;
//   public static final int Cooking = 16;
//   public static final int ArtAndPhotography = 17;
//   public static final int BusinessAndEconomics = 18;
//   public static final int Politics = 19;
//   public static final int Technology = 20;
//   public static final int GraphicNovels = 21;
//   public static final int Poetry = 22;
//   public static final int Drama = 23;
//   public static final int Essays = 24;
//   public static final int ShortStories = 25;
//   public static final int Mathematics = 26;
//   public static final int physics = 27;
//   public static final int Chemistry = 27;
//   public static final int Biology = 29;
//   public static final int Geography = 30;
//   public static final int LanguageArts = 31;
//   public static final int ComputerScience = 32;
//   public static final int Economics = 33;
// }

  ///////////constructor//////////
  public Category() {}

  public Category(String name) {
    this.name = name;
  }

  public Category(Integer categoryId){
    this.categoryId = categoryId;
  }

  public Category(Integer categoryId, String name){
    this.categoryId = categoryId;
    this.name = name;
  }

  
  /////////// METHODS ///////////
  public static ArrayList<Category> collectAllCategories(){
    ArrayList<Category> categories = new ArrayList<>();

    
    try{
      Class.forName("com.mysql.cj.jdbc.Driver");

      Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/lmsdb?user=root&password=1234");

      String query = "SELECT category_id, name FROM categories";
      
      PreparedStatement ps = con.prepareStatement(query);

      ResultSet rs = ps.executeQuery();

      while(rs.next()) {
        categories.add(new Category(rs.getInt(1), rs.getString(2)));
      }
      con.close();
    }catch(ClassNotFoundException|SQLException e){

      e.printStackTrace();

    }

    return categories;
  }






  ///////////GET/SET//////////
  public Integer getCategoryID() {
    return categoryId;
  }

  public void setCategoryID(Integer categoryId) {
    this.categoryId = categoryId;
  }

  public String getName() {
    return name;
  }

  public void setName(String name) {
    this.name = name;
  }
}
