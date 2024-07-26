package controllers;

import java.io.IOException;
import java.util.ArrayList;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import models.Book;
import models.Category;
import models.Publisher;

@WebServlet("/book.do")
public class BookServlet extends HttpServlet {

    public void doPost(HttpServletRequest request, HttpServletResponse response)throws IOException, ServletException {
        HttpSession session = request.getSession();

        Publisher publisher = (Publisher) session.getAttribute("user");
        String nextPage = "login.do?user_type_id=4";
        Book book = new Book(publisher);

        ArrayList<Book> books = book.collectAllBooks(publisher.getPublisherId());

        if (publisher != null) {
            nextPage = "publisher_dashboard.jsp";
            request.setAttribute("books", books);
            request.setAttribute("record_size", books.size());
        }
        request.getRequestDispatcher(nextPage).forward(request, response);
    }

    public void doGet(HttpServletRequest request, HttpServletResponse response)throws IOException, ServletException {
        Integer num = Integer.parseInt(request.getParameter("num"));
        
        if (num == 1) {
            doPost(request, response);
        } else {
        
        HttpSession session = request.getSession();
        ServletContext context = getServletContext();

        Publisher publisher = (Publisher) session.getAttribute("user");
        String title = request.getParameter("title");
        Integer category = Integer.parseInt(request.getParameter("category_id"));

        Book book = new Book(title,new Category(category),new Publisher(publisher.getPublisherId()));
        boolean flag = book.saveBook();

        request.setAttribute("flag", flag);
        doPost(request, response);
        }
    }
}