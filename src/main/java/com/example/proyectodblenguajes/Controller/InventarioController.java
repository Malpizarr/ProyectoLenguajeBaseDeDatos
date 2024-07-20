package com.example.proyectodblenguajes.Controller;

import com.example.proyectodblenguajes.Models.Inventario;
import com.example.proyectodblenguajes.Models.Producto;
import com.example.proyectodblenguajes.Service.InventarioService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import java.sql.SQLException;

@RestController
@RequestMapping("/inventario")
public class InventarioController {

    @Autowired
    private InventarioService inventarioService;

    @PostMapping
    public ResponseEntity<Void> crearInventario(@RequestBody Inventario inventario) {
        try {
            inventarioService.crearInventario(inventario.getIdProducto(), inventario.getCantidad());
            return new ResponseEntity<>(HttpStatus.CREATED);
        } catch (SQLException e) {
            System.out.println("Error creando inventario: {}" + e.getMessage() + e);
            return new ResponseEntity<>(HttpStatus.INTERNAL_SERVER_ERROR);
        }
    }

    @GetMapping("/{idInventario}")
    public ResponseEntity<Inventario> obtenerInventario(@PathVariable int idInventario) {
        try {
            Inventario inventario = inventarioService.obtenerInventario(idInventario);
            return new ResponseEntity<>(inventario, HttpStatus.OK);
        } catch (SQLException e) {
            System.out.println("Error obteniendo inventario: {}" + e.getMessage() + e);
            return new ResponseEntity<>(HttpStatus.INTERNAL_SERVER_ERROR);
        }
    }

    @PutMapping("/{id}")
    public ResponseEntity<Void> actualizarInventario(@PathVariable int id, @RequestBody Inventario inventario) {
        try {
            inventario.setId(id);
            inventarioService.actualizarInventario(inventario);
            return new ResponseEntity<>(HttpStatus.OK);
        } catch (SQLException e) {
            return new ResponseEntity<>(HttpStatus.INTERNAL_SERVER_ERROR);
        }
    }

    @DeleteMapping("/{idInventario}")
    public ResponseEntity<Void> eliminarInventario(@PathVariable int idInventario) {
        try {
            inventarioService.eliminarInventario(idInventario);
            return new ResponseEntity<>(HttpStatus.OK);
        } catch (SQLException e) {
            return new ResponseEntity<>(HttpStatus.INTERNAL_SERVER_ERROR);
        }
    }
}
