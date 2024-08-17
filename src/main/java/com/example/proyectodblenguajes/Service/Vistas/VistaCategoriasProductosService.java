package com.example.proyectodblenguajes.Service.Vistas;

import com.example.proyectodblenguajes.DAOs.Vistas.VistaCategoriasProductosDao;
import com.example.proyectodblenguajes.Models.Vistas.VistaCategoriasProductos;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class VistaCategoriasProductosService {

    @Autowired
    private VistaCategoriasProductosDao vistaCategoriasProductosDao;

    public List<VistaCategoriasProductos> obtenerVistaCategoriasProductos() {
        return vistaCategoriasProductosDao.obtenerVistaCategoriasProductos();
    }
}