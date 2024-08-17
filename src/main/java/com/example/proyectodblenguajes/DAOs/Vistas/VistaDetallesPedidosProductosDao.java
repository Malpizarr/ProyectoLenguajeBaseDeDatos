package com.example.proyectodblenguajes.DAOs.Vistas;

import com.example.proyectodblenguajes.Models.Vistas.VistaDetallesPedidosProductos;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.RowMapper;
import org.springframework.jdbc.core.namedparam.NamedParameterJdbcTemplate;
import org.springframework.stereotype.Repository;

import javax.sql.DataSource;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;

@Repository
public class VistaDetallesPedidosProductosDao {

    private NamedParameterJdbcTemplate jdbcTemplate;

    @Autowired
    public VistaDetallesPedidosProductosDao(DataSource dataSource) {
        this.jdbcTemplate = new NamedParameterJdbcTemplate(dataSource);
    }

    public List<VistaDetallesPedidosProductos> obtenerVistaDetallesPedidosProductos() {
        String sql = "SELECT * FROM VISTA_DETALLES_PEDIDOS_PRODUCTOS";
        return jdbcTemplate.query(sql, new RowMapper<VistaDetallesPedidosProductos>() {
            @Override
            public VistaDetallesPedidosProductos mapRow(ResultSet rs, int rowNum) throws SQLException {
                VistaDetallesPedidosProductos vista = new VistaDetallesPedidosProductos();
                vista.setIdDetalle(rs.getInt("id_detalle"));
                vista.setProducto(rs.getString("producto"));
                vista.setCantidad(rs.getInt("cantidad"));
                vista.setPrecio(rs.getDouble("precio"));
                return vista;
            }
        });
    }
}
