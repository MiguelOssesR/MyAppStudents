<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Base de datos Estudiantes</title>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-T3c6CoIi6uLrA9TneNEoa7RxnatzjcDSCmG1MXxSR1GAsXEV/Dwwykc2MPK8M2HN" crossorigin="anonymous">
    </head>
<body class="p-3 mb-2 bg-dark text-white" style="position: relative; min-height: 100vh;">
    <div class="container text-center mt-5">
        <h1 style="font-size: 60px;">Instituto Técnico Integrado Nuevomundo 🪐</h1>
        <h2>Base de datos de estudiantes</h2>
        <h1 style="font-size: 180px;">🎓</h1>
        <div class="container-fluid py-2 rounded" style="background-color: white; max-width: 300px; display: flex; flex-direction: column; align-items: center;">
            
            <form method="post" action="MainApp?obj=estudiante&action=login">
                <label style="color: gray">Nombre de usuario</label>
                <input type="text" name="user" class="form-control"/>
                <label style="color: gray">Clave de usuario</label>
                <input type="password" name="password" class="form-control"/>
                <div class="container text-center mt-5">
                    <button class="btn btn-warning btn-lg">Iniciar Sesion</button>
                </div>
            </form>
            <br>
        </div>
    </div>
    
    
    <div class="text-center p-3 mt-5 fixed-bottom" style="background-color: rgba(0, 0, 0, 0.2); width: 100%;">
        Presentado por: Miguel Osses - Camilo Uribe
    </div>
</body>
    

        
</html

