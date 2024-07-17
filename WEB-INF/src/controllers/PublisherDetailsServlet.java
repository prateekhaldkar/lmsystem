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

import models.Publisher;

@WebServlet("/publisher_details.do")
public class PublisherDetailsServlet extends HttpServlet {
    public void doPost(HttpServletRequest request, HttpServletResponse response)throws IOException, ServletException{
        HttpSession session = request.getSession();

        Publisher publisher = (Publisher)session.getAttribute("publisher");

        String details = request.getParameter("details");
        String website = request.getParameter("website");
        
        Date dob = Date.valueOf(request.getParameter("dob"));

        publisher.setDetails(details);
        publisher.setWebsite(website);
        publisher.setDob(dob);

        publisher.saveDetails();
        publisher.saveDobAndProfilePic();

        response.sendRedirect("publisher_dashboard.jsp");

    }
}
