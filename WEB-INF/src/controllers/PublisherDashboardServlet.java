package controllers;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import models.Publisher;
import models.Book;

@WebServlet("/publisher_dashboard.do")
public class PublisherDashboardServlet extends HttpServlet{
    public void doGet( HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException{
        HttpSession session = request.getSession();

        Publisher publisher = (Publisher)session.getAttribute("user");

        String nextPage = "login.do";
        
        // if(publisher != null) {
        //     ArrayList<Book> books = Book.collectAllBooks(publisher);
        //     request.setAttribute("record_size", books.size());
        //     request.setAttribute("books", books);
        //     nextPage = "publisher_dashboard.jsp";
        // }

        // request.getRequestDispatcher(nextPage).forward(request, response);
    }
}