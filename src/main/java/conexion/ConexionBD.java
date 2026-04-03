package conexion;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class ConexionBD {

    // 1. La nueva URL del Pooler (le quitamos el usuario y pass del final porque van abajo)
    private static final String URL = "jdbc:postgresql://aws-1-us-east-1.pooler.supabase.com:5432/postgres?sslmode=require";
    
    // 2. Tu nuevo usuario generado por Supabase
    private static final String USUARIO    = "postgres.yxykuiuttqsofluprgqj";
    
    // 3. Tu contraseña (se mantiene igual)
    private static final String CONTRASENA = "JUANDIEGOROMEROPERALTA";

    public static Connection getConexion() throws SQLException {
        try {
            Class.forName("org.postgresql.Driver");
        } catch (ClassNotFoundException e) {
            throw new SQLException("Driver no encontrado", e);
        }
        return DriverManager.getConnection(URL, USUARIO, CONTRASENA);
    }
}