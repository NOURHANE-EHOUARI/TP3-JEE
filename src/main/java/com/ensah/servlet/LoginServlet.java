package com.ensah.servlet;

import java.io.IOException;
import com.ensah.model.UserStore;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebServlet("/login")
public class LoginServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        request.setCharacterEncoding("UTF-8");

        String email = request.getParameter("email");
        String password = request.getParameter("password");

        if (email.isEmpty() || password.isEmpty()) {
            request.setAttribute("erreur", "Veuillez remplir tous les champs.");
            request.getRequestDispatcher("Login.jsp").forward(request, response);
            return;
        }

        boolean valid = UserStore.login(email, password);

        if (!valid) {
            request.setAttribute("erreur", "Email ou mot de passe incorrect.");
            request.getRequestDispatcher("Login.jsp").forward(request, response);
            return;
        }

        HttpSession session = request.getSession();
        session.setAttribute("userEmail", email);

        String[] userData = UserStore.getUserData(email);
        if (userData != null && userData.length >= 3) {
            session.setAttribute("nom", userData[1]);
            session.setAttribute("prenom", userData[2]);
        }

        session.setMaxInactiveInterval(30 * 60);
        response.sendRedirect("Home.jsp");
    }
}