package com.example.proyectodblenguajes.Service.Vistas;

import com.example.proyectodblenguajes.Models.Vistas.VistaUsuariosPedidos;
import com.example.proyectodblenguajes.DAOs.Vistas.VistaUsuariosPedidosDao;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.sql.SQLException;
import java.util.List;

@Service
public class VistaUsuariosPedidosService {

    @Autowired
    private VistaUsuariosPedidosDao vistaUsuariosPedidosDao;

    public List<VistaUsuariosPedidos> listarUsuariosPedidos() throws SQLException {
        return vistaUsuariosPedidosDao.listarUsuariosPedidos();
    }
}
