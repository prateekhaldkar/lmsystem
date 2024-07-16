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
    public Integer getCategoryId() {
        return categoryId;
    }

    public void setCategoryId(Integer categoryId) {
        this.categoryId = categoryId;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }
}