package controllers;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import io.jsonwebtoken.io.IOException;
import models.BookEdition;

@WebServlet("/delete_book_edition.do")
public class DeleteBookEditionServlet extends HttpServlet{
    public void doGet(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException{
        Integer bookEditionId = Integer.parseInt(request.getParameter("book_edition_id"));

        BookEdition bookEdition = new BookEdition();
        bookEdition.setBookEditionId(bookEditionId);

        bookEdition.deleteBookEdition(bookEditionId);

        
    }
}
