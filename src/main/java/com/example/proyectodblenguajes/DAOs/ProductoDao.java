package com.example.proyectodblenguajes.DAOs;

import com.example.proyectodblenguajes.Models.Producto;
import oracle.jdbc.OracleTypes;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.datasource.DataSourceUtils;
import org.springframework.stereotype.Repository;

import javax.sql.DataSource;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;

@Repository
public class ProductoDao {

    @Autowired
    private DataSource dbconfig;

    public void crearProducto(int idCategoria, String nombre, String descripcion, double precio) throws SQLException {
        String sql = "{call producto_pkg.crear_producto(?, ?, ?, ?)}";
        try (Connection connection = dbconfig.getConnection();
             CallableStatement callableStatement = connection.prepareCall(sql)) {
            callableStatement.setInt(1, idCategoria);
            callableStatement.setString(2, nombre);
            callableStatement.setString(3, descripcion);
            callableStatement.setDouble(4, precio);
            callableStatement.executeUpdate();
        }
    }

    public Producto obtenerProducto(int idProducto) throws SQLException {
        String sql = "{call producto_pkg.obtener_producto(?, ?, ?, ?, ?, ?)}";
        try (Connection connection = dbconfig.getConnection();
             CallableStatement callableStatement = connection.prepareCall(sql)) {
            callableStatement.setInt(1, idProducto);
            callableStatement.registerOutParameter(2, Types.INTEGER);
            callableStatement.registerOutParameter(3, Types.VARCHAR);
            callableStatement.registerOutParameter(4, Types.CLOB);
            callableStatement.registerOutParameter(5, Types.DECIMAL);
            callableStatement.registerOutParameter(6, Types.TIMESTAMP);
            callableStatement.execute();

            Producto producto = new Producto();
            producto.setId(idProducto);
            producto.setIdCategoria(callableStatement.getInt(2));
            producto.setNombre(callableStatement.getString(3));
            producto.setDescripcion(callableStatement.getString(4));
            producto.setPrecio(callableStatement.getDouble(5));
            producto.setFechaCreacion(callableStatement.getTimestamp(6));

            return producto;
        }
    }

    public void actualizarProducto(Producto producto) throws SQLException {
        String sql = "{call producto_pkg.actualizar_producto(?, ?, ?, ?, ?)}";
        try (Connection connection = dbconfig.getConnection();
             CallableStatement callableStatement = connection.prepareCall(sql)) {
            callableStatement.setInt(1, producto.getId());
            callableStatement.setInt(2, producto.getIdCategoria());
            callableStatement.setString(3, producto.getNombre());
            callableStatement.setString(4, producto.getDescripcion());
            callableStatement.setDouble(5, producto.getPrecio());
            callableStatement.executeUpdate();
        }
    }

    public void eliminarProducto(int idProducto) throws SQLException {
        String sql = "{call producto_pkg.eliminar_producto(?)}";
        try (Connection connection = dbconfig.getConnection();
             CallableStatement callableStatement = connection.prepareCall(sql)) {
            callableStatement.setInt(1, idProducto);
            callableStatement.executeUpdate();
        }
    }

    
    public List<Producto> listarTodosLosProductos() throws SQLException {
        List<Producto> productos = new ArrayList<>();
        String sql = "{call LISTAR_TODOS_LOS_PRODUCTOS(?)}";

        try (Connection connection = DataSourceUtils.getConnection(dbconfig);
             CallableStatement callableStatement = connection.prepareCall(sql)) {
            callableStatement.registerOutParameter(1, OracleTypes.CURSOR);
            callableStatement.execute();

            try (ResultSet rs = (ResultSet) callableStatement.getObject(1)) {
                while (rs.next()) {
                    Producto producto = new Producto();
                    producto.setId(rs.getInt("id_producto"));
                    producto.setNombre(rs.getString("nombre"));
                    producto.setDescripcion(rs.getString("descripcion"));
                    producto.setPrecio(rs.getDouble("precio"));
                    producto.setFechaCreacion(rs.getTimestamp("fecha_creacion"));
                    productos.add(producto);
                }
            }
        }
        return productos;
    }
}

