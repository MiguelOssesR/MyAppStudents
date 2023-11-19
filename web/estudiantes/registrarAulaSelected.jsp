<%@page import="model.Aula"%>
<%@page import="model.Estudiante"%>
<%@page import="java.util.ArrayList"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    String user = (String) request.getAttribute("user");
    String documento = (String) request.getAttribute("documento");
    String jornada = (String) request.getAttribute("jornada");
    String grado = (String) request.getAttribute("grado");
    String nombre = (String) request.getAttribute("nombre");
    ArrayList<Aula> listaAulas = (ArrayList<Aula>) request.getAttribute("aulas");
    ArrayList<Estudiante> listaEstudiantes = (ArrayList<Estudiante>) request.getAttribute("listaEstudiantes");
    if (listaEstudiantes == null) {
        listaEstudiantes = new ArrayList();
    }

    String target = (String) request.getAttribute("target");

    ArrayList<String> lunes = (ArrayList<String>) request.getAttribute("lunes");
    ArrayList<String> martes = (ArrayList<String>) request.getAttribute("martes");
    ArrayList<String> miercoles = (ArrayList<String>) request.getAttribute("miercoles");
    ArrayList<String> jueves = (ArrayList<String>) request.getAttribute("jueves");
    ArrayList<String> viernes = (ArrayList<String>) request.getAttribute("viernes");
%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Registrar Materias a estudiante</title>
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
                    <h2 style="font-size: 30px">🖍 Registrar materias</h2>
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
                        <div class="form-control">
                            <label>Documento del estudiante</label>
                            <input style="background-color: gray" type="text" name="documento" value="<%=documento%>"readonly>
                            <label>Jornada</label>
                            <input style="background-color: gray" type="text" name="jornada" value="<%=jornada%>"readonly>
                            <label>Grado</label>
                            <input style="background-color: gray" type="text" name="grado" value="<%=grado%>"readonly>
                        </div>

                        <br>

                        <div class="col-full-height rounded container-fluid d-flex flex-column" style="color: black; background-color: white">
                            <label class="pt-3">Nombre del estudiante:</label>
                            <input style="background-color: gray" type="text" name="nombre" value="<%=nombre%>"readonly>


                            <form class="form-control" method="post" action="MainApp?obj=estudiante&action=consultEst&user=<%=user%>">
                                <label class="pt-2">Salones disponibles:</label>
                                <br>
                                <select name="target">
                                    <%
                                        for (Aula aul : listaAulas) {
                                    %>
                                    <option value="<%=aul.getAula()%>"><%=aul.getAula()%></option>
                                    <%
                                        }
                                    %>
                                </select>
                                <br>

                                <input type="hidden" name="documento" value="<%=documento%>"readonly>                                
                                <input type="hidden" name="jornada" value="<%=jornada%>"readonly>
                                <input type="hidden" name="grado" value="<%=grado%>"readonly>

                                <button class="btn btn-warning py-3 mt-2">Consultar Horario</button>
                            </form>


                            <%
                                if (!target.equals("empty")) {
                            %>
                            <h1>Horario del salon <%=target%></h1>

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
                            <div style="display: flex; justify-content: center; flex-direction: row; font-size: 22px;">
                                <form class="form-control" method="post" action="MainApp?obj=estudiante&action=matricularSalon">
                                    <input type="hidden" name="user" value="<%=user%>">
                                    <input type="hidden" name="documento" value="<%=documento%>"> 
                                    <input type="hidden" name="target" value="<%=target%>">
                                    <button class="btn btn-warning py-3 mt-2">Matricular estudiante a este salon</button>
                                </form>
                            </div>

                            <%
                                }
                            %>
                        </div>

                    </div>
                </div>
            </div>
            <script src="https://unpkg.com/boxicons@2.1.4/dist/boxicons.js"></script>
    </body>
</html>
