package com.example.proyectodblenguajes.Service.Vistas;

import com.example.proyectodblenguajes.Models.Vistas.VistaProductosCategorias;
import com.example.proyectodblenguajes.DAOs.Vistas.VistaProductosCategoriasDao;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.sql.SQLException;
import java.util.List;

@Service
public class VistaProductosCategoriasService {

    @Autowired
    private VistaProductosCategoriasDao vistaProductosCategoriasDao;

    public List<VistaProductosCategorias> listarProductosCategorias() throws SQLException {
        return vistaProductosCategoriasDao.listarProductosCategorias();
    }
}
