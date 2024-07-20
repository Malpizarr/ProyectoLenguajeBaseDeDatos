package com.example.proyectodblenguajes.Service;

import com.example.proyectodblenguajes.DAOs.PedidoDao;
import com.example.proyectodblenguajes.Models.Pedido;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.sql.SQLException;

@Service
public class PedidoService {

    @Autowired
    private PedidoDao pedidoDao;

    public void crearPedido(int idUsuario, int idDireccion, double total, int idEstado) throws SQLException {
        pedidoDao.crearPedido(idUsuario, idDireccion, total, idEstado);
    }

    public Pedido obtenerPedido(int idPedido) throws SQLException {
        return pedidoDao.obtenerPedido(idPedido);
    }

    public void actualizarPedido(Pedido pedido) throws SQLException {
        pedidoDao.actualizarPedido(pedido);
    }

    public void eliminarPedido(int idPedido) throws SQLException {
        pedidoDao.eliminarPedido(idPedido);
    }
}
