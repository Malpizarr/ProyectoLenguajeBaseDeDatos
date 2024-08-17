package com.example.proyectodblenguajes.Service.Vistas;

import com.example.proyectodblenguajes.Models.Vistas.VistaPedidosPorEstado;
import com.example.proyectodblenguajes.DAOs.Vistas.VistaPedidosPorEstadoDao;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.sql.SQLException;
import java.util.List;

@Service
public class VistaPedidosPorEstadoService {

    @Autowired
    private VistaPedidosPorEstadoDao vistaPedidosPorEstadoDao;

    public List<VistaPedidosPorEstado> listarPedidosPorEstado() throws SQLException {
        return vistaPedidosPorEstadoDao.listarPedidosPorEstado();
    }
}
