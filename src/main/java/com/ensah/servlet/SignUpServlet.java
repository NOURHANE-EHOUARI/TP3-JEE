package com.ensah.servlet;

import java.io.IOException;
import com.ensah.model.UserStore;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/signup")
public class SignUpServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        request.setCharacterEncoding("UTF-8");

        String nom = request.getParameter("nom");
        String prenom = request.getParameter("prenom");
        String email = request.getParameter("email");
        String password = request.getParameter("password");
        String confirm = request.getParameter("confirm");

        if (email.isEmpty() || password.isEmpty() || nom.isEmpty() || prenom.isEmpty()) {
            request.setAttribute("erreur", "Veuillez remplir tous les champs.");
            request.getRequestDispatcher("SignUp.jsp").forward(request, response);
            return;
        }

        if (!password.equals(confirm)) {
            request.setAttribute("erreur", "Les mots de passe ne correspondent pas.");
            request.getRequestDispatcher("SignUp.jsp").forward(request, response);
            return;
        }

        boolean success = UserStore.register(email, password, nom, prenom);

        if (!success) {
            request.setAttribute("erreur", "Cet email existe déjà.");
            request.getRequestDispatcher("SignUp.jsp").forward(request, response);
            return;
        }

        response.sendRedirect("Login.jsp?success=1");
    }
}