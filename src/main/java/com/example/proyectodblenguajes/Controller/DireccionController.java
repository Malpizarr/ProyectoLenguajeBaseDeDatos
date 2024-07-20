package com.example.proyectodblenguajes.Controller;

import com.example.proyectodblenguajes.Models.Direccion;
import com.example.proyectodblenguajes.Service.DireccionService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import java.sql.SQLException;

@RestController
@RequestMapping("/direcciones")
public class DireccionController {

    @Autowired
    private DireccionService direccionService;

    @PostMapping
    public ResponseEntity<Void> crearDireccion(@RequestBody Direccion direccion) {
        try {
            direccionService.crearDireccion(direccion);
            return new ResponseEntity<>(HttpStatus.CREATED);
        } catch (SQLException e) {
            System.out.println("Error obteniendo direccion: {}" + e.getMessage() + e);
            return new ResponseEntity<>(HttpStatus.INTERNAL_SERVER_ERROR);
        }
    }

    @GetMapping("/{id}")
    public ResponseEntity<Direccion> obtenerDireccion(@PathVariable int id) {
        try {
            Direccion direccion = direccionService.obtenerDireccion(id);
            return new ResponseEntity<>(direccion, HttpStatus.OK);
        } catch (SQLException e) {
            return new ResponseEntity<>(HttpStatus.INTERNAL_SERVER_ERROR);
        }
    }

    @PutMapping("/{id}")
    public ResponseEntity<Void> actualizarDireccion(@PathVariable int id, @RequestBody Direccion direccion) {
        try {
            direccion.setId(id);
            direccionService.actualizarDireccion(direccion);
            return new ResponseEntity<>(HttpStatus.OK);
        } catch (SQLException e) {
            return new ResponseEntity<>(HttpStatus.INTERNAL_SERVER_ERROR);
        }
    }

    @DeleteMapping("/{id}")
    public ResponseEntity<Void> eliminarDireccion(@PathVariable int id) {
        try {
            direccionService.eliminarDireccion(id);
            return new ResponseEntity<>(HttpStatus.NO_CONTENT);
        } catch (SQLException e) {
            return new ResponseEntity<>(HttpStatus.INTERNAL_SERVER_ERROR);
        }
    }
}
