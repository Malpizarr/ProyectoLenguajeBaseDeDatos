package com.example.proyectodblenguajes.DAOs.Vistas;

import com.example.proyectodblenguajes.Models.Vistas.VistaUsuariosPedidos;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.datasource.DataSourceUtils;
import org.springframework.stereotype.Repository;

import javax.sql.DataSource;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;

@Repository
public class VistaUsuariosPedidosDao {

    @Autowired
    private DataSource dbconfig;

    public List<VistaUsuariosPedidos> listarUsuariosPedidos() throws SQLException {
        List<VistaUsuariosPedidos> usuariosPedidos = new ArrayList<>();
        String sql = "SELECT * FROM VISTA_USUARIOS_PEDIDOS";

        try (Connection connection = DataSourceUtils.getConnection(dbconfig);
             Statement statement = connection.createStatement();
             ResultSet rs = statement.executeQuery(sql)) {

            while (rs.next()) {
                VistaUsuariosPedidos usuarioPedido = new VistaUsuariosPedidos();
                usuarioPedido.setIdUsuario(rs.getInt("id_usuario"));
                usuarioPedido.setNombreUsuario(rs.getString("nombre_usuario"));
                usuarioPedido.setIdPedido(rs.getInt("id_pedido"));
                usuarioPedido.setTotal(rs.getDouble("total"));
                usuarioPedido.setFechaCreacion(rs.getTimestamp("fecha_creacion"));
                usuariosPedidos.add(usuarioPedido);
            }
        }
        return usuariosPedidos;
    }
}
