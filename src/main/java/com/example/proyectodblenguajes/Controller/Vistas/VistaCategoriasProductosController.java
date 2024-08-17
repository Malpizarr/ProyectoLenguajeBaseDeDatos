package com.example.proyectodblenguajes.Controller.Vistas;

import com.example.proyectodblenguajes.Models.Vistas.VistaCategoriasProductos;
import com.example.proyectodblenguajes.Service.Vistas.VistaCategoriasProductosService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import java.util.List;

@RestController
@RequestMapping("/vista-categorias-productos")
public class VistaCategoriasProductosController {

    @Autowired
    private VistaCategoriasProductosService vistaCategoriasProductosService;

    @GetMapping
    public ResponseEntity<List<VistaCategoriasProductos>> obtenerVistaCategoriasProductos() {
        try {
            List<VistaCategoriasProductos> vista = vistaCategoriasProductosService.obtenerVistaCategoriasProductos();
            return new ResponseEntity<>(vista, HttpStatus.OK);
        } catch (Exception e) {
            return new ResponseEntity<>(HttpStatus.INTERNAL_SERVER_ERROR);
        }
    }
}
