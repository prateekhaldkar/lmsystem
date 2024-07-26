package controllers;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import models.User;
import models.Library;
import models.Publisher;
import models.Librarian;
import models.Status;
import models.UserType;

import utils.MessageTemplate;

@WebServlet("/login.do")
public class LoginServlet extends HttpServlet{
    public void doGet(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException{
        request.getRequestDispatcher("login.jsp").forward(request, response);       
    }

    public void doPost(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException{
        HttpSession session = request.getSession();

        String email = request.getParameter("email");
        String password = request.getParameter("password");
        Integer userTypeId = Integer.parseInt(request.getParameter("user_type_id"));

        String nextPage = "login.jsp";

        if(userTypeId == 2){
            Library library = new Library(email, password, new UserType(userTypeId));
            int result = library.login();

            if(result == 0){

            }else if(result == 1){
                request.setAttribute("email_error_message", MessageTemplate.getIncorrectEmailMessage());
            }else if(result == 2){
                request.setAttribute("password_error_message",MessageTemplate.getInvalidPasswordMessage());
            }else if(result == 3){
                int statusId = library.getStatus().getStatusId();
                if (statusId == Status.ACTIVE){
                    session.setAttribute("user",library);
                    nextPage = "library_dashboard.jsp";                    
                } else if(statusId == Status.INACTIVE) {
                    String message = MessageTemplate.getIncompleteEmailVerificationMessage(email);
                    nextPage = "message.jsp?img=static/media/images/IncompleteEmailVerification.png&color=text-green-200&message="+message;
                } else if(statusId == Status.EMAIL_VERIFIED) {
                    String message = MessageTemplate.getIncompleteManualVerificationMessage();
                    nextPage = "message.jsp?img=static/media/images/IncompleteManualVerification.png&color=text-green-200&message="+message;
                } else if(statusId == Status.MANUAL_VERIFICATION_DONE) {
                    session.setAttribute("library", library);
                    nextPage = "library_details.jsp"; 
                } else if(statusId == Status.CLOSED) {

                } else if(statusId == Status.BLOCKED) {       
                }
            }
        }else if(userTypeId == 4){
            Publisher publisher = new Publisher(email, password, new UserType(userTypeId));
            int result = publisher.login();

            if(result == 0){}
            else if( result == 1){
                request.setAttribute("email_error_message", MessageTemplate.getIncorrectEmailMessage());
            }else if(result == 2){
                request.setAttribute("password_error_message", MessageTemplate.getInvalidPasswordMessage());
            }else if(result == 3){
                int statusId = publisher.getStatus().getStatusId();
                if(statusId == Status.ACTIVE){
                    session.setAttribute("user", publisher);
                    nextPage = "book.do?num=1";
                }else if(statusId == Status.INACTIVE){
                    String message = MessageTemplate.getIncompleteEmailVerificationMessage(email);
                    nextPage = "message.jsp?img=static/media/images/IncompleteEmailVerification.png&color=text-green-200&message="+message;
                }else if(statusId == Status.EMAIL_VERIFIED) {
                    String message = MessageTemplate.getIncompleteManualVerificationMessage();
                    nextPage = "message.jsp?img=static/media/images/IncompleteManualVerification.png&color=text-green-200&message="+message;
                } else if(statusId == Status.MANUAL_VERIFICATION_DONE) {
                    session.setAttribute("publisher", publisher);
                    nextPage = "publisher_details.jsp"; 
                } else if(statusId == Status.CLOSED) {
                } else if(statusId == Status.BLOCKED) {       
                }
            }

        }else if(userTypeId == 3){
            Librarian librarian = new Librarian(email, password, new UserType(userTypeId));
            int result = librarian.login();
            if(result == 0){}
            else if(result == 1){
                request.setAttribute("email_error_message", MessageTemplate.getIncorrectEmailMessage());
            }else if(result == 2){
                request.setAttribute("password_error_message", MessageTemplate.getInvalidPasswordMessage());
            }else if(result == 3){
                int statusId = librarian.getStatus().getStatusId();
                if(statusId == Status.ACTIVE){
                    session.setAttribute("user", librarian);
                    nextPage = "librarian_dashboard.jsp";
                }else if(statusId == Status.INACTIVE){
                    String message = MessageTemplate.getIncompleteEmailVerificationMessage(email);
                    nextPage = "message.jsp?img=static/media/images/IncompleteEmailVerification.png&color=text-green-200&message="+message;
                }else if(statusId == Status.EMAIL_VERIFIED) {
                    session.setAttribute("librarian", librarian);
                    nextPage = "librarian_details.jsp";
                }else if(statusId == Status.CLOSED) {
                } else if(statusId == Status.BLOCKED) {       
                }
            }
            
        }else if(userTypeId == 1){
            

        }
        request.getRequestDispatcher(nextPage).forward(request, response);
    }
}