<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="jakarta.tags.core" prefix="c" %>
<c:set var="ctx" value="${pageContext.request.contextPath}" />

<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Editar Cliente</title>
    <style>
        * { box-sizing: border-box; }
        body {
            margin: 0;
            font-family: Arial, sans-serif;
            background: #f4f7fb;
            color: #333;
        }
        .container {
            max-width: 760px;
            margin: 40px auto;
            background: #fff;
            padding: 28px;
            border-radius: 14px;
            box-shadow: 0 8px 24px rgba(0,0,0,.08);
        }
        h2 {
            margin-top: 0;
            margin-bottom: 24px;
            color: #2c3e50;
        }
        .alert-error {
            background: #fdecea;
            color: #b42318;
            border: 1px solid #f5c2c0;
            padding: 12px 14px;
            border-radius: 8px;
            margin-bottom: 18px;
        }
        .form-group {
            margin-bottom: 18px;
        }
        label {
            display: block;
            font-weight: bold;
            margin-bottom: 6px;
        }
        .required {
            color: #d93025;
        }
        input, textarea {
            width: 100%;
            padding: 11px 12px;
            border: 1px solid #cfd8e3;
            border-radius: 8px;
            font-size: 14px;
            outline: none;
            transition: .2s;
        }
        input:focus, textarea:focus {
            border-color: #4a90d9;
            box-shadow: 0 0 0 3px rgba(74,144,217,.15);
        }
        textarea {
            min-height: 110px;
            resize: vertical;
        }
        .actions {
            display: flex;
            gap: 12px;
            margin-top: 24px;
        }
        .btn {
            display: inline-block;
            padding: 11px 16px;
            border: none;
            border-radius: 8px;
            text-decoration: none;
            cursor: pointer;
            font-weight: bold;
            font-size: 14px;
        }
        .btn-warning {
            background: #f59e0b;
            color: #fff;
        }
        .btn-warning:hover {
            background: #d97706;
        }
        .btn-secondary {
            background: #e9eef5;
            color: #2c3e50;
        }
        .btn-secondary:hover {
            background: #dce5ef;
        }
        .help-text {
            font-size: 12px;
            color: #6b7280;
            margin-top: 4px;
        }
    </style>
</head>
<body>
<div class="container">
    <h2>✏️ Editar Cliente</h2>

    <c:if test="${not empty error}">
        <div class="alert-error">
            <strong>Error:</strong> <c:out value="${error}" />
        </div>
    </c:if>

    <form method="POST" action="${ctx}/clientes">
        <input type="hidden" name="accion" value="actualizar">
        <input type="hidden" name="id" value="<c:out value='${cliente.id}'/>">

        <div class="form-group">
            <label for="nombre">Nombre <span class="required">*</span></label>
            <input
                type="text"
                id="nombre"
                name="nombre"
                value="<c:out value='${cliente.nombre}'/>"
                maxlength="100"
                placeholder="Ingrese el nombre del cliente"
                autocomplete="name"
                required>
        </div>

        <div class="form-group">
            <label for="correo">Correo <span class="required">*</span></label>
            <input
                type="email"
                id="correo"
                name="correo"
                value="<c:out value='${cliente.correo}'/>"
                maxlength="120"
                placeholder="cliente@correo.com"
                autocomplete="email"
                required>
        </div>

        <div class="form-group">
            <label for="telefono">Teléfono</label>
            <input
                type="text"
                id="telefono"
                name="telefono"
                value="<c:out value='${cliente.telefono}'/>"
                maxlength="20"
                placeholder="999888777"
                autocomplete="tel">
            <div class="help-text">Campo opcional.</div>
        </div>

        <div class="form-group">
            <label for="direccion">Dirección</label>
            <textarea
                id="direccion"
                name="direccion"
                maxlength="255"
                placeholder="Ingrese la dirección del cliente"><c:out value="${cliente.direccion}" /></textarea>
            <div class="help-text">Campo opcional.</div>
        </div>

        <div class="actions">
            <button type="submit" class="btn btn-warning">🔄 Actualizar</button>
            <a href="${ctx}/clientes?accion=listar" class="btn btn-secondary">Cancelar</a>
        </div>
    </form>
</div>
</body>
</html>