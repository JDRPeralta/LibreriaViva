package controller;

import model.ClienteModel;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;
import java.io.IOException;
import java.util.List;

@WebServlet("/clientes")
public class ClienteController extends HttpServlet {

    /**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	//GET
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {

        String accion = req.getParameter("accion");
        if (accion == null) accion = "listar";

        switch (accion) {

            case "listar" -> {
                // 1. Crear modelo  2. Llamar método  3. Pasar resultado a la vista
                ClienteModel modelo = new ClienteModel();
                List<ClienteModel> lista = modelo.ListarClientes();
                req.setAttribute("clientes", lista);
                req.getRequestDispatcher("/clientes/lista.jsp").forward(req, resp);
            }

            case "nuevo" -> {
                req.getRequestDispatcher("/clientes/formulario.jsp").forward(req, resp);
            }

            case "editar" -> {
                int id = Integer.parseInt(req.getParameter("id"));
                ClienteModel modelo = new ClienteModel();
                ClienteModel cliente = modelo.ObtenerClientePorId(id);

                if (cliente == null) {
                    resp.sendRedirect(req.getContextPath() + "/clientes?accion=listar");
                    return;
                }
                req.setAttribute("cliente", cliente);
                req.getRequestDispatcher("/clientes/editar.jsp").forward(req, resp);
            }

            case "eliminar" -> {
                int id = Integer.parseInt(req.getParameter("id"));
                new ClienteModel().EliminarCliente(id);
                resp.sendRedirect(req.getContextPath() + "/clientes?accion=listar");
            }
        }
    }

    //POST
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {

        req.setCharacterEncoding("UTF-8");
        String accion = req.getParameter("accion");

        // leo el formulario
        String nombre    = req.getParameter("nombre");
        String correo    = req.getParameter("correo");
        String telefono  = req.getParameter("telefono");
        String direccion = req.getParameter("direccion");

        // creo el objeto ClienteModel y asignar valores
        ClienteModel modelo = new ClienteModel();
        modelo.setNombre(nombre);
        modelo.setCorreo(correo);
        modelo.setTelefono(telefono);
        modelo.setDireccion(direccion);

        //valido
        String error = modelo.Validar();
        if (error != null) {
            req.setAttribute("error", error);
            req.setAttribute("cliente", modelo);
            String vista = "actualizar".equals(accion)
                           ? "/clientes/editar.jsp"
                           : "/clientes/formulario.jsp";
            req.getRequestDispatcher(vista).forward(req, resp);
            return;
        }

        // finalmente llamo al método
        if ("actualizar".equals(accion)) {
            modelo.setId(Integer.parseInt(req.getParameter("id")));
            modelo.ActualizarCliente();
        } else {
            modelo.RegistrarCliente();
        }

        // 5. Redirigir al listado
        resp.sendRedirect(req.getContextPath() + "/clientes?accion=listar");
    }
}