package controllers;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import models.Library;

@WebServlet("/library_dashboard.do")
public class LibraryDashboardServler extends HttpServlet{
    public void doGet( HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException{
        HttpSession session = request.getSession();

        Library library = (Library)session.getAttribute("user");

        String nextPage = "login.do";
    }
}
