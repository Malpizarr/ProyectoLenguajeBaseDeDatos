package com.example.proyectodblenguajes.Service.Vistas;

import com.example.proyectodblenguajes.Models.Vistas.VistaInventarioProductos;
import com.example.proyectodblenguajes.DAOs.Vistas.VistaInventarioProductosDao;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.sql.SQLException;
import java.util.List;

@Service
public class VistaInventarioProductosService {

    @Autowired
    private VistaInventarioProductosDao vistaInventarioProductosDao;

    public List<VistaInventarioProductos> listarInventarioProductos() throws SQLException {
        return vistaInventarioProductosDao.listarInventarioProductos();
    }
}
