package com.example.proyectodblenguajes.DAOs.Vistas;

import com.example.proyectodblenguajes.Models.Vistas.VistaPedidosUsuarios;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.datasource.DataSourceUtils;
import org.springframework.stereotype.Repository;

import javax.sql.DataSource;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;

@Repository
public class VistaPedidosUsuariosDao {

    @Autowired
    private DataSource dbconfig;

    public List<VistaPedidosUsuarios> listarPedidosUsuarios() throws SQLException {
        List<VistaPedidosUsuarios> pedidosUsuarios = new ArrayList<>();
        String sql = "SELECT * FROM VISTA_PEDIDOS_USUARIOS";

        try (Connection connection = DataSourceUtils.getConnection(dbconfig);
             Statement statement = connection.createStatement();
             ResultSet rs = statement.executeQuery(sql)) {

            while (rs.next()) {
                VistaPedidosUsuarios pedidoUsuario = new VistaPedidosUsuarios();
                pedidoUsuario.setIdPedido(rs.getInt("id_pedido"));
                pedidoUsuario.setNombreUsuario(rs.getString("nombre_usuario"));
                pedidoUsuario.setTotal(rs.getDouble("total"));
                pedidoUsuario.setFechaCreacion(rs.getTimestamp("fecha_creacion"));
                pedidosUsuarios.add(pedidoUsuario);
            }
        }
        return pedidosUsuarios;
    }
}
