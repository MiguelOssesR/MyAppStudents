package db;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.logging.Level;
import java.util.logging.Logger;
import model.Aula;
import model.Estudiante;

public class EstudianteDAO {
    
    private ConexionDB db;

    public EstudianteDAO() {
        this.db = ConexionDB.getInstance();
    }
    
    
    public ArrayList<Estudiante> getEstudiantes() {
        ArrayList<Estudiante> datos = new ArrayList();
        String sql = "SELECT * FROM bd_students.estudiantes;";

        try {
            PreparedStatement ps = db.getConexion().prepareStatement(sql);
            ResultSet rs1 = ps.executeQuery();
            while (rs1.next()) {
                int id = rs1.getInt("id");
                int documento = rs1.getInt("documento");
                String nombres = rs1.getString("nombres");
                String primer_apellido = rs1.getString("primer_apellido");
                String segundo_apellido = rs1.getString("segundo_apellido");
                String jornada = rs1.getString("jornada");
                int grado = rs1.getInt("grado");
                
                Estudiante est = new Estudiante(id, documento, nombres, primer_apellido, segundo_apellido, jornada, grado);

                datos.add(est);
            }
        } catch (SQLException ex) {
            Logger.getLogger(EstudianteDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return datos;
    }
    
        public String getNombreDocumento(int documento) {
        String nombre = "";
        String sql = "SELECT * FROM bd_students.estudiantes where documento = ?;";

        try {
            PreparedStatement ps = db.getConexion().prepareStatement(sql);
            ps.setInt(1, documento);
            ResultSet rs1 = ps.executeQuery();
            while (rs1.next()) {
                String nombreN = rs1.getString("nombres");
                String ape1 = rs1.getString("primer_apellido");
                String ape2 = rs1.getString("segundo_apellido");
                nombre = nombreN + " " + ape1 + " " + ape2;
            }
        } catch (SQLException ex) {
            Logger.getLogger(EstudianteDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return nombre;
    }
    
    
    public boolean getExisteEstudianteDocumento(int documento) {
        boolean encontrado = false;
        
        String sql = "SELECT * FROM bd_students.estudiantes where documento = ?;";

        try {
            PreparedStatement ps = db.getConexion().prepareStatement(sql);
            ps.setInt(1, documento);
            ResultSet rs1 = ps.executeQuery();
            
            if(rs1.next()){
                encontrado = true;
            }
            
        } catch (SQLException ex) {
            Logger.getLogger(EstudianteDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return encontrado;
    }
    
    
    public String getJornadaDocumento(int documento) {
        String jornada = "";
        String sql = "SELECT * FROM bd_students.estudiantes where documento = ?;";

        try {
            PreparedStatement ps = db.getConexion().prepareStatement(sql);
            ps.setInt(1, documento);
            ResultSet rs1 = ps.executeQuery();
            while (rs1.next()) {
                jornada = rs1.getString("jornada");
            }
        } catch (SQLException ex) {
            Logger.getLogger(EstudianteDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return jornada;
    }
    
    public int getGradoDocumento(int documento) {
        int grado = 0;
        String sql = "SELECT * FROM bd_students.estudiantes where documento = ?;";

        try {
            PreparedStatement ps = db.getConexion().prepareStatement(sql);
            ps.setInt(1, documento);
            ResultSet rs1 = ps.executeQuery();
            while (rs1.next()) {
                grado = rs1.getInt("grado");
            }
        } catch (SQLException ex) {
            Logger.getLogger(EstudianteDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return grado;
    }
    
    public void addEstudiante(Estudiante est){
        String sql = "insert into bd_students.estudiantes values (NULL, ?, ?, ?, ?, ?, ?);";
        try {
            PreparedStatement ps = db.getConexion().prepareStatement(sql);
            ps.setInt(1, est.getdocumento());
            ps.setString(2, est.getNombres());
            ps.setString(3, est.getPrimer_apellido());
            ps.setString(4, est.getSegundo_apellido());
            ps.setString(5, est.getJornada());
            ps.setInt(6, est.getGrado());
            ps.execute();
        } catch (SQLException ex) {
            Logger.getLogger(EstudianteDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
    
    public void deleteEstudiante(int id) {
        String sql = "DELETE FROM bd_students.estudiantes WHERE id = ?;";
        try {
            PreparedStatement ps = db.getConexion().prepareStatement(sql);
            ps.setInt(1, id);
            ps.execute();
        } catch (SQLException ex) {
            Logger.getLogger(EstudianteDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
    
        public ArrayList<Aula> getAulas(int recibirGrado) {
        ArrayList<Aula> datos = new ArrayList();
        String sql = "SELECT * FROM bd_students.aulas where grado = ?;";

        try {
            PreparedStatement ps = db.getConexion().prepareStatement(sql);
            ps.setInt(1, recibirGrado);
            ResultSet rs1 = ps.executeQuery();
            while (rs1.next()) {
                int grado = rs1.getInt("grado");
                String aula = rs1.getString("aula");
                Aula aul = new Aula(grado, aula);
                datos.add(aul);
            }
        } catch (SQLException ex) {
            Logger.getLogger(EstudianteDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return datos;
    }
        
        public ArrayList<String> getMaterias(String aula, String dia){
            ArrayList<String> materias = new ArrayList();
            String sql = "SELECT h1,h2,h3,d,h4,h5,h6 FROM bd_students.horario where aula = ? and dia = ?;";
            
            try {
                PreparedStatement ps = db.getConexion().prepareStatement(sql);
                ps.setString(1, aula);
                ps.setString(2, dia);
                ResultSet rsl = ps.executeQuery();
                while (rsl.next()) {
                    String h1 = rsl.getString("h1");
                    String h2 = rsl.getString("h2");
                    String h3 = rsl.getString("h3");
                    String d = rsl.getString("d");
                    String h4 = rsl.getString("h4");
                    String h5 = rsl.getString("h5");
                    String h6 = rsl.getString("h6");
                    
                    materias.add(h1);
                    materias.add(h2);
                    materias.add(h3);
                    materias.add(d);
                    materias.add(h4);
                    materias.add(h5);
                    materias.add(h6);
                }
            } catch (SQLException ex) {
            Logger.getLogger(EstudianteDAO.class.getName()).log(Level.SEVERE, null, ex);
            }

            return materias;
        }
        
        public void registrarEstudiante(String documento, String target){
            String sql = "INSERT INTO bd_students.estudiante_aula VALUES(?,?);";
            try {
                PreparedStatement ps = db.getConexion().prepareStatement(sql);
                ps.setString(1, documento);
                ps.setString(2, target);
                ps.executeUpdate();
            } catch (SQLException ex) {
            Logger.getLogger(EstudianteDAO.class.getName()).log(Level.SEVERE, null, ex);
            }
        }
        
        public String getSalonEstudiante(String documento){
            String salon = "No Asignado";
            String sql = "SELECT aula FROM bd_students.estudiante_aula where doc_estudiante = ?";
            
            try {
                PreparedStatement ps = db.getConexion().prepareStatement(sql);
                ps.setString(1, documento);
                ResultSet rsl = ps.executeQuery();
                while (rsl.next()) {
                    salon = rsl.getString("aula");
                }
            } catch (SQLException ex) {
            Logger.getLogger(EstudianteDAO.class.getName()).log(Level.SEVERE, null, ex);
            }
            
            return salon;
        }
    
}
