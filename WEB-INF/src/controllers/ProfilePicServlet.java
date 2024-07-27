package controllers;

import java.io.File;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;

import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import models.User;
import models.UserType;

@WebServlet("/profilePic.do")
public class ProfilePicServlet extends HttpServlet {
    public void doGet(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
        HttpSession session = request.getSession();
        User user = (User)session.getAttribute("user");

        ServletContext context = getServletContext();
        if(user != null) {
            
            String absPath = context.getRealPath("/WEB-INF/uploads/"+UserType.types[user.getUserType().getUserTypeId()-1].toLowerCase()+"/"+user.getEmail()+"/profilePic");
            File file = new File(absPath);
            String[] list = file.list();
            InputStream is = context.getResourceAsStream("/WEB-INF/uploads/"+UserType.types[user.getUserType().getUserTypeId()-1].toLowerCase()+"/"+user.getEmail()+"/profilePic/"+list[0]);
            OutputStream os = response.getOutputStream();

            byte[] arr = new byte[256];
            int count = 0;
            while((count=is.read(arr)) != -1) {
                os.write(arr);
            }

            os.flush();
            os.close();
        }        
    }
}
