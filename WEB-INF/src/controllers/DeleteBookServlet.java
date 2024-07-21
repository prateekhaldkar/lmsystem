package controllers;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import models.Book;

@WebServlet("/delete_book.do")
public class DeleteBookServlet extends HttpServlet {
    public void doGet(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException{
        Integer bookId = Integer.parseInt(request.getParameter("book_id"));

        Book book = new Book();
        book.setBookId(bookId);

        book.deleteBook(book);  
        
        request.getRequestDispatcher("book.do?num=1").forward(request, response);
    }
}
