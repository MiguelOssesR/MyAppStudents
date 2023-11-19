package model;

public class Sesion {
    String user;
    String password;
    String role;
    String name;

    public Sesion() {
    }

    public Sesion(String user, String password, String role, String name) {
        this.user = user;
        this.password = password;
        this.role = role;
        this.name = name;
    }

    public String getUser() {
        return user;
    }

    public String getPassword() {
        return password;
    }

    public String getRole() {
        return role;
    }

    public String getName() {
        return name;
    }
    
    
}
