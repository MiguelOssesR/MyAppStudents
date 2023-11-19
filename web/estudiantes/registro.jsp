<%@page import="model.Estudiante"%>
<%@page import="java.util.ArrayList"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%
    String user = (String) request.getAttribute("user");
%>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Registrar Estudiantes</title>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-T3c6CoIi6uLrA9TneNEoa7RxnatzjcDSCmG1MXxSR1GAsXEV/Dwwykc2MPK8M2HN" crossorigin="anonymous">
        <link href='https://unpkg.com/boxicons@2.1.4/css/boxicons.min.css' rel='stylesheet'>
        <style>
        .col-full-height {
            height: 100vh;
        }
        </style>
    </head>
    <body class="p-3 mb-2 bg-dark text-white">
        
<div class="container-fluid py-2 rounded" style="background-color: #454546;">
    <div class="row">
        <div class="col">
            <h2 style="font-size: 30px">🗒 Registrar nuevo estudiante</h2>
        </div>
        
        <div class="col d-flex align-items-center justify-content-end">
            <p class="m-0 d-flex align-items-center">
                 <%
                    
                    out.println(user);
                %>
                <box-icon type='solid' name='user' size="md" color="white"></box-icon>
            </p>
        </div>
    </div>
</div>
        <br>
        
        <div class="container-fluid" id="sidebar">
            <div class="row">
                <div class="col-md-2 col-full-height rounded" style="background-color: #454546;">
                    <div class="w-100 mt-2">
                        <a href="MainApp?obj=estudiante&action=list&user=<%=user%>" class="btn btn-warning w-100 py-3 mt-2">🎓 Listado de Estudiantes</a>
                        <a href="MainApp?obj=estudiante&action=add&user=<%=user%>" class="btn btn-warning w-100 py-3 mt-2">🗒 Registrar nuevo estudiante</a>
                        <a href="MainApp?obj=estudiante&action=addAula&user=<%=user%>" class="btn btn-warning w-100 py-3 mt-2">🖍 Registrar aula</a>
                        <a href="MainApp?obj=estudiante&action=totalConsult&user=<%=user%>" class="btn btn-warning w-100 py-3 mt-2">👁 Información de estudiante</a>
                        <a href="index.jsp" class="btn btn-danger w-100 py-3 mt-2">✖ Cerrar Sesión</a>
                        <div class="container" style="text-align: center; font-size: 50px"></div>
                    </div>
                </div>
                
                <div class="col-md-10 col-full-height">
                    <div class="container-fluid">
                        <form method="post" action="MainApp?obj=estudiante&action=save&user=<%=user%>">            
                            <table class="table table-striped table-dark">
                            <tr>
                              <td><label>Documento</label></td>
                              <td><input type="number" name="documento" class="form-control bg-dark text-white"/><br></td>
                            </tr>

                            <tr>
                              <td><label>Nombres</label></td>
                              <td><input type="text" name="nombres" class="form-control bg-dark text-white"/><br></td>
                            </tr>
                            
                            <tr>
                              <td><label>Primer apellido</label></td>
                              <td><input type="text" name="primer_apellido" class="form-control bg-dark text-white"/><br></td>
                            </tr>
                            
                            <tr>
                              <td><label>Segundo apellido</label></td>
                              <td><input type="text" name="segundo_apellido" class="form-control bg-dark text-white"/><br></td>
                            </tr>
                            
                            <tr>
                              <td><label>Jornada</label></td>
                              <td>
                                  <select name="jornada" class="form-control bg-dark text-white">
                                    <option value="Diurna">Diurna</option>
                                    <option value="Tarde">Tarde</option>
                                  </select
                              </td>
                            </tr> 
                            
                            <tr>
                              <td><label>Grado</label></td>
                              <td>
                                  <select name="grado" class="form-control bg-dark text-white">
                                    <option value="1">1</option>
                                    <option value="2">2</option>
                                    <option value="3">3</option>
                                    <option value="4">4</option>
                                    <option value="5">5</option>
                                  </select
                              </td>
                            </tr> 
                            
                            <tr>
                              <td colspan="2">
                                  <button class="btn btn-warning">Crear Orden</button>
                                </td>    
                              </td>
                            </tr>
                          </table>
                         </form>
                    </div>
                </div>
            </div>
        </div>
        <script src="https://unpkg.com/boxicons@2.1.4/dist/boxicons.js"></script>

    </body>
</html>
