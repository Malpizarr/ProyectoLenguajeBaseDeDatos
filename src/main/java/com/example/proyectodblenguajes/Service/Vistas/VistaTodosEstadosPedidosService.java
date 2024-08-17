package com.example.proyectodblenguajes.Service.Vistas;

import com.example.proyectodblenguajes.Models.Vistas.VistaTodosEstadosPedidos;
import com.example.proyectodblenguajes.DAOs.Vistas.VistaTodosEstadosPedidosDao;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.sql.SQLException;
import java.util.List;

@Service
public class VistaTodosEstadosPedidosService {

    @Autowired
    private VistaTodosEstadosPedidosDao vistaTodosEstadosPedidosDao;

    public List<VistaTodosEstadosPedidos> listarTodosEstadosPedidos() throws SQLException {
        return vistaTodosEstadosPedidosDao.listarTodosEstadosPedidos();
    }
}
