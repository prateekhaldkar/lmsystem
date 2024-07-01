package listeners;

import javax.servlet.ServletContext;
import javax.servlet.ServletContextEvent;
import javax.servlet.ServletContextListener;

import models.City;
import models.Category;
import utils.EmailSender;

import java.util.ArrayList;

public class AppListenerImpl implements ServletContextListener {
    public void contextInitialized(ServletContextEvent ev) {
        ServletContext context = ev.getServletContext();

        EmailSender.fromEmail = context.getInitParameter("from_email");
        EmailSender.password = context.getInitParameter("from_email_password");

        System.out.println("~ ################################ ~");
        System.out.println("~ ################################ ~");
        System.out.println("~ #### Welcome TO LMS ########### ~");
        System.out.println("~ ################################ ~");
        System.out.println("~ ################################ ~");

        ArrayList<City> cities = City.collectAllCities();
        context.setAttribute("cities", cities);
        
        ArrayList<Category> categories = Category.collectAllCategories();
        context.setAttribute("categories", categories);

    
    }

    public void contextDestroyed(ServletContextEvent ev) {

    }
}
