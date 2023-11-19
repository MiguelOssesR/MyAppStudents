package controller;

import db.EstudianteDAO;
import db.SesionDAO;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import model.Aula;
import model.Estudiante;

public class EstudianteController extends HttpServlet {

    private EstudianteDAO estDAO = new EstudianteDAO();
    private SesionDAO SesionDAO = new SesionDAO();

    Estudiante Estudiante;
    String txtID;
    String user;
    String target;
    ArrayList<Estudiante> data;
    ArrayList<Aula> aulas;

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String action = ((request.getParameter("action") != null) ? request.getParameter("action") : "list");

        switch (action) {
            case "login":
                user = request.getParameter("user");
                String password = request.getParameter("password");
                if (SesionDAO.getUser(user, password) == true) {                  
                    request.setAttribute("data", data = estDAO.getEstudiantes());
                    request.setAttribute("user", user);
                    String role = SesionDAO.getRole(user, password);
                    request.setAttribute("role", role);
                    request.setAttribute("name", SesionDAO.getName(user, password));
                    
                    if(role.equals("admin")){
                        request.getRequestDispatcher("estudiantes/index.jsp").forward(request, response);
                    } else {
                        String salon = estDAO.getSalonEstudiante(role);
                        request.setAttribute("salon", salon);                        
                        request.setAttribute("jornada", estDAO.getJornadaDocumento(Integer.parseInt(role)));
                        request.setAttribute("nombre", estDAO.getNombreDocumento(Integer.parseInt(role)));
                        request.setAttribute("grado", String.valueOf(estDAO.getGradoDocumento(Integer.parseInt(role))));
                        
                        ArrayList<String> lunes = estDAO.getMaterias(salon, "Lunes");
                        request.setAttribute("lunes", lunes);

                        ArrayList<String> martes = estDAO.getMaterias(salon, "Martes");
                        request.setAttribute("martes", martes);

                        ArrayList<String> miercoles = estDAO.getMaterias(salon, "Miercoles");
                        request.setAttribute("miercoles", miercoles);

                        ArrayList<String> jueves = estDAO.getMaterias(salon, "Jueves");
                        request.setAttribute("jueves", jueves);

                        ArrayList<String> viernes = estDAO.getMaterias(salon, "Viernes");
                        request.setAttribute("viernes", viernes);
                        
                        
                        request.getRequestDispatcher("estudiantes/indexNoAdmin.jsp").forward(request, response);
                    }
                    
                } else {
                    String mensajeError = "Usuario no encontrado, por favor intente de nuevo";
                    response.setContentType("text/html");
                    PrintWriter out = response.getWriter();
                    out.println("<script type=\"text/javascript\">");
                    out.println("alert('" + mensajeError + "');");
                    out.println("window.location.href='index.jsp';");
                    out.println("</script>");
                }
                break;
            case "list":
                user = request.getParameter("user");
                ArrayList<Estudiante> data = estDAO.getEstudiantes();
                request.setAttribute("data", data);
                request.setAttribute("user", user);
                request.getRequestDispatcher("estudiantes/index.jsp").forward(request, response);
                break;
            case "delete":
                user = request.getParameter("user");
                request.setAttribute("user", user);
                txtID = request.getParameter("id");
                int id = Integer.parseInt(txtID);
                estDAO.deleteEstudiante(id);

                data = estDAO.getEstudiantes();
                request.setAttribute("data", data);
                request.setAttribute("user", user);
                request.getRequestDispatcher("estudiantes/index.jsp").forward(request, response);
                break;
            case "add":
                user = request.getParameter("user");
                request.setAttribute("user", user);
                request.getRequestDispatcher("estudiantes/registro.jsp").forward(request, response);
                break;
            case "addAula":
                user = request.getParameter("user");
                request.setAttribute("user", user);
                ArrayList<Estudiante> listaEstudiantes = estDAO.getEstudiantes();
                request.setAttribute("listaEstudiantes", listaEstudiantes);
                request.getRequestDispatcher("estudiantes/registrarAula.jsp").forward(request, response);
                break;
            case "save":
                user = request.getParameter("user");
                request.setAttribute("user", user);
                int documento = Integer.parseInt(request.getParameter("documento"));
                String nombres = request.getParameter("nombres");
                String primer_apellido = request.getParameter("primer_apellido");
                String segundo_apellido = request.getParameter("segundo_apellido");
                String jornada = request.getParameter("jornada");
                int grado = Integer.parseInt(request.getParameter("grado"));

                Estudiante estudiante = new Estudiante(documento, nombres, primer_apellido, segundo_apellido, jornada, grado);

                estDAO.addEstudiante(estudiante);

                data = estDAO.getEstudiantes();
                request.setAttribute("data", data);
                request.setAttribute("user", user);
                request.getRequestDispatcher("estudiantes/index.jsp").forward(request, response);
                break;
            case "consultEst":
                user = request.getParameter("user");
                request.setAttribute("user", user);

                if (request.getParameter("target") == null) {
                    target = "empty";
                } else {
                    target = request.getParameter("target");
                    ArrayList<String> lunes = estDAO.getMaterias(target, "Lunes");
                    request.setAttribute("lunes", lunes);

                    ArrayList<String> martes = estDAO.getMaterias(target, "Martes");
                    request.setAttribute("martes", martes);

                    ArrayList<String> miercoles = estDAO.getMaterias(target, "Miercoles");
                    request.setAttribute("miercoles", miercoles);

                    ArrayList<String> jueves = estDAO.getMaterias(target, "Jueves");
                    request.setAttribute("jueves", jueves);

                    ArrayList<String> viernes = estDAO.getMaterias(target, "Viernes");
                    request.setAttribute("viernes", viernes);
                }

                String txtDocumento = request.getParameter("documento");
                int documentoConsultado = Integer.parseInt(txtDocumento);
                request.setAttribute("documento", txtDocumento);

                if (estDAO.getExisteEstudianteDocumento(documentoConsultado) == true) {
                    int gradoC = estDAO.getGradoDocumento(documentoConsultado);
                    String gradoCfix = String.valueOf(gradoC);
                    String jornadaC = estDAO.getJornadaDocumento(documentoConsultado);
                    String nombreCompleto = estDAO.getNombreDocumento(documentoConsultado);
                    aulas = estDAO.getAulas(gradoC);

                    request.setAttribute("nombre", nombreCompleto);
                    request.setAttribute("grado", gradoCfix);
                    request.setAttribute("jornada", jornadaC);
                    request.setAttribute("aulas", aulas);
                    request.setAttribute("target", target);
                    request.setAttribute("documento", txtDocumento);

                    request.getRequestDispatcher("estudiantes/registrarAulaSelected.jsp").forward(request, response);
                } else {
                    request.getRequestDispatcher("estudiantes/registrarAula.jsp").forward(request, response);
                }
                break;
            case "matricularSalon":
                user = request.getParameter("user");
                request.setAttribute("user", user);
                String documentoC = request.getParameter("documento");
                String targetC = request.getParameter("target");
                estDAO.registrarEstudiante(documentoC, target);
                response.sendRedirect("MainApp?obj=estudiante&action=list&user=" + user);

                break;
            case "totalConsult":
                user = request.getParameter("user");
                request.setAttribute("user", user);
                request.getRequestDispatcher("estudiantes/consultaTotal.jsp").forward(request, response);
                break;
             case "totalConsultResult":
                user = request.getParameter("user");
                request.setAttribute("user", user);
                documentoC = request.getParameter("documento");
                int documentoCFix = Integer.parseInt(documentoC);
                
                String nombreC = estDAO.getNombreDocumento(documentoCFix);
                String jornadaC = estDAO.getJornadaDocumento(documentoCFix);
                String gradoC = String.valueOf(estDAO.getGradoDocumento(documentoCFix));
                String salonC = estDAO.getSalonEstudiante(documentoC);
                
                request.setAttribute("nombre", nombreC);
                request.setAttribute("jornada", jornadaC);
                request.setAttribute("grado", gradoC);
                request.setAttribute("salon", salonC);
                
                if(!salonC.equals("No Asignado")){
                    ArrayList<String> lunes = estDAO.getMaterias(salonC, "Lunes");
                    request.setAttribute("lunes", lunes);

                    ArrayList<String> martes = estDAO.getMaterias(salonC, "Martes");
                    request.setAttribute("martes", martes);

                    ArrayList<String> miercoles = estDAO.getMaterias(salonC, "Miercoles");
                    request.setAttribute("miercoles", miercoles);

                    ArrayList<String> jueves = estDAO.getMaterias(salonC, "Jueves");
                    request.setAttribute("jueves", jueves);

                    ArrayList<String> viernes = estDAO.getMaterias(salonC, "Viernes");
                    request.setAttribute("viernes", viernes);
                }
                
                request.getRequestDispatcher("estudiantes/consultaTotalSelected.jsp").forward(request, response);
                
                
                break;
            default:
                response.sendRedirect("index.jsp");
                break;
        }

    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }

}
