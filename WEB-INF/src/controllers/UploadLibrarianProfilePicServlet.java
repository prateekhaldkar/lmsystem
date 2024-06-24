package controllers;

import java.io.File;
import java.io.IOException;
import java.util.List;

import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.FileUploadException;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;
    
import models.Librarian;

@WebServlet("/librarian_profilePic_upload.do")
public class UploadLibrarianProfilePicServlet extends HttpServlet {
    public void doPost(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
        HttpSession session = request.getSession();
        Librarian librarian = (Librarian)session.getAttribute("librarian");

        ServletContext context = getServletContext();

        if(librarian!=null) {
            if(ServletFileUpload.isMultipartContent(request)) {
                try {
                    List<FileItem> items = new ServletFileUpload(new DiskFileItemFactory()).parseRequest(request);
                    FileItem item = items.get(1);
    
                    System.out.println(item.getName());
                    String fileName = "profilePic."+item.getName().split("\\.")[1];
                    librarian.setProfilePic(fileName);

                    String uploadPath = context.getRealPath("/WEB-INF/uploads/librarian/" + librarian.getEmail()+"/profilePic");

                    File file = new File(uploadPath, fileName);                    
                    try{
                        item.write(file);
                    }catch(Exception e) {
                        e.printStackTrace();
                    }    
                    
                } catch(FileUploadException e) {
                    e.printStackTrace();
                }                 
            }
        } 
    }
}
