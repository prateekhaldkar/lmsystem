package controllers;

import java.io.File;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
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

import models.Book;
import models.UserType;
import models.Publisher;
import models.User;

@WebServlet("/book_pic.do")
public class BookPicServlet extends HttpServlet {
    public void doPost(HttpServletRequest request, HttpServletResponse response)throws IOException, ServletException{
        HttpSession session = request.getSession();

        Publisher publisher = (Publisher)session.getAttribute("user");

        ServletContext context = getServletContext();
        Book book = new Book();
        if(publisher != null) {
            if(ServletFileUpload.isMultipartContent(request)){
                try{
                    List<FileItem> items = new ServletFileUpload(new DiskFileItemFactory()).parseRequest(request);
                    
                    for (FileItem fileItem : items) {
                        if(fileItem.isFormField()){
                            String fileName = fileItem.getFieldName();
                            Integer fileValue = Integer.parseInt(fileItem.getString());

                            switch (fileName) {
                                case "book_id":
                                    book.setBookId(fileValue);
                                    break;
                            } 
                        }else{
                            String fileName = book.getBookId()+"."+fileItem.getName().split("\\.")[1];

                            String uploadPath = context.getRealPath("/WEB-INF/uploads/publisher/"+ publisher.getEmail()+"/bookPic/");

                            String filePath = uploadPath+fileName;

                            book.setBookPic(publisher.getEmail()+"/bookPic/"+fileName);

                            File file = new File(uploadPath, fileName);
                            try{
                                fileItem.write(file);
                            }catch(Exception e){
                                e.printStackTrace();
                            } 
                        }
                    }
                    book.saveBookPic();
                }catch(FileUploadException a){
                    a.printStackTrace();
                }
            }
            
            

        } 
    }

    public void doGet(HttpServletRequest request, HttpServletResponse response)throws IOException, ServletException{
        
        String path = request.getParameter("path");
        ServletContext context = getServletContext();
        
            
            InputStream is = context.getResourceAsStream("/WEB-INF/uploads/publisher/"+path);
            
            OutputStream os = response.getOutputStream();

            byte[] arr = new byte[256];

            while((is.read(arr)) != -1) {
                os.write(arr);
            }

            os.flush();
            os.close();   
    }


}
