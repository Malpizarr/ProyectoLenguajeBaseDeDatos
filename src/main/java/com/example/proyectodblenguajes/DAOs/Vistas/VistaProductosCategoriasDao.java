package com.example.proyectodblenguajes.DAOs.Vistas;

import com.example.proyectodblenguajes.Models.Vistas.VistaProductosCategorias;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.datasource.DataSourceUtils;
import org.springframework.stereotype.Repository;

import javax.sql.DataSource;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;

@Repository
public class VistaProductosCategoriasDao {

    @Autowired
    private DataSource dbconfig;

    public List<VistaProductosCategorias> listarProductosCategorias() throws SQLException {
        List<VistaProductosCategorias> productosCategorias = new ArrayList<>();
        String sql = "SELECT * FROM VISTA_PRODUCTOS_CATEGORIAS";

        try (Connection connection = DataSourceUtils.getConnection(dbconfig);
             Statement statement = connection.createStatement();
             ResultSet rs = statement.executeQuery(sql)) {

            while (rs.next()) {
                VistaProductosCategorias productoCategoria = new VistaProductosCategorias();
                productoCategoria.setIdProducto(rs.getInt("id_producto"));
                productoCategoria.setNombre(rs.getString("nombre"));
                productoCategoria.setCategoria(rs.getString("categoria"));
                productoCategoria.setPrecio(rs.getDouble("precio"));
                productosCategorias.add(productoCategoria);
            }
        }
        return productosCategorias;
    }
}
