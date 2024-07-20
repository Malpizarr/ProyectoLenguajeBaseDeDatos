package com.example.proyectodblenguajes.DAOs;

import com.example.proyectodblenguajes.Models.Inventario;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import javax.sql.DataSource;
import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.SQLException;
import java.sql.Types;


@Repository
public class InventarioDao {

    @Autowired
    private DataSource dbconfig;

    public void crearInventario(int idProducto, int cantidad) throws SQLException {
        String sql = "{call inventario_pkg.crear_inventario(?, ?)}";
        try (Connection connection = dbconfig.getConnection();
             CallableStatement callableStatement = connection.prepareCall(sql)) {
            callableStatement.setInt(1, idProducto);
            callableStatement.setInt(2, cantidad);
            callableStatement.executeUpdate();
        }
    }

    public Inventario obtenerInventario(int idInventario) throws SQLException {
        String sql = "{call inventario_pkg.obtener_inventario(?, ?, ?, ?)}";
        try (Connection connection = dbconfig.getConnection();
             CallableStatement callableStatement = connection.prepareCall(sql)) {
            callableStatement.setInt(1, idInventario);
            callableStatement.registerOutParameter(2, Types.INTEGER);
            callableStatement.registerOutParameter(3, Types.INTEGER);
            callableStatement.registerOutParameter(4, Types.TIMESTAMP);
            callableStatement.execute();

            Inventario inventario = new Inventario();
            inventario.setId(idInventario);
            inventario.setIdProducto(callableStatement.getInt(2));
            inventario.setCantidad(callableStatement.getInt(3));
            inventario.setUltimaActualizacion(callableStatement.getTimestamp(4));

            return inventario;
        }
    }

    public void actualizarInventario(Inventario inventario) throws SQLException {
        String sql = "{call inventario_pkg.actualizar_inventario(?, ?, ?)}";
        try (Connection connection = dbconfig.getConnection();
             CallableStatement callableStatement = connection.prepareCall(sql)) {
            callableStatement.setInt(1, inventario.getId());
            callableStatement.setInt(2, inventario.getIdProducto());
            callableStatement.setInt(3, inventario.getCantidad());
            callableStatement.executeUpdate();
        }
    }

    public void eliminarInventario(int idInventario) throws SQLException {
        String sql = "{call inventario_pkg.eliminar_inventario(?)}";
        try (Connection connection = dbconfig.getConnection();
             CallableStatement callableStatement = connection.prepareCall(sql)) {
            callableStatement.setInt(1, idInventario);
            callableStatement.executeUpdate();
        }
    }
}
