package com.example.proyectodblenguajes.Controller;

import com.example.proyectodblenguajes.Models.Producto;
import com.example.proyectodblenguajes.Service.ProductoService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import java.sql.SQLException;

@RestController
@RequestMapping("/producto")
public class ProductoController {

    @Autowired
    private ProductoService productoService;

    @PostMapping
    public ResponseEntity<Void> crearProducto(@RequestBody Producto producto) {
        try {
            productoService.crearProducto(producto.getIdCategoria(), producto.getNombre(), producto.getDescripcion(), producto.getPrecio());
            return new ResponseEntity<>(HttpStatus.CREATED);
        } catch (SQLException e) {
            System.out.println("Error creando producto: {}" + e.getMessage() + e);
            return new ResponseEntity<>(HttpStatus.INTERNAL_SERVER_ERROR);
        }
    }

    @GetMapping("/{idProducto}")
    public ResponseEntity<Producto> obtenerProducto(@PathVariable int idProducto) {
        try {
            Producto producto = productoService.obtenerProducto(idProducto);
            return new ResponseEntity<>(producto, HttpStatus.OK);
        } catch (SQLException e) {
            System.out.println("Error obteniendo producto: {}" + e.getMessage() + e);
            return new ResponseEntity<>(HttpStatus.INTERNAL_SERVER_ERROR);
        }
    }

    @PutMapping("/{id}")
    public ResponseEntity<Void> actualizarProducto(@PathVariable int id, @RequestBody Producto producto) {
        try {
            producto.setId(id);
            productoService.actualizarProducto(producto);
            return new ResponseEntity<>(HttpStatus.OK);
        } catch (SQLException e) {
            System.out.println("Error actualizando producto: {}" + e.getMessage() + e);
            return new ResponseEntity<>(HttpStatus.INTERNAL_SERVER_ERROR);
        }
    }

    @DeleteMapping("/{idProducto}")
    public ResponseEntity<Void> eliminarProducto(@PathVariable int idProducto) {
        try {
            productoService.eliminarProducto(idProducto);
            return new ResponseEntity<>(HttpStatus.NO_CONTENT);
        } catch (SQLException e) {
            System.out.println("Error eliminando producto: {}" + e.getMessage() + e);
            return new ResponseEntity<>(HttpStatus.INTERNAL_SERVER_ERROR);
        }
    }
}
