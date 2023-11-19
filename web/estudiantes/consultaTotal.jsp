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
        <title>Consultar Estudiante</title>
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
                    <h2 style="font-size: 30px">👁 Información de estudiante</h2>
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
                        <h1>Consultar: Datos / Aula / Horario</h1>

                        <form class="form-control" method="post" action="MainApp?obj=estudiante&action=totalConsultResult&user=<%=user%>">
                            <label>Documento del estudiante</label>
                            <input type="number" name="documento" required>
                            <button class="btn btn-warning">Consultar</button>
                        </form>     
                    </div>
                </div>
            </div>
            <script src="https://unpkg.com/boxicons@2.1.4/dist/boxicons.js"></script>

    </body>
</html>