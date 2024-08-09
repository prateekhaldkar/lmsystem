package controllers;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import models.Library;
import models.LibraryBook;
import models.BookEdition;


import javax.servlet.annotation.WebServlet;

@WebServlet("/add_new_book_in_library.do")
public class AddNewBookInLibraryServlet extends HttpServlet {

    public void doGet(HttpServletRequest request,HttpServletResponse response)throws IOException,ServletException{
        HttpSession session = request.getSession();
        Library library = (Library)session.getAttribute("user");
        
        Integer copies = Integer.parseInt(request.getParameter("copies"));
        Integer bookEditionId = Integer.parseInt(request.getParameter("book_edition_id"));

        LibraryBook librarybook = new LibraryBook(new BookEdition(bookEditionId),copies,new Library(library.getLibraryId()));
        
        librarybook.addLibraryBooks();


        request.getRequestDispatcher("book_edition.do?num=2").forward(request, response);
    }
}