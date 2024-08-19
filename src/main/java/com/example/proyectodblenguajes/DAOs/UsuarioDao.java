package com.example.proyectodblenguajes.DAOs;

import com.example.proyectodblenguajes.Models.DTO.User;
import com.example.proyectodblenguajes.Models.Usuario;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import javax.sql.DataSource;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;


@Repository
public class UsuarioDao {

    @Autowired
    private DataSource dataSource;

    public void crearUsuario(String nombreUsuario, String contrasena, String correoElectronico) throws SQLException {
        String sql = "{call crear_usuario(?, ?, ?)}";
        try (Connection connection = dataSource.getConnection();
             CallableStatement callableStatement = connection.prepareCall(sql)) {
            callableStatement.setString(1, nombreUsuario);
            callableStatement.setString(2, contrasena);
            callableStatement.setString(3, correoElectronico);
            callableStatement.executeUpdate();
        }
    }

    public Usuario obtenerUsuario(String nombreUsuario) throws SQLException {
        String sql = "{call OBTENER_USUARIO(?, ?, ?, ?, ?, ?)}";
        try (Connection connection = dataSource.getConnection();
             CallableStatement callableStatement = connection.prepareCall(sql)) {
            callableStatement.setString(1, nombreUsuario);
            callableStatement.registerOutParameter(2, Types.INTEGER);
            callableStatement.registerOutParameter(3, Types.VARCHAR);
            callableStatement.registerOutParameter(4, Types.VARCHAR);
            callableStatement.registerOutParameter(5, Types.VARCHAR);
            callableStatement.registerOutParameter(6, Types.TIMESTAMP);
            callableStatement.execute();

            Usuario usuario = new Usuario();
            usuario.setId(callableStatement.getInt(2));
            usuario.setNombreUsuario(nombreUsuario);
            usuario.setContrasena(callableStatement.getString(3));
            usuario.setCorreoElectronico(callableStatement.getString(4));
            usuario.setRol(callableStatement.getString(5));
            usuario.setFechaCreacion(callableStatement.getTimestamp(6));

            return usuario;
        }
    }


    public List<User> obtenerTodosLosUsuarios() throws SQLException {
        List<User> usuarios = new ArrayList<>();
        String sql = "SELECT nombre_usuario, correo_electronico, rol FROM usuarios";

        try (Connection connection = dataSource.getConnection();
             PreparedStatement statement = connection.prepareStatement(sql);
             ResultSet resultSet = statement.executeQuery()) {

            while (resultSet.next()) {
                User usuario = new User();
                usuario.setUsername(resultSet.getString("nombre_usuario"));
                usuario.setEmail(resultSet.getString("correo_electronico"));
                usuario.setRole(resultSet.getString("rol"));
                usuarios.add(usuario);
            }
        }

        return usuarios;
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
