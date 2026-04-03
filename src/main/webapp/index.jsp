<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="jakarta.tags.core" prefix="c" %>
<c:set var="ctx" value="${pageContext.request.contextPath}" />

<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Lectura Viva</title>
    <style>
        * { box-sizing: border-box; }

        body {
            margin: 0;
            font-family: Arial, sans-serif;
            background: linear-gradient(135deg, #eef4ff, #f9fbff);
            color: #2c3e50;
            min-height: 100vh;
            display: flex;
            align-items: center;
            justify-content: center;
        }

        .container {
            width: 100%;
            max-width: 700px;
            background: #ffffff;
            padding: 40px 32px;
            border-radius: 18px;
            box-shadow: 0 10px 30px rgba(0,0,0,.08);
            text-align: center;
        }

        .icono {
            font-size: 52px;
            margin-bottom: 10px;
        }

        h1 {
            margin: 0 0 12px 0;
            font-size: 32px;
            color: #1f3b5b;
        }

        p {
            margin: 0 0 28px 0;
            font-size: 16px;
            color: #5b6777;
            line-height: 1.6;
        }

        .acciones {
            display: flex;
            justify-content: center;
            gap: 14px;
            flex-wrap: wrap;
        }

        .btn {
            display: inline-block;
            padding: 12px 18px;
            border-radius: 10px;
            text-decoration: none;
            font-weight: bold;
            font-size: 15px;
            transition: .2s ease;
        }

        .btn-primary {
            background: #4a90d9;
            color: white;
        }

        .btn-primary:hover {
            background: #357abd;
            transform: translateY(-1px);
        }

        .btn-secondary {
            background: #eef2f7;
            color: #2c3e50;
        }

        .btn-secondary:hover {
            background: #dde6f1;
            transform: translateY(-1px);
        }

        .footer-note {
            margin-top: 26px;
            font-size: 13px;
            color: #7b8794;
        }
    </style>
</head>
<body>
    <div class="container">
        <div class="icono">📚</div>
        <h1>Librería Lectura Viva</h1>
        <p>
            Bienvenido al sistema de gestión. Desde aquí puedes administrar
            la información de los clientes de forma rápida y ordenada.
        </p>

        <div class="acciones">
            <a href="${ctx}/clientes?accion=listar" class="btn btn-primary">
                👥 Gestionar Clientes
            </a>

            <a href="${ctx}/clientes?accion=nuevo" class="btn btn-secondary">
                ➕ Nuevo Cliente
            </a>
        </div>

        <div class="footer-note">
            Evaluación T1 de Juan Diego Romero Peralta
        </div>
    </div>
</body>
</html>