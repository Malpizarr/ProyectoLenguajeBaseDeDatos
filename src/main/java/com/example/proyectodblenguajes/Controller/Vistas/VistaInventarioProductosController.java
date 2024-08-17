package com.example.proyectodblenguajes.Controller.Vistas;

import com.example.proyectodblenguajes.Models.Vistas.VistaInventarioProductos;
import com.example.proyectodblenguajes.Service.Vistas.VistaInventarioProductosService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import java.sql.SQLException;
import java.util.List;

@RestController
@RequestMapping("/inventario-productos")
public class VistaInventarioProductosController {

    @Autowired
    private VistaInventarioProductosService vistaInventarioProductosService;

    @GetMapping
    public ResponseEntity<List<VistaInventarioProductos>> listarInventarioProductos() {
        try {
            List<VistaInventarioProductos> inventarioProductos = vistaInventarioProductosService.listarInventarioProductos();
            return new ResponseEntity<>(inventarioProductos, HttpStatus.OK);
        } catch (SQLException e) {
            return new ResponseEntity<>(HttpStatus.INTERNAL_SERVER_ERROR);
        }
    }
}
