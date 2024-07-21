package controllers;

import java.io.IOException;

import java.sql.Date;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpSession;

import models.Book;
import models.BookEdition;
import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.annotation.WebServlet;

@WebServlet("/book_edition.do")
public class BookEditionServlet extends HttpServlet {
    public void doPost(HttpServletRequest request,HttpServletResponse response)throws IOException,ServletException{
        
        Integer bookId = Integer.parseInt(request.getParameter("book_id"));
        Integer edition = Integer.parseInt(request.getParameter("edition"));
        Date published_on = Date.valueOf(request.getParameter("published_on"));
        Integer price =  Integer.parseInt(request.getParameter("price"));
        String details = request.getParameter("details");
        Integer isbnNo = Integer.parseInt(request.getParameter("isbn_no"));

        BookEdition bookEdition = new BookEdition(new Book(bookId),edition,published_on,price,details,isbnNo);
        bookEdition.saveBookEdition();
        
        request.getRequestDispatcher("book_edition.jsp").forward(request, response);;
    }

    public void doGet(HttpServletRequest request,HttpServletResponse response)throws IOException,ServletException{

        Integer bookId = Integer.parseInt(request.getParameter("book_id"));
        String bookTitle =request.getParameter("book_title");
        BookEdition bookEdition = new BookEdition(new Book(bookId));
        ArrayList<BookEdition> editions = bookEdition.collectAllEditions();

        request.setAttribute("book_editions",editions);

        request.getRequestDispatcher("book_edition.jsp?book_id="+bookId+ "&book_title="+bookTitle).forward(request, response);
    }
}