package com.example.proyectodblenguajes.DAOs;


import com.example.proyectodblenguajes.Models.Pedido;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;


import javax.sql.DataSource;
import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.SQLException;
import java.sql.Types;


@Repository
public class PedidoDao {


    @Autowired
    private DataSource dataSource;


    public int crearPedido(int idUsuario, int idDireccion, double total, int idEstado) throws SQLException {
        String sql = "{call pedido_pkg.crear_pedido(?, ?, ?, ?, ?)}";
        try (Connection connection = dataSource.getConnection();
             CallableStatement callableStatement = connection.prepareCall(sql)) {


            callableStatement.setInt(1, idUsuario);
            callableStatement.setInt(2, idDireccion);
            callableStatement.setDouble(3, total);
            callableStatement.setInt(4, idEstado);
            callableStatement.registerOutParameter(5, java.sql.Types.INTEGER);


            callableStatement.executeUpdate();


            int idPedido = callableStatement.getInt(5);
            return idPedido;
        }
    }




    public Pedido obtenerPedido(int idPedido) throws SQLException {
        String sql = "{call pedido_pkg.obtener_pedido(?, ?, ?, ?, ?, ?)}";
        try (Connection connection = dataSource.getConnection();
             CallableStatement callableStatement = connection.prepareCall(sql)) {
            callableStatement.setInt(1, idPedido);
            callableStatement.registerOutParameter(2, Types.INTEGER);
            callableStatement.registerOutParameter(3, Types.INTEGER);
            callableStatement.registerOutParameter(4, Types.DECIMAL);
            callableStatement.registerOutParameter(5, Types.INTEGER);
            callableStatement.registerOutParameter(6, Types.TIMESTAMP);
            callableStatement.execute();


            Pedido pedido = new Pedido();
            pedido.setId(idPedido);
            pedido.setIdUsuario(callableStatement.getInt(2));
            pedido.setIdDireccion(callableStatement.getInt(3));
            pedido.setTotal(callableStatement.getDouble(4));
            pedido.setIdEstado(callableStatement.getInt(5));
            pedido.setFechaCreacion(callableStatement.getTimestamp(6));


            return pedido;
        }
    }


    public void crearDetallePedido(int idPedido, int idProducto, int cantidad, double precio) throws SQLException {
        String sql = "{call CREAR_DETALLE_PEDIDO(?, ?, ?, ?)}";
        try (Connection connection = dataSource.getConnection();
             CallableStatement callableStatement = connection.prepareCall(sql)) {


            callableStatement.setInt(1, idPedido);
            callableStatement.setInt(2, idProducto);
            callableStatement.setInt(3, cantidad);
            callableStatement.setDouble(4, precio);


            callableStatement.executeUpdate();
        }
    }


    public void actualizarPedido(Pedido pedido) throws SQLException {
        String sql = "{call pedido_pkg.actualizar_pedido(?, ?, ?, ?, ?)}";
        try (Connection connection = dataSource.getConnection();
             CallableStatement callableStatement = connection.prepareCall(sql)) {
            callableStatement.setInt(1, pedido.getId());
            callableStatement.setInt(2, pedido.getIdUsuario());
            callableStatement.setInt(3, pedido.getIdDireccion());
            callableStatement.setDouble(4, pedido.getTotal());
            callableStatement.setInt(5, pedido.getIdEstado());
            callableStatement.executeUpdate();
        }
    }


    public void eliminarPedido(int idPedido) throws SQLException {
        String sql = "{call pedido_pkg.eliminar_pedido(?)}";
        try (Connection connection = dataSource.getConnection();
             CallableStatement callableStatement = connection.prepareCall(sql)) {
            callableStatement.setInt(1, idPedido);
            callableStatement.executeUpdate();
        }
    }
}



