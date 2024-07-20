package com.example.proyectodblenguajes.Controller;

import com.example.proyectodblenguajes.Models.Categoria;
import com.example.proyectodblenguajes.Service.CategoriaService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import java.sql.SQLException;

@RestController
@RequestMapping("/categorias")
public class CategoriaController {

    @Autowired
    private CategoriaService categoriaService;

    @PostMapping
    public ResponseEntity<Void> crearCategoria(@RequestBody Categoria categoria) {
        try {
            categoriaService.crearCategoria(categoria);
            return new ResponseEntity<>(HttpStatus.CREATED);
        } catch (SQLException e) {
            System.out.println("Error creando categoria: {}" + e.getMessage() + e);
            return new ResponseEntity<>(HttpStatus.INTERNAL_SERVER_ERROR);
        }
    }

    @GetMapping("/{id}")
    public ResponseEntity<Categoria> obtenerCategoria(@PathVariable int id) {
        try {
            Categoria categoria = categoriaService.obtenerCategoria(id);
            if (categoria != null) {
                return new ResponseEntity<>(categoria, HttpStatus.OK);
            } else {
                return new ResponseEntity<>(HttpStatus.NOT_FOUND);
            }
        } catch (SQLException e) {
            System.out.println("Error obteniendo categoria: {}" + e.getMessage() + e);
            return new ResponseEntity<>(HttpStatus.INTERNAL_SERVER_ERROR);
        }
    }

    @PutMapping("/{id}")
    public ResponseEntity<Void> actualizarCategoria(@PathVariable int id, @RequestBody Categoria categoria) {
        try {
            categoria.setId(id);
            categoriaService.actualizarCategoria(categoria);
            return new ResponseEntity<>(HttpStatus.OK);
        } catch (SQLException e) {
            System.out.println("Error actualizando categoria: {}" + e.getMessage() + e);
            return new ResponseEntity<>(HttpStatus.INTERNAL_SERVER_ERROR);
        }
    }

    @DeleteMapping("/{id}")
    public ResponseEntity<Void> eliminarCategoria(@PathVariable int id) {
        try {
            categoriaService.eliminarCategoria(id);
            return new ResponseEntity<>(HttpStatus.NO_CONTENT);
        } catch (SQLException e) {
            System.out.println("Error eliminando categoria: {}" + e.getMessage() + e);
            return new ResponseEntity<>(HttpStatus.INTERNAL_SERVER_ERROR);
        }
    }
}
