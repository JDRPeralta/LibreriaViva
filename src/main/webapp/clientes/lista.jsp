<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="jakarta.tags.core" prefix="c" %>
<c:set var="ctx" value="${pageContext.request.contextPath}" />

<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Lista de Clientes</title>
    <style>
        * { box-sizing: border-box; }
        body {
            margin: 0;
            font-family: Arial, sans-serif;
            background: #f4f7fb;
            color: #333;
        }
        .container {
            max-width: 1100px;
            margin: 40px auto;
            background: #fff;
            padding: 28px;
            border-radius: 14px;
            box-shadow: 0 8px 24px rgba(0,0,0,.08);
        }
        .topbar {
            display: flex;
            justify-content: space-between;
            align-items: center;
            gap: 12px;
            flex-wrap: wrap;
            margin-bottom: 20px;
        }
        h2 {
            margin: 0;
            color: #2c3e50;
        }
        .btn {
            display: inline-block;
            padding: 10px 14px;
            border-radius: 8px;
            text-decoration: none;
            font-weight: bold;
            font-size: 14px;
        }
        .btn-primary {
            background: #4a90d9;
            color: #fff;
        }
        .btn-primary:hover {
            background: #357abd;
        }
        .table-wrap {
            overflow-x: auto;
        }
        table {
            width: 100%;
            border-collapse: collapse;
            overflow: hidden;
            border-radius: 10px;
        }
        thead th {
            background: #4a90d9;
            color: #fff;
            text-align: left;
            padding: 12px;
        }
        tbody td {
            padding: 12px;
            border-bottom: 1px solid #e5e7eb;
            vertical-align: top;
        }
        tbody tr:hover {
            background: #f9fbff;
        }
        .acciones a {
            text-decoration: none;
            font-weight: bold;
            margin-right: 10px;
        }
        .editar {
            color: #0f766e;
        }
        .eliminar {
            color: #b91c1c;
        }
        .empty-row {
            text-align: center;
            color: #6b7280;
            padding: 22px;
        }
        .direccion {
            max-width: 280px;
            word-break: break-word;
        }
        .badge {
            display: inline-block;
            padding: 4px 8px;
            background: #eef4ff;
            color: #245ea8;
            border-radius: 999px;
            font-size: 12px;
            font-weight: bold;
        }
    </style>
</head>
<body>
<div class="container">
    <div class="topbar">
        <h2>Clientes – Lectura Viva</h2>
        <a href="${ctx}/clientes?accion=nuevo" class="btn btn-primary">Nuevo Cliente</a>
    </div>

    <div class="table-wrap">
        <table>
            <thead>
            <tr>
                <th>ID</th>
                <th>Nombre</th>
                <th>Correo</th>
                <th>Teléfono</th>
                <th>Dirección</th>
                <th>Acciones</th>
            </tr>
            </thead>
            <tbody>
            <c:choose>
                <c:when test="${empty clientes}">
                    <tr>
                        <td colspan="6" class="empty-row">
                            No hay clientes registrados.
                        </td>
                    </tr>
                </c:when>
                <c:otherwise>
                    <c:forEach var="c" items="${clientes}">
                        <tr>
                            <td><span class="badge">#<c:out value="${c.id}" /></span></td>
                            <td><c:out value="${c.nombre}" /></td>
                            <td><c:out value="${c.correo}" /></td>
                            <td>
                                <c:choose>
                                    <c:when test="${not empty c.telefono}">
                                        <c:out value="${c.telefono}" />
                                    </c:when>
                                    <c:otherwise>-</c:otherwise>
                                </c:choose>
                            </td>
                            <td class="direccion">
                                <c:choose>
                                    <c:when test="${not empty c.direccion}">
                                        <c:out value="${c.direccion}" />
                                    </c:when>
                                    <c:otherwise>-</c:otherwise>
                                </c:choose>
                            </td>
                            <td class="acciones">
                                <a class="editar" href="${ctx}/clientes?accion=editar&id=${c.id}">Editar</a>
                                <a class="eliminar"
                                   href="${ctx}/clientes?accion=eliminar&id=${c.id}"
                                   onclick="return confirm('¿Seguro que deseas eliminar este cliente?');">
                                     Eliminar
                                </a>
                            </td>
                        </tr>
                    </c:forEach>
                </c:otherwise>
            </c:choose>
            </tbody>
        </table>
    </div>
</div>
</body>
</html>