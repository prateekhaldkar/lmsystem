package controllers;

import java.io.IOException;
import java.sql.Date;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import models.Membership;
@WebServlet("/candidate_details.do")
public class MembershipDetailsServlet extends HttpServlet {
    public void doPost(HttpServletRequest request, HttpServletResponse response)throws IOException, ServletException{
        HttpSession session = request.getSession();

        Membership membership = (Membership)session.getAttribute("membership");
        
        Date dob = Date.valueOf(request.getParameter("dob"));

        membership.setDob(dob);

        membership.saveDobAndProfilePic();

        response.sendRedirect("candidate_dashboard.jsp");

    }
}
