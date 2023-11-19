package db;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;

public class ConexionDB {
    
    private String host="myapprds.cdjqjfmeirq3.us-east-1.rds.amazonaws.com";
    private int port=3306;
    private String db = "bd_students";
    private String user="admin";
    private String password= "Luxor13*";
    private String url = "jdbc:mysql://"+host+":"+port+"/"+db+"?useSSL=false&serverTimezone=UTC";
    
    private Connection conexion;
    
    private static ConexionDB dbInstance;
    
    private ConexionDB(){
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            this.conexion=DriverManager.getConnection(url, user, password);
            System.out.println("LA CONEXION A LA BD FUE EXITOSA");
        } catch (ClassNotFoundException | SQLException ex) {
            Logger.getLogger(ConexionDB.class.getName()).log(Level.SEVERE, null, ex);
            System.out.println("LA CONEXION A LA BD NO SE CONCRETÓ");
        }
    }
    
    public static ConexionDB getInstance(){
        if (dbInstance==null) {
            dbInstance=new ConexionDB();
        }
        return dbInstance;
    }
    
    public Connection getConexion() {
        return conexion;
    }
    public void closed (){
        if (conexion!=null) {
            try{
                conexion.close();
            } catch (SQLException ex) {
                Logger.getLogger(ConexionDB.class.getName()).log(Level.SEVERE, null, ex);
            }
        }
    }
    
    
}
