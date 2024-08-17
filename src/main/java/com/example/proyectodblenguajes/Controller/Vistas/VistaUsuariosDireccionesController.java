package com.example.proyectodblenguajes.Controller.Vistas;

import com.example.proyectodblenguajes.Models.Vistas.VistaUsuariosDirecciones;
import com.example.proyectodblenguajes.Service.Vistas.VistaUsuariosDireccionesService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import java.sql.SQLException;
import java.util.List;

@RestController
@RequestMapping("/usuarios-direcciones")
public class VistaUsuariosDireccionesController {

    @Autowired
    private VistaUsuariosDireccionesService vistaUsuariosDireccionesService;

    @GetMapping
    public ResponseEntity<List<VistaUsuariosDirecciones>> listarUsuariosDirecciones() {
        try {
            List<VistaUsuariosDirecciones> usuariosDirecciones = vistaUsuariosDireccionesService.listarUsuariosDirecciones();
            return new ResponseEntity<>(usuariosDirecciones, HttpStatus.OK);
        } catch (SQLException e) {
            return new ResponseEntity<>(HttpStatus.INTERNAL_SERVER_ERROR);
        }
    }
}
