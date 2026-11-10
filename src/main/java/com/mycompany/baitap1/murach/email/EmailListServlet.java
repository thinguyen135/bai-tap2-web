package com.mycompany.baitap1.murach.email;

import java.io.IOException;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import com.mycompany.baitap1.murach.business.Survey;
import com.mycompany.baitap1.murach.business.User;

public class EmailListServlet extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String url = "/index.html";

        String action = request.getParameter("action");
        if (action == null) {
            action = "join";
        }

        if (action.equals("join")) {
            url = "/index.html";
        } else if (action.equals("add")) {
            String firstName = request.getParameter("firstName");
            String lastName = request.getParameter("lastName");
            String email = request.getParameter("email");
            String dateOfBirth = request.getParameter("dateOfBirth");
            String checkBox1 = request.getParameter("checkbox1");
            String checkBox2 = request.getParameter("checkbox2");
            String contactVia = request.getParameter("contactVia");
            String contactMethod = request.getParameter("contact_method");


            if (checkBox1 == null) {
                checkBox1 = "";
            }

            if (checkBox2 == null) {
                checkBox2 = "";
            }

            User user = new User(firstName, lastName, email, dateOfBirth);
            Survey survey = new Survey(contactVia, checkBox1, checkBox2, contactMethod);

            request.setAttribute("user", user);
            request.setAttribute("survey", survey);
            url = "/thanks.jsp";
        }

        getServletContext()
                .getRequestDispatcher(url)
                .forward(request, response);
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        doPost(request, response);
    }

}
