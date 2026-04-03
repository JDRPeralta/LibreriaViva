package model;

import conexion.ConexionBD;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class ClienteModel {

    //Atributos
    private int    id;
    private String nombre;
    private String correo;
    private String telefono;
    private String direccion;

    // Constructor vacío
    public ClienteModel() {}

    // Constructor con todos los campos
    public ClienteModel(int id, String nombre, String correo,
                        String telefono, String direccion) {
        this.id        = id;
        this.nombre    = nombre;
        this.correo    = correo;
        this.telefono  = telefono;
        this.direccion = direccion;
    }

    //Getters y Setters
    public int    getId()        { return id; }
    public void   setId(int id)  { this.id = id; }

    public String getNombre()              { return nombre; }
    public void   setNombre(String v)      { this.nombre = v; }

    public String getCorreo()              { return correo; }
    public void   setCorreo(String v)      { this.correo = v; }

    public String getTelefono()            { return telefono; }
    public void   setTelefono(String v)    { this.telefono = v; }

    public String getDireccion()           { return direccion; }
    public void   setDireccion(String v)   { this.direccion = v; }


    // MÉTODOS SQL

    public boolean RegistrarCliente() {
        String sql = "INSERT INTO cliente (nombre, correo, telefono, direccion) " +
                     "VALUES (?, ?, ?, ?)";
        try (Connection conn = ConexionBD.getConexion();
             PreparedStatement ps = conn.prepareStatement(sql)) {

            ps.setString(1, this.nombre);
            ps.setString(2, this.correo);
            ps.setString(3, this.telefono);
            ps.setString(4, this.direccion);

            int filas = ps.executeUpdate();
            return filas > 0;

        } catch (SQLException e) {
            e.printStackTrace();
            return false;
        }
    }

    public List<ClienteModel> ListarClientes() {
        List<ClienteModel> lista = new ArrayList<>();
        String sql = "SELECT id, nombre, correo, telefono, direccion " +
                     "FROM cliente ORDER BY id";
        try (Connection conn = ConexionBD.getConexion();
             PreparedStatement ps = conn.prepareStatement(sql);
             ResultSet rs = ps.executeQuery()) {

            while (rs.next()) {
                ClienteModel c = new ClienteModel(
                    rs.getInt("id"),
                    rs.getString("nombre"),
                    rs.getString("correo"),
                    rs.getString("telefono"),
                    rs.getString("direccion")
                );
                lista.add(c);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return lista;
    }

    public ClienteModel ObtenerClientePorId(int id) {
        String sql = "SELECT id, nombre, correo, telefono, direccion " +
                     "FROM cliente WHERE id = ?";
        try (Connection conn = ConexionBD.getConexion();
             PreparedStatement ps = conn.prepareStatement(sql)) {

            ps.setInt(1, id);
            try (ResultSet rs = ps.executeQuery()) {
                if (rs.next()) {
                    return new ClienteModel(
                        rs.getInt("id"),
                        rs.getString("nombre"),
                        rs.getString("correo"),
                        rs.getString("telefono"),
                        rs.getString("direccion")
                    );
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return null;
    }

    public boolean ActualizarCliente() {
        String sql = "UPDATE cliente SET nombre=?, correo=?, telefono=?, " +
                     "direccion=? WHERE id=?";
        try (Connection conn = ConexionBD.getConexion();
             PreparedStatement ps = conn.prepareStatement(sql)) {

            ps.setString(1, this.nombre);
            ps.setString(2, this.correo);
            ps.setString(3, this.telefono);
            ps.setString(4, this.direccion);
            ps.setInt(5, this.id);

            return ps.executeUpdate() > 0;

        } catch (SQLException e) {
            e.printStackTrace();
            return false;
        }
    }

    public boolean EliminarCliente(int id) {
        String sql = "DELETE FROM cliente WHERE id = ?";
        try (Connection conn = ConexionBD.getConexion();
             PreparedStatement ps = conn.prepareStatement(sql)) {

            ps.setInt(1, id);
            return ps.executeUpdate() > 0;

        } catch (SQLException e) {
            e.printStackTrace();
            return false;
        }
    }

    //Validando
    public String Validar() {
        if (nombre == null || nombre.trim().isEmpty())
            return "El nombre es obligatorio.";
        if (correo == null || correo.trim().isEmpty())
            return "El correo es obligatorio.";
        if (!correo.matches("^[\\w._%+\\-]+@[\\w.\\-]+\\.[a-zA-Z]{2,}$"))
            return "Formato de correo inválido.";
        if (telefono != null && telefono.length() > 20)
            return "El teléfono no puede superar 20 caracteres.";
        return null;
    }
}