package controllers;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import models.User;
import utils.MessageTemplate;

@WebServlet("/email_verify.do")
public class verifyEmailServlet extends HttpServlet {

    public void doGet(HttpServletRequest request, HttpServletResponse response) throws IOException , ServletException{
        String email = request.getParameter("email");
        String verificationCode = request.getParameter("verification_code");
        Integer userTypeId = Integer.parseInt(request.getParameter("user_type_id"));
    
        boolean flag = User.verifyEmail(email, verificationCode, userTypeId);
    
        String nextPage = "login.jsp?user_type_id="+userTypeId;
    
        if(userTypeId==2 || userTypeId==4 ){
            nextPage = "message.jsp?img=static/media/images/email_verified.png&color=text-green-200&message="+MessageTemplate.getEmailVerificationSuccessAndPendingMannualVarificationMessage();
        }else if(userTypeId == 1 || userTypeId == 2){
            nextPage = "message.jsp?img=static/media/images/email_verified.png&color=text-green-200&message="+MessageTemplate.getEmailVerificationSuccessMessage();
        }
        request.getRequestDispatcher(nextPage).forward(request, response);
    }
}