package controllers;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import models.Book;

@WebServlet("/book_pic.do")
public class BookPicServlet extends HttpServlet {
    public void doPost(HttpServletRequest request, HttpServletResponse response)throws IOException, ServletException{
        HttpSession session = request.getSession();

        Book book = (Book)session.getAttribute("book");
    
        book.saveBookPic();

        response.sendRedirect("publisher_dashboard.jsp");

    }
}
