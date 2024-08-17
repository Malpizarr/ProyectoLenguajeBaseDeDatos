package com.example.proyectodblenguajes.Service.Vistas;

import com.example.proyectodblenguajes.Models.Vistas.VistaPedidosUsuarios;
import com.example.proyectodblenguajes.DAOs.Vistas.VistaPedidosUsuariosDao;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.sql.SQLException;
import java.util.List;

@Service
public class VistaPedidosUsuariosService {

    @Autowired
    private VistaPedidosUsuariosDao vistaPedidosUsuariosDao;

    public List<VistaPedidosUsuarios> listarPedidosUsuarios() throws SQLException {
        return vistaPedidosUsuariosDao.listarPedidosUsuarios();
    }
}
