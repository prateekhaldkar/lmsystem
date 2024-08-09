package controllers;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import models.Book;
import models.BookEdition;


@WebServlet("/show_book_edition_for_library.do")
public class ShowBookEditionForLibraryServlet extends HttpServlet {
    public void doGet(HttpServletRequest request, HttpServletResponse response)throws IOException, ServletException{
        
        Integer bookId = Integer.parseInt(request.getParameter("book_id"));
        String title = request.getParameter("title");
        // Integer num = Integer.parseInt(request.getParameter("num"));

        BookEdition bookEdition = new BookEdition(new Book(bookId));
        ArrayList<BookEdition> editions = bookEdition.collectAllEditions();

        request.setAttribute("book_editions",editions);

        request.getRequestDispatcher("show_book_edition_for_library.jsp?book_id="+bookId + "&title="+title).forward(request, response);
    }
}
