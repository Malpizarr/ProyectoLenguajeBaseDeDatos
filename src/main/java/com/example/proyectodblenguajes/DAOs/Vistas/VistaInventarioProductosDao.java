package com.example.proyectodblenguajes.DAOs.Vistas;

import com.example.proyectodblenguajes.Models.Vistas.VistaInventarioProductos;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.datasource.DataSourceUtils;
import org.springframework.stereotype.Repository;

import javax.sql.DataSource;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;

@Repository
public class VistaInventarioProductosDao {

    @Autowired
    private DataSource dbconfig;

    public List<VistaInventarioProductos> listarInventarioProductos() throws SQLException {
        List<VistaInventarioProductos> inventarioProductos = new ArrayList<>();
        String sql = "SELECT * FROM VISTA_INVENTARIO_PRODUCTOS";

        try (Connection connection = DataSourceUtils.getConnection(dbconfig);
             Statement statement = connection.createStatement();
             ResultSet rs = statement.executeQuery(sql)) {

            while (rs.next()) {
                VistaInventarioProductos inventario = new VistaInventarioProductos();
                inventario.setIdInventario(rs.getInt("id_inventario"));
                inventario.setProducto(rs.getString("producto"));
                inventario.setCantidad(rs.getInt("cantidad"));
                inventario.setUltimaActualizacion(rs.getTimestamp("ultima_actualizacion"));
                inventarioProductos.add(inventario);
            }
        }
        return inventarioProductos;
    }
}
