package com.example.proyectodblenguajes.DAOs.Vistas;

import com.example.proyectodblenguajes.Models.Vistas.VistaUsuariosDirecciones;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.datasource.DataSourceUtils;
import org.springframework.stereotype.Repository;

import javax.sql.DataSource;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;

@Repository
public class VistaUsuariosDireccionesDao {

    @Autowired
    private DataSource dbconfig;

    public List<VistaUsuariosDirecciones> listarUsuariosDirecciones() throws SQLException {
        List<VistaUsuariosDirecciones> usuariosDirecciones = new ArrayList<>();
        String sql = "SELECT * FROM VISTA_USUARIOS_DIRECCIONES";

        try (Connection connection = DataSourceUtils.getConnection(dbconfig);
             Statement statement = connection.createStatement();
             ResultSet rs = statement.executeQuery(sql)) {

            while (rs.next()) {
                VistaUsuariosDirecciones usuarioDireccion = new VistaUsuariosDirecciones();
                usuarioDireccion.setIdUsuario(rs.getInt("id_usuario"));
                usuarioDireccion.setNombreUsuario(rs.getString("nombre_usuario"));
                usuarioDireccion.setDireccionLinea1(rs.getString("direccion_linea1"));
                usuarioDireccion.setCiudad(rs.getString("ciudad"));
                usuarioDireccion.setEstado(rs.getString("estado"));
                usuarioDireccion.setPais(rs.getString("pais"));
                usuariosDirecciones.add(usuarioDireccion);
            }
        }
        return usuariosDirecciones;
    }
}
