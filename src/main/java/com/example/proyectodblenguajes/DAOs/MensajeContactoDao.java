package com.example.proyectodblenguajes.DAOs;

import com.example.proyectodblenguajes.Models.MensajeContacto;
import com.example.proyectodblenguajes.Models.Pedido;
import com.example.proyectodblenguajes.Models.Producto;
import com.example.proyectodblenguajes.Models.Usuario;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import javax.sql.DataSource;
import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.SQLException;
import java.sql.Types;


@Repository
public class MensajeContactoDao{

    @Autowired
    private DataSource dbconfig;

    public void crearMensajeContacto(int idUsuario, String mensaje) throws SQLException {
        String sql = "{call mensaje_contacto_pkg.crear_mensaje_contacto(?, ?)}";
        try (Connection connection = dbconfig.getConnection();
             CallableStatement callableStatement = connection.prepareCall(sql)) {
            callableStatement.setInt(1, idUsuario);
            callableStatement.setString(2, mensaje);
            callableStatement.executeUpdate();
        }
    }

    public MensajeContacto obtenerMensajeContacto(int idMensaje) throws SQLException {
        String sql = "{call mensaje_contacto_pkg.obtener_mensaje_contacto(?, ?, ?, ?)}";
        try (Connection connection = dbconfig.getConnection();
             CallableStatement callableStatement = connection.prepareCall(sql)) {
            callableStatement.setInt(1, idMensaje);
            callableStatement.registerOutParameter(2, Types.INTEGER);
            callableStatement.registerOutParameter(3, Types.CLOB);
            callableStatement.registerOutParameter(4, Types.TIMESTAMP);
            callableStatement.execute();

            MensajeContacto mensajeContacto = new MensajeContacto();
            mensajeContacto.setId(idMensaje);
            mensajeContacto.setIdUsuario(callableStatement.getInt(2));
            mensajeContacto.setMensaje(callableStatement.getString(3));
            mensajeContacto.setFechaCreacion(callableStatement.getTimestamp(4));

            return mensajeContacto;
        }
    }

    public void actualizarMensajeContacto(MensajeContacto mensajeContacto) throws SQLException {
        String sql = "{call mensaje_contacto_pkg.actualizar_mensaje_contacto(?, ?, ?)}";
        try (Connection connection = dbconfig.getConnection();
             CallableStatement callableStatement = connection.prepareCall(sql)) {
            callableStatement.setInt(1, mensajeContacto.getId());
            callableStatement.setInt(2, mensajeContacto.getIdUsuario());
            callableStatement.setString(3, mensajeContacto.getMensaje());
            callableStatement.executeUpdate();
        }
    }

    public void eliminarMensajeContacto(int idMensaje) throws SQLException {
        String sql = "{call mensaje_contacto_pkg.eliminar_mensaje_contacto(?)}";
        try (Connection connection = dbconfig.getConnection();
             CallableStatement callableStatement = connection.prepareCall(sql)) {
            callableStatement.setInt(1, idMensaje);
            callableStatement.executeUpdate();
        }
    }
}
