<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
    if (session.getAttribute("userEmail") == null) {
        response.sendRedirect("Login.jsp");
        return;
    }
%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Accueil</title>
    <style>
        body { 
            font-family: Arial, sans-serif; 
            background: linear-gradient(135deg, #667eea 0%, #764ba2 100%);
            margin: 0; 
            padding: 20px; 
            min-height: 100vh;
            display: flex;
            align-items: center;
            justify-content: center;
        }
        .container { 
            max-width: 500px; 
            background: white; 
            padding: 40px; 
            border-radius: 10px;
            box-shadow: 0 10px 40px rgba(0,0,0,0.2);
            text-align: center;
        }
        h1 { 
            color: #333; 
            margin-bottom: 10px;
        }
        .welcome {
            color: #666;
            font-size: 1.1em;
            margin-bottom: 30px;
        }
        .user-card {
            background: #f8f9fa;
            padding: 20px;
            border-radius: 8px;
            margin: 20px 0;
            text-align: left;
        }
        .user-card p {
            margin: 8px 0;
            color: #444;
        }
        .user-card strong {
            color: #333;
            display: inline-block;
            width: 80px;
        }
        .logout-btn {
            background-color: #e74c3c; 
            color: white; 
            padding: 12px 30px; 
            text-decoration: none; 
            border-radius: 5px; 
            display: inline-block;
            font-weight: bold;
            transition: background 0.3s;
        }
        .logout-btn:hover { 
            background-color: #c0392b; 
        }
        .icon {
            font-size: 3em;
            margin-bottom: 15px;
        }
    </style>
</head>
<body>
    <div class="container">
        <div class="icon">🎉</div>
        
        <h1>Bienvenue !</h1>
        <p class="welcome">Vous êtes connecté avec succès.</p>
        
        <div class="user-card">
            <p><strong>Email:</strong> <%= session.getAttribute("userEmail") %></p>
            <% 
                String nom = (String) session.getAttribute("nom");
                String prenom = (String) session.getAttribute("prenom");
                if (nom != null && prenom != null) { 
            %>
                <p><strong>Nom:</strong> <%= nom %> <%= prenom %></p>
            <% } %>
        </div>
        
        <a href="logout" class="logout-btn">Se déconnecter</a>
    </div>
</body>
</html>