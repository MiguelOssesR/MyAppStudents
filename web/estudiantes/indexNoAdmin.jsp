<%@page import="model.Estudiante"%>
<%@page import="java.util.ArrayList"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%
    String user = (String) request.getAttribute("user");
    String name = (String) request.getAttribute("name");
    String role = (String) request.getAttribute("role");
    String salon = (String) request.getAttribute("salon");
    String jornada = (String) request.getAttribute("jornada");
    String nombre = (String) request.getAttribute("nombre");
    String grado = (String) request.getAttribute("grado");
    
    ArrayList<String> lunes = (ArrayList<String>) request.getAttribute("lunes");
    ArrayList<String> martes = (ArrayList<String>) request.getAttribute("martes");
    ArrayList<String> miercoles = (ArrayList<String>) request.getAttribute("miercoles");
    ArrayList<String> jueves = (ArrayList<String>) request.getAttribute("jueves");
    ArrayList<String> viernes = (ArrayList<String>) request.getAttribute("viernes");
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
            <h2 style="font-size: 30px">👁 Información sobre <%=name%></h2>
        </div>
        
        <div class="col d-flex align-items-center justify-content-end">
            <p class="m-0 d-flex align-items-center">
                 <%
                    
                    out.println(name);
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
                        <a href="index.jsp" class="btn btn-danger w-100 py-3 mt-2">✖ Cerrar Sesión</a>
                        <div class="container" style="text-align: center; font-size: 50px"></div>
                    </div>
                </div>
                
                <div class="col-md-10 col-full-height">
                    <div class="container-fluid">
                        <div class="form-control">
                            <h1>Información del estudiante:</h1>
                            <label>N° Documento:</label>
                            <input style="background-color: gray; width: 300px;" type="text" name="nombre" value="<%=nombre%>"readonly>
                            <label>Jornada:</label>
                            <input style="background-color: gray" type="text" name="jornada" value="<%=jornada%>"readonly>
                            <label>Grado:</label>
                            <input style="background-color: gray; width: 30px;" type="text" name="grado" value="<%=grado%>"readonly>
                            <label>Salon:</label>
                            <input style="background-color: gray; width: 200px;" type="text" name="salon" value="<%=salon%>"readonly>
                            
                            <%
                                if (!salon.equals("No Asignado")) {
                            %>
                            <h1>Horario del salon <%=salon%></h1>

                            <div style="display: flex; justify-content: center; flex-direction: row; font-size: 22px;">

                                <table style="margin-right: 10px;">
                                    <thead>
                                    <th>Hora</th>
                                    </thead>

                                    <%
                                        if (jornada.equals("Diurna")) {
                                    %>
                                    <tbody>
                                        <tr>
                                            <td>6:00 a.m</td>
                                        </tr>

                                        <tr>
                                            <td>7:00 a.m</td>
                                        </tr>

                                        <tr>
                                            <td>8:00 a.m</td>
                                        </tr>

                                        <tr>
                                            <td>9:00 a.m</td>
                                        </tr>

                                        <tr>
                                            <td>10:00 a.m</td>
                                        </tr>

                                        <tr>
                                            <td>11:00 a.m</td>
                                        </tr>

                                        <tr>
                                            <td>12:00 a.m</td>
                                        </tr>
                                    </tbody>
                                    <%
                                    } else {
                                    %>
                                    <tbody>
                                        <tr>
                                            <td>12:00 p.m</td>
                                        </tr>

                                        <tr>
                                            <td>1:00 p.m</td>
                                        </tr>

                                        <tr>
                                            <td>2:00 p.m</td>
                                        </tr>

                                        <tr>
                                            <td>3:00 p.m</td>
                                        </tr>

                                        <tr>
                                            <td>4:00 p.m</td>
                                        </tr>

                                        <tr>
                                            <td>5:00 p.m</td>
                                        </tr>

                                        <tr>
                                            <td>6:00 p.m</td>
                                        </tr>
                                    </tbody>
                                    <%
                                        }
                                    %>
                                </table>

                                <table style="margin-right: 10px;">
                                    <thead>
                                    <th>Lunes</th>
                                    </thead>



                                    <tbody>
                                        <%
                                            for (int i = 0; i < lunes.size(); i++) {
                                                String materia = lunes.get(i);
                                        %>
                                        <tr>
                                            <td><%=materia%></td>
                                        </tr>
                                        <%
                                            }
                                        %>
                                    </tbody>
                                </table>

                                <table style="margin-right: 10px;">
                                    <thead>
                                    <th>Martes</th>
                                    </thead>



                                    <tbody>
                                        <%
                                            for (int i = 0; i < martes.size(); i++) {
                                                String materia = martes.get(i);
                                        %>
                                        <tr>
                                            <td><%=materia%></td>
                                        </tr>
                                        <%
                                            }
                                        %>
                                    </tbody>
                                </table>

                                <table style="margin-right: 10px;">
                                    <thead>
                                    <th>Miercoles</th>
                                    </thead>



                                    <tbody>
                                        <%
                                            for (int i = 0; i < miercoles.size(); i++) {
                                                String materia = miercoles.get(i);
                                        %>
                                        <tr>
                                            <td><%=materia%></td>
                                        </tr>
                                        <%
                                            }
                                        %>
                                    </tbody>
                                </table>

                                <table style="margin-right: 10px;">
                                    <thead>
                                    <th>Jueves</th>
                                    </thead>



                                    <tbody>
                                        <%
                                            for (int i = 0; i < jueves.size(); i++) {
                                                String materia = jueves.get(i);
                                        %>
                                        <tr>
                                            <td><%=materia%></td>
                                        </tr>
                                        <%
                                            }
                                        %>
                                    </tbody>
                                </table>

                                </table>

                                <table style="margin-right: 10px;">
                                    <thead>
                                    <th>Viernes</th>
                                    </thead>



                                    <tbody>
                                        <%
                                            for (int i = 0; i < viernes.size(); i++) {
                                                String materia = viernes.get(i);
                                        %>
                                        <tr>
                                            <td><%=materia%></td>
                                        </tr>
                                        <%
                                            }
                                        %>
                                    </tbody>
                                </table>

                            </div>
                            <%
                                }
                            %>
                        </div>    
                    </div>
                </div>
            </div>
        </div>
        <script src="https://unpkg.com/boxicons@2.1.4/dist/boxicons.js"></script>

    </body>
</html>