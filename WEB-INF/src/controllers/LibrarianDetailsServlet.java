package controllers;

import java.io.IOException;
import java.sql.Time;
import java.sql.Date;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import models.Librarian;

@WebServlet("/librarian_details.do")
public class LibrarianDetailsServlet extends HttpServlet {
    public void doPost(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException{
        HttpSession session = request.getSession();

        Librarian librarian = (Librarian)session.getAttribute("librarian");

        String qualification = request.getParameter("qualification");
        Integer experience = Integer.parseInt(request.getParameter("experience"));
        
        Date dob = Date.valueOf(request.getParameter("dob"));
        
        
        librarian.setQualification(qualification);
        librarian.setExperience(experience);
        
        librarian.setDob(dob);

        
        librarian.saveDetails();
        librarian.saveDobAndProfilePic();

        response.sendRedirect("librarian_dashboard.jsp");

    }
}