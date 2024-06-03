package models;

public class LibraryPic {

  //properties
  private Integer libraryPicId;
  private Library library;
  private String picPath;

  //constructor
  public LibraryPic() {}

  //GET/SET
  public Integer getLibraryPicId() {
    return libraryPicId;
  }

  public void setLibraryPicId(Integer libraryPicId) {
    this.libraryPicId = libraryPicId;
  }

  public Library getLibrary() {
    return library;
  }

  public void setLibrary(Library library) {
    this.library = library;
  }

  public String getPicPath() {
    return picPath;
  }

  public void setPicPath(String picPath) {
    this.picPath = picPath;
  }
}
