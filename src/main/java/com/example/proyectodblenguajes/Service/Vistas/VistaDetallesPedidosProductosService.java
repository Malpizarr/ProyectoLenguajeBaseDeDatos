package com.example.proyectodblenguajes.Service.Vistas;

import com.example.proyectodblenguajes.DAOs.Vistas.VistaDetallesPedidosProductosDao;
import com.example.proyectodblenguajes.Models.Vistas.VistaDetallesPedidosProductos;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class VistaDetallesPedidosProductosService {

    @Autowired
    private VistaDetallesPedidosProductosDao vistaDetallesPedidosProductosDao;

    public List<VistaDetallesPedidosProductos> obtenerVistaDetallesPedidosProductos() {
        return vistaDetallesPedidosProductosDao.obtenerVistaDetallesPedidosProductos();
    }
}
