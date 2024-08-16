package controllers;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;

import models.Book;
import models.Library;
import models.LibraryBook;
import models.BookEdition;

@WebServlet("/search_book_by_name_available_in_library.do")
public class SearchBookByNameAvailableInLibraryServlet extends HttpServlet{
    public void doGet(HttpServletRequest request, HttpServletResponse response)throws IOException, ServletException{
         Library lib = (Library)request.getSession().getAttribute("user");
            
    
        String title = request.getParameter("title");

        LibraryBook books = new LibraryBook(new BookEdition(new Book(title)));

        ArrayList<LibraryBook> list = books.searchBookAvalableInLibrary(lib.getLibraryId());

        Gson gson = new Gson();

        String json = gson.toJson(list);

        response.getWriter().print(json);
    }
}
