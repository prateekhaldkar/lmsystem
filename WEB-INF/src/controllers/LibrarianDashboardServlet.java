package controllers;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import models.Librarian;

@WebServlet("/librarian_dashboard.do")
public class LibrarianDashboardServlet extends HttpServlet{
    public void doGet( HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException{
        HttpSession session = request.getSession();

        Librarian librarian = (Librarian)session.getAttribute("user");

        String nextPage = "login.do";
    }
}
