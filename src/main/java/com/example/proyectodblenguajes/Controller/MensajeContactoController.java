package com.example.proyectodblenguajes.Controller;

import com.example.proyectodblenguajes.Models.MensajeContacto;
import com.example.proyectodblenguajes.Service.MensajeContactoService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import java.sql.SQLException;

@RestController
@RequestMapping("/mensajes-contacto")
public class MensajeContactoController {

    @Autowired
    private MensajeContactoService mensajeContactoService;

    @PostMapping
    public ResponseEntity<Void> crearMensajeContacto(@RequestBody MensajeContacto mensajeContacto) {
        try {
            mensajeContactoService.crearMensajeContacto(mensajeContacto);
            return new ResponseEntity<>(HttpStatus.CREATED);
        } catch (SQLException e) {
            System.out.println("Error creando mensaje de contacto: " + e.getMessage() + e);
            return new ResponseEntity<>(HttpStatus.INTERNAL_SERVER_ERROR);
        }
    }

    @GetMapping("/{id}")
    public ResponseEntity<MensajeContacto> obtenerMensajeContacto(@PathVariable int id) {
        try {
            MensajeContacto mensajeContacto = mensajeContactoService.obtenerMensajeContacto(id);
            if (mensajeContacto != null) {
                return new ResponseEntity<>(mensajeContacto, HttpStatus.OK);
            } else {
                return new ResponseEntity<>(HttpStatus.NOT_FOUND);
            }
        } catch (SQLException e) {
            System.out.println("Error obteniendo mensaje de contacto: " + e.getMessage() + e);
            return new ResponseEntity<>(HttpStatus.INTERNAL_SERVER_ERROR);
        }
    }

    @PutMapping("/{id}")
    public ResponseEntity<Void> actualizarMensajeContacto(@PathVariable int id, @RequestBody MensajeContacto mensajeContacto) {
        try {
            mensajeContacto.setId(id);
            mensajeContactoService.actualizarMensajeContacto(mensajeContacto);
            return new ResponseEntity<>(HttpStatus.OK);
        } catch (SQLException e) {
            System.out.println("Error actualizando mensaje de contacto: " + e.getMessage() + e);
            return new ResponseEntity<>(HttpStatus.INTERNAL_SERVER_ERROR);
        }
    }

    @DeleteMapping("/{id}")
    public ResponseEntity<Void> eliminarMensajeContacto(@PathVariable int id) {
        try {
            mensajeContactoService.eliminarMensajeContacto(id);
            return new ResponseEntity<>(HttpStatus.NO_CONTENT);
        } catch (SQLException e) {
            System.out.println("Error eliminando mensaje de contacto: " + e.getMessage() + e);
            return new ResponseEntity<>(HttpStatus.INTERNAL_SERVER_ERROR);
        }
    }
}
