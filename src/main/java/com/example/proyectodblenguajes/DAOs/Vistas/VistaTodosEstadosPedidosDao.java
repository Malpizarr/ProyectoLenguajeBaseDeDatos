package com.example.proyectodblenguajes.DAOs.Vistas;

import com.example.proyectodblenguajes.Models.Vistas.VistaTodosEstadosPedidos;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.datasource.DataSourceUtils;
import org.springframework.stereotype.Repository;

import javax.sql.DataSource;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;

@Repository
public class VistaTodosEstadosPedidosDao {

    @Autowired
    private DataSource dbconfig;

    public List<VistaTodosEstadosPedidos> listarTodosEstadosPedidos() throws SQLException {
        List<VistaTodosEstadosPedidos> estadosPedidos = new ArrayList<>();
        String sql = "SELECT * FROM VISTA_TODOS_ESTADOS_PEDIDOS";

        try (Connection connection = DataSourceUtils.getConnection(dbconfig);
             Statement statement = connection.createStatement();
             ResultSet rs = statement.executeQuery(sql)) {

            while (rs.next()) {
                VistaTodosEstadosPedidos estadoPedido = new VistaTodosEstadosPedidos();
                estadoPedido.setIdEstado(rs.getInt("id_estado"));
                estadoPedido.setNombreEstado(rs.getString("nombre_estado"));
                estadoPedido.setIdPedido(rs.getInt("id_pedido"));
                estadoPedido.setTotal(rs.getDouble("total"));
                estadoPedido.setFechaCreacion(rs.getTimestamp("fecha_creacion"));
                estadosPedidos.add(estadoPedido);
            }
        }
        return estadosPedidos;
    }
}
