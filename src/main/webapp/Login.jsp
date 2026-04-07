<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Connexion</title>
    <style>
        body { font-family: Arial, sans-serif; background-color: #f4f4f4; margin: 0; padding: 20px; display: flex; align-items: center; justify-content: center; height: 100vh; }
        .container { max-width: 400px; width: 100%; background: white; padding: 40px; border-radius: 8px; box-shadow: 0 4px 10px rgba(0,0,0,0.1); }
        h2 { text-align: center; color: #333; margin-top: 0; }
        input[type="email"], input[type="password"] {
            width: 100%; padding: 12px; margin: 10px 0 20px; border: 1px solid #ccc; border-radius: 5px; box-sizing: border-box; font-size: 16px;
        }
        input[type="submit"] {
            width: 100%; background-color: #4CAF50; color: white; padding: 14px; border: none; border-radius: 5px; cursor: pointer; font-size: 16px; font-weight: bold; transition: background 0.3s;
        }
        input[type="submit"]:hover { background-color: #45a049; }
        .error { color: #d32f2f; background: #ffebee; padding: 10px; border-radius: 5px; text-align: center; margin-bottom: 15px; font-size: 14px; }
        .success { color: #2e7d32; background: #e8f5e9; padding: 10px; border-radius: 5px; text-align: center; margin-bottom: 15px; font-size: 14px; }
        .link { text-align: center; margin-top: 20px; font-size: 14px; }
        a { color: #4CAF50; text-decoration: none; font-weight: bold; }
        a:hover { text-decoration: underline; }
    </style>
</head>
<body>
    <div class="container">
        <h2>Connexion</h2>
        
        <% if (request.getAttribute("erreur") != null) { %>
            <div class="error"><%= request.getAttribute("erreur") %></div>
        <% } %>
        
        <% if (request.getParameter("success") != null) { %>
            <div class="success">Compte créé avec succès ! Connectez-vous.</div>
        <% } %>
        
        <form action="login" method="post" autocomplete="off">
            <input type="email" name="email" placeholder="Adresse e-mail" required autocomplete="new-password" value="">
            <input type="password" name="password" placeholder="Mot de passe" required autocomplete="new-password" value="">
            <input type="submit" value="Se connecter">
        </form>
        
        <div class="link">
            <a href="SignUp.jsp">Créer un compte</a>
        </div>
    </div>
</body>
</html>