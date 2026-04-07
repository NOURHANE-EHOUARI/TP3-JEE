<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Inscription</title>
    <style>
        body { font-family: Arial, sans-serif; background-color: #f4f4f4; margin: 0; padding: 20px; display: flex; align-items: center; justify-content: center; height: 100vh; }
        .container { max-width: 400px; width: 100%; background: white; padding: 40px; border-radius: 8px; box-shadow: 0 4px 10px rgba(0,0,0,0.1); }
        h2 { text-align: center; color: #333; margin-top: 0; }
        input[type="text"], input[type="email"], input[type="password"] {
            width: 100%; padding: 12px; margin: 8px 0 15px; border: 1px solid #ccc; border-radius: 5px; box-sizing: border-box; font-size: 14px;
        }
        input[type="submit"] {
            width: 100%; background-color: #2196F3; color: white; padding: 14px; border: none; border-radius: 5px; cursor: pointer; font-size: 16px; font-weight: bold; transition: background 0.3s; margin-top: 10px;
        }
        input[type="submit"]:hover { background-color: #1976D2; }
        .error { color: #d32f2f; background: #ffebee; padding: 10px; border-radius: 5px; text-align: center; margin-bottom: 15px; font-size: 14px; }
        .link { text-align: center; margin-top: 20px; font-size: 14px; }
        a { color: #4CAF50; text-decoration: none; font-weight: bold; }
        a:hover { text-decoration: underline; }
    </style>
</head>
<body>
    <div class="container">
        <h2>Créer un compte</h2>
        
        <% if (request.getAttribute("erreur") != null) { %>
            <div class="error"><%= request.getAttribute("erreur") %></div>
        <% } %>
        
        <form action="signup" method="post" autocomplete="off">
            <input type="text" name="nom" placeholder="Nom" required autocomplete="off">
            <input type="text" name="prenom" placeholder="Prénom" required autocomplete="off">
            <input type="email" name="email" placeholder="Adresse e-mail" required autocomplete="new-password" value="">
            <input type="password" name="password" placeholder="Mot de passe" required autocomplete="new-password" value="">
            <input type="password" name="confirm" placeholder="Confirmer le mot de passe" required autocomplete="off">
            <input type="submit" value="S'inscrire">
        </form>
        
        <div class="link">
            <a href="Login.jsp">Déjà un compte ? Se connecter</a>
        </div>
    </div>
</body>
</html>