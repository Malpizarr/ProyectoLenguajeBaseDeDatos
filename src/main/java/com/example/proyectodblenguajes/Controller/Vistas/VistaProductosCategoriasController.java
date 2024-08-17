package com.example.proyectodblenguajes.Controller.Vistas;

import com.example.proyectodblenguajes.Models.Vistas.VistaProductosCategorias;
import com.example.proyectodblenguajes.Service.Vistas.VistaProductosCategoriasService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import java.sql.SQLException;
import java.util.List;

@RestController
@RequestMapping("/productos-categorias")
public class VistaProductosCategoriasController {

    @Autowired
    private VistaProductosCategoriasService vistaProductosCategoriasService;

    @GetMapping
    public ResponseEntity<List<VistaProductosCategorias>> listarProductosCategorias() {
        try {
            List<VistaProductosCategorias> productosCategorias = vistaProductosCategoriasService.listarProductosCategorias();
            return new ResponseEntity<>(productosCategorias, HttpStatus.OK);
        } catch (SQLException e) {
            return new ResponseEntity<>(HttpStatus.INTERNAL_SERVER_ERROR);
        }
    }
}
