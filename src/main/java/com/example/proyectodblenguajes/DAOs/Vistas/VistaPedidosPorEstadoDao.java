package com.example.proyectodblenguajes.DAOs.Vistas;

import com.example.proyectodblenguajes.Models.Vistas.VistaPedidosPorEstado;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.datasource.DataSourceUtils;
import org.springframework.stereotype.Repository;

import javax.sql.DataSource;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;

@Repository
public class VistaPedidosPorEstadoDao {

    @Autowired
    private DataSource dbconfig;

    public List<VistaPedidosPorEstado> listarPedidosPorEstado() throws SQLException {
        List<VistaPedidosPorEstado> pedidosPorEstado = new ArrayList<>();
        String sql = "SELECT * FROM VISTA_PEDIDOS_POR_ESTADO";

        try (Connection connection = DataSourceUtils.getConnection(dbconfig);
             Statement statement = connection.createStatement();
             ResultSet rs = statement.executeQuery(sql)) {

            while (rs.next()) {
                VistaPedidosPorEstado pedidoEstado = new VistaPedidosPorEstado();
                pedidoEstado.setIdPedido(rs.getInt("id_pedido"));
                pedidoEstado.setTotal(rs.getDouble("total"));
                pedidoEstado.setNombreEstado(rs.getString("nombre_estado"));
                pedidosPorEstado.add(pedidoEstado);
            }
        }
        return pedidosPorEstado;
    }
}
