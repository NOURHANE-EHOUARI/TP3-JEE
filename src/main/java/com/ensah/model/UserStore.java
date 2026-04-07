package com.ensah.model;

import java.util.HashMap;
import java.util.Map;

public class UserStore {
    
    private static Map<String, String[]> users = new HashMap<>();

    static {
        users.put("test@example.com", new String[]{
            "123456",
            "Elhouari",
            "Nourhane"
        });
    }

    public static boolean login(String email, String password) {
        String[] userData = users.get(email);
        return userData != null && userData[0].equals(password);
    }

    public static boolean register(String email, String password, String nom, String prenom) {
        if (users.containsKey(email)) {
            return false;
        }
        users.put(email, new String[]{password, nom, prenom});
        return true;
    }

    public static String[] getUserData(String email) {
        return users.get(email);
    }

    public static boolean emailExists(String email) {
        return users.containsKey(email);
    }
}