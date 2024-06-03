package models;

public class Categorie {

  ///////////properties//////////
  private Integer categoryId;
  private String name;

  ///////////constructor//////////
  public Categorie() {
    
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
