package controllers;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;

import models.Book;
import models.Category;

@WebServlet("/search_book_by_name_for_library.do")
public class SearchBookByNameForLibraryServlet extends HttpServlet {

    public void doGet(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
        String title = request.getParameter("title");
        
        Book book = new Book();
        book.setTitle(title);
        Gson gson = new Gson();
        String json = gson.toJson(book.searchBookByNameForLibrary());

        response.getWriter().println(json);
    }
}
