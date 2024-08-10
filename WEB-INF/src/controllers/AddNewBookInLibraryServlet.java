package controllers;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import models.Library;
import models.LibraryBook;
import models.Book;
import models.BookEdition;


import javax.servlet.annotation.WebServlet;

@WebServlet("/add_new_book_in_library.do")
public class AddNewBookInLibraryServlet extends HttpServlet {

    public void doGet(HttpServletRequest request,HttpServletResponse response)throws IOException,ServletException{
        HttpSession session = request.getSession();
        Library library = (Library)session.getAttribute("user");
        
        Integer bookId = Integer.parseInt(request.getParameter("book_id"));
        String title = request.getParameter("title");

        Integer copies = Integer.parseInt(request.getParameter("copies"));
        Integer bookEditionId = Integer.parseInt(request.getParameter("book_edition_id"));

        System.out.println("===="+bookId+"====");
        System.out.println("===="+title+"====");
        System.out.println("===="+copies+"====");
        System.out.println("===="+bookEditionId+"====");


        LibraryBook librarybook = new LibraryBook(new BookEdition(bookEditionId),copies,new Library(library.getLibraryId()));
        
        librarybook.addLibraryBooks();
        
        BookEdition bookEdition = new BookEdition(new Book(bookId));
        ArrayList<BookEdition> editions = bookEdition.collectAllEditions();
        request.setAttribute("book_editions",editions);

        request.getRequestDispatcher("show_book_edition_for_library.jsp?book_id="+bookId + "&title="+title).forward(request, response);

    }
}