package com.example.proyectodblenguajes.DAOs;

import com.example.proyectodblenguajes.Models.Categoria;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import javax.sql.DataSource;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;

@Repository
public class CategoriaDao {

    @Autowired
    private DataSource dbconfig;

    public void crearCategoria(String nombre, String descripcion) throws SQLException {
        String sql = "{call CREAR_CATEGORIA_PRODUCTO(?, ?)}";
        try (Connection connection = dbconfig.getConnection();
             CallableStatement callableStatement = connection.prepareCall(sql)) {
            callableStatement.setString(1, nombre);
            callableStatement.setString(2, descripcion);
            callableStatement.executeUpdate();
        }
    }
    public Categoria obtenerCategoria(int idCategoria) throws SQLException {
        String sql = "{call OBTENER_CATEGORIA_PRODUCTO(?, ?, ?, ?)}";
        try (Connection connection = dbconfig.getConnection();
             CallableStatement callableStatement = connection.prepareCall(sql)) {
            callableStatement.setInt(1, idCategoria);
            callableStatement.registerOutParameter(2, Types.VARCHAR);
            callableStatement.registerOutParameter(3, Types.CLOB);
            callableStatement.registerOutParameter(4, Types.TIMESTAMP);
            callableStatement.execute();

            Categoria categoria = new Categoria();
            categoria.setId(idCategoria);
            categoria.setNombre(callableStatement.getString(2));
            categoria.setDescripcion(callableStatement.getString(3));
            categoria.setFechaCreacion(callableStatement.getTimestamp(4));

            return categoria;
        }
    }

    public void actualizarCategoria(Categoria categoria) throws SQLException {
        String sql = "{call ACTUALIZAR_CATEGORIA_PRODUCTO(?, ?, ?)}";
        try (Connection connection = dbconfig.getConnection();
             CallableStatement callableStatement = connection.prepareCall(sql)) {
            callableStatement.setInt(1, categoria.getId());
            callableStatement.setString(2, categoria.getNombre());
            callableStatement.setString(3, categoria.getDescripcion());
            callableStatement.executeUpdate();
        }
    }

    public void eliminarCategoria(int idCategoria) throws SQLException {
        String sql = "{call ELIMINAR_CATEGORIA_PRODUCTO(?)}";
        try (Connection connection = dbconfig.getConnection();
             CallableStatement callableStatement = connection.prepareCall(sql)) {
            callableStatement.setInt(1, idCategoria);
            callableStatement.executeUpdate();
        }
    }

    public List<Categoria> listarTodasLasCategorias() throws SQLException {
        String sql = "{call LISTAR_TODAS_LAS_CATEGORIAS_PRODUCTOS(?)}";
        try (Connection connection = dbconfig.getConnection();
             CallableStatement callableStatement = connection.prepareCall(sql)) {

            callableStatement.registerOutParameter(1, Types.REF_CURSOR);
            callableStatement.execute();

            List<Categoria> categorias = new ArrayList<>();
            try (ResultSet rs = (ResultSet) callableStatement.getObject(1)) {
                while (rs.next()) {
                    Categoria categoria = new Categoria();
                    categoria.setId(rs.getInt("id_categoria"));
                    categoria.setNombre(rs.getString("nombre"));
                    categoria.setDescripcion(rs.getString("descripcion"));
                    categoria.setFechaCreacion(rs.getTimestamp("fecha_creacion"));
                    categorias.add(categoria);
                }
            }
            return categorias;
        }
    }
}
