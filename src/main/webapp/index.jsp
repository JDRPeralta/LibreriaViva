<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="jakarta.tags.core" prefix="c" %>
<c:set var="ctx" value="${pageContext.request.contextPath}" />

<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Lectura Viva - Respuesta Pregunta 1</title>
    <style>
        * { box-sizing: border-box; }

        body {
            margin: 0;
            font-family: Arial, sans-serif;
            background: #f4f7fb;
            color: #333;
        }

        .container {
            max-width: 1000px;
            margin: 40px auto;
            background: #fff;
            padding: 30px;
            border-radius: 16px;
            box-shadow: 0 8px 24px rgba(0,0,0,.08);
        }

        h1 {
            margin-top: 0;
            color: #2c3e50;
            text-align: center;
        }

        .subtitle {
            text-align: center;
            color: #5b6777;
            margin-bottom: 30px;
        }

        .bloque {
            background: #f9fbff;
            border-left: 6px solid #4a90d9;
            padding: 18px;
            margin-bottom: 18px;
            border-radius: 10px;
        }

        .bloque h2 {
            margin-top: 0;
            font-size: 20px;
            color: #1f3b5b;
        }

        .bloque p {
            margin: 0;
            line-height: 1.7;
        }

        .resumen {
            background: #eef6ff;
            border: 1px solid #cfe2ff;
            padding: 18px;
            border-radius: 10px;
            font-weight: bold;
            color: #1d4f91;
            margin-top: 25px;
        }

        .acciones {
            text-align: center;
            margin-top: 30px;
        }

        .titulo-sistema {
            font-size: 20px;
            font-weight: bold;
            color: #2c3e50;
            margin-bottom: 16px;
        }

        .btn {
            display: inline-block;
            padding: 12px 18px;
            margin: 6px;
            color: white;
            text-decoration: none;
            border-radius: 10px;
            font-weight: bold;
            transition: .2s ease;
        }

        .btn-ver {
            background: #4a90d9;
        }

        .btn-ver:hover {
            background: #357abd;
        }

        .btn-editar {
            background: #f59e0b;
        }

        .btn-editar:hover {
            background: #d97706;
        }
    </style>
</head>
<body>
    <div class="container">
        <h1>📚 Respuesta pregunta 1</h1>
        <p class="subtitle">Flujo de funcionamiento entre Cliente, Servlet, JSP y Respuesta</p>

        <div class="bloque">
            <h2>1. Cliente (El que pide)</h2>
            <p>
                Alguien entra a su navegador web y le da clic al botón "Ver Clientes".
                Eso genera una petición (un aviso) que viaja por internet hasta el servidor diciendo:
                "Oye, quiero ver la lista".
            </p>
        </div>

        <div class="bloque">
            <h2>2. Servlet (El cerebro / El mozo)</h2>
            <p>
                Tu controlador (como tu ClienteController) recibe el aviso. Es el código Java
                que hace el trabajo pesado: va a la base de datos, saca toda la lista de clientes
                y dice: "Listo, ya tengo los datos crudos, ahora se los paso al JSP para que los ponga bonitos".
            </p>
        </div>

        <div class="bloque">
            <h2>3. JSP (El diseñador / El chef)</h2>
            <p>
                Tu archivo lista.jsp recibe esa información. Como el JSP, agarra esos datos crudos
                y los va acomodando. Dibuja la tabla, pone los títulos, los botones de editar/eliminar,
                y transforma todo en una página web.
            </p>
        </div>

        <div class="bloque">
            <h2>4. Respuesta (El plato servido)</h2>
            <p>
                El servidor agarra esa página ya terminada (convertida en HTML puro) y se la devuelve
                al navegador. El usuario finalmente ve su lista de clientes en la pantalla.
                ¡Y ya está, ciclo terminado!
            </p>
        </div>

        <div class="resumen">
            Básicamente es: Pides algo (Cliente) -> Java hace el trabajo sucio (Servlet)
            -> Se arma el diseño (JSP) -> Lo ves en pantalla (Respuesta).
        </div>

        <div class="acciones">
            <div class="titulo-sistema">Sistema de Clientes – Librería Viva</div>
            <a href="${ctx}/clientes?accion=listar" class="btn btn-ver">👥 Ver Clientes</a>
            <a href="${ctx}/clientes?accion=listar" class="btn btn-editar">✏️ Editar Clientes</a>
        </div>
    </div>
</body>
</html>