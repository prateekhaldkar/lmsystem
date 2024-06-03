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

import models.Library;


@WebServlet("/library_details.do")
public class LibraryDetailsServlet extends HttpServlet {
    public void doPost(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException{
        HttpSession session = request.getSession();

        Library library = (Library)session.getAttribute("library");

        String details = request.getParameter("details");
        Time openTiming = Time.valueOf(request.getParameter("open_timing")+":00");
        Time closeTiming = Time.valueOf(request.getParameter("close_timing")+":00");
        Date dob = Date.valueOf(request.getParameter("established_on"));

        library.setDetails(details);
        library.setOpenTiming(openTiming);
        library.setCloseTiming(closeTiming);
        library.setDob(dob);

    }
}