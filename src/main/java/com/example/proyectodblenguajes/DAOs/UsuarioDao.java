package com.example.proyectodblenguajes.DAOs;

import com.example.proyectodblenguajes.Models.Usuario;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import javax.sql.DataSource;
import java.math.BigDecimal;
import java.sql.*;


@Repository
public class UsuarioDao {

    @Autowired
    private DataSource dataSource;

    public void crearUsuario(String nombreUsuario, String contrasena, String correoElectronico, String rol) throws SQLException {
        String sql = "{call usuario_pkg.crear_usuario(?, ?, ?, ?)}";
        try (Connection connection = dataSource.getConnection();
             CallableStatement callableStatement = connection.prepareCall(sql)) {
            callableStatement.setString(1, nombreUsuario);
            callableStatement.setString(2, contrasena);
            callableStatement.setString(3, correoElectronico);
            callableStatement.setString(4, rol);
            callableStatement.executeUpdate();
        }
    }

    public Usuario obtenerUsuario(int idUsuario) throws SQLException {
        String sql = "{call obtener_usuario(?, ?, ?, ?, ?, ?)}";
        try (Connection connection = dataSource.getConnection();
             CallableStatement callableStatement = connection.prepareCall(sql)) {
            callableStatement.setInt(1, idUsuario);
            callableStatement.registerOutParameter(2, Types.VARCHAR);
            callableStatement.registerOutParameter(3, Types.VARCHAR);
            callableStatement.registerOutParameter(4, Types.VARCHAR);
            callableStatement.registerOutParameter(5, Types.VARCHAR);
            callableStatement.registerOutParameter(6, Types.TIMESTAMP);
            callableStatement.execute();

            Usuario usuario = new Usuario();
            usuario.setId(idUsuario);
            usuario.setNombreUsuario(callableStatement.getString(2));
            usuario.setContrasena(callableStatement.getString(3));
            usuario.setCorreoElectronico(callableStatement.getString(4));
            usuario.setRol(callableStatement.getString(5));
            usuario.setFechaCreacion(callableStatement.getTimestamp(6));

            return usuario;
        }
    }


    public void actualizarUsuario(Usuario usuario) throws SQLException {
        String sql = "{call actualizar_usuario(?, ?, ?, ?, ?)}";
        try (Connection connection = dataSource.getConnection();
             CallableStatement callableStatement = connection.prepareCall(sql)) {
            callableStatement.setInt(1, usuario.getId());
            callableStatement.setString(2, usuario.getNombreUsuario());
            callableStatement.setString(3, usuario.getContrasena());
            callableStatement.setString(4, usuario.getCorreoElectronico());
            callableStatement.setString(5, usuario.getRol());
            callableStatement.executeUpdate();
        }
    }


    public void eliminarUsuario(int idUsuario) throws SQLException {
        String sql = "{call eliminar_usuario(?)}";
        try (Connection connection = dataSource.getConnection();
             CallableStatement callableStatement = connection.prepareCall(sql)) {
            callableStatement.setInt(1, idUsuario);
            callableStatement.executeUpdate();
        }
    }
}
