package com.example.proyectodblenguajes.DAOs.Vistas;

import com.example.proyectodblenguajes.Models.Vistas.VistaCategoriasProductos;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.RowMapper;
import org.springframework.jdbc.core.namedparam.NamedParameterJdbcTemplate;
import org.springframework.stereotype.Repository;

import javax.sql.DataSource;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;

@Repository
public class VistaCategoriasProductosDao {

    private NamedParameterJdbcTemplate jdbcTemplate;

    @Autowired
    public VistaCategoriasProductosDao(DataSource dataSource) {
        this.jdbcTemplate = new NamedParameterJdbcTemplate(dataSource);
    }

    public List<VistaCategoriasProductos> obtenerVistaCategoriasProductos() {
        String sql = "SELECT * FROM VISTA_CATEGORIAS_PRODUCTOS";
        return jdbcTemplate.query(sql, new RowMapper<VistaCategoriasProductos>() {
            @Override
            public VistaCategoriasProductos mapRow(ResultSet rs, int rowNum) throws SQLException {
                VistaCategoriasProductos vista = new VistaCategoriasProductos();
                vista.setIdCategoria(rs.getInt("id_categoria"));
                vista.setCategoria(rs.getString("categoria"));
                vista.setProducto(rs.getString("producto"));
                vista.setPrecio(rs.getDouble("precio"));
                return vista;
            }
        });
    }
}
