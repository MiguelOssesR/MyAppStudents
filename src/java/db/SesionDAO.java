package db;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.logging.Level;
import java.util.logging.Logger;
import model.Sesion;

public class SesionDAO {
    private ConexionDB db;

    public SesionDAO() {
        this.db = ConexionDB.getInstance();
    }  
    
    public boolean getUser(String user, String password) {
        boolean encontrado = false;
        String sql = "SELECT * FROM bd_students.roles where user = ? and password = ?;";

        try {
            PreparedStatement ps = db.getConexion().prepareStatement(sql);
            ps.setString(1, user);
            ps.setString(2, password);
            ResultSet rs = ps.executeQuery();
            
            if (rs.next()) {
                encontrado = true;
            }
            
        } catch (SQLException ex) {
            Logger.getLogger(SesionDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return encontrado;
    }
    
    public String getRole(String user, String password){
        String role = "empty";
        String sql = "SELECT * FROM bd_students.roles where user = ? and password = ?;";
        try {
            PreparedStatement ps = db.getConexion().prepareStatement(sql);
            ps.setString(1, user);
            ps.setString(2, password);
            ResultSet rs = ps.executeQuery();
            
            if (rs.next()) {
                role = rs.getString("role");
            }
        } catch (SQLException ex) {
            Logger.getLogger(SesionDAO.class.getName()).log(Level.SEVERE, null, ex);
        } 
        return role;
    }
    
        public String getName(String user, String password){
        String name = "empty";
        String sql = "SELECT * FROM bd_students.roles where user = ? and password = ?;";
        try {
            PreparedStatement ps = db.getConexion().prepareStatement(sql);
            ps.setString(1, user);
            ps.setString(2, password);
            ResultSet rs = ps.executeQuery();
            
            if (rs.next()) {
                name = rs.getString("name");
            }
        } catch (SQLException ex) {
            Logger.getLogger(SesionDAO.class.getName()).log(Level.SEVERE, null, ex);
        } 
        return name;
    }
}
