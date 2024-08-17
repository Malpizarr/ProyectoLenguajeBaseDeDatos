package com.example.proyectodblenguajes.DAOs.Vistas;

import com.example.proyectodblenguajes.Models.Vistas.VistaMensajesContactoUsuarios;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.datasource.DataSourceUtils;
import org.springframework.stereotype.Repository;

import javax.sql.DataSource;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;

@Repository
public class VistaMensajesContactoUsuariosDao {

    @Autowired
    private DataSource dbconfig;

    public List<VistaMensajesContactoUsuarios> listarMensajesContactoUsuarios() throws SQLException {
        List<VistaMensajesContactoUsuarios> mensajesContactoUsuarios = new ArrayList<>();
        String sql = "SELECT * FROM VISTA_MENSAJES_CONTACTO_USUARIOS";

        try (Connection connection = DataSourceUtils.getConnection(dbconfig);
             Statement statement = connection.createStatement();
             ResultSet rs = statement.executeQuery(sql)) {

            while (rs.next()) {
                VistaMensajesContactoUsuarios mensajeContacto = new VistaMensajesContactoUsuarios();
                mensajeContacto.setIdMensaje(rs.getInt("id_mensaje"));
                mensajeContacto.setNombreUsuario(rs.getString("nombre_usuario"));
                mensajeContacto.setMensaje(rs.getString("mensaje"));
                mensajeContacto.setFechaCreacion(rs.getTimestamp("fecha_creacion"));
                mensajesContactoUsuarios.add(mensajeContacto);
            }
        }
        return mensajesContactoUsuarios;
    }
}
