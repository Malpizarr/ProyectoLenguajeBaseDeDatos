package com.example.proyectodblenguajes.Controller.Vistas;

import com.example.proyectodblenguajes.Models.Vistas.VistaUsuariosPedidos;
import com.example.proyectodblenguajes.Service.Vistas.VistaUsuariosPedidosService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import java.sql.SQLException;
import java.util.List;

@RestController
@RequestMapping("/usuarios-pedidos")
public class VistaUsuariosPedidosController {

    @Autowired
    private VistaUsuariosPedidosService vistaUsuariosPedidosService;

    @GetMapping
    public ResponseEntity<List<VistaUsuariosPedidos>> listarUsuariosPedidos() {
        try {
            List<VistaUsuariosPedidos> usuariosPedidos = vistaUsuariosPedidosService.listarUsuariosPedidos();
            return new ResponseEntity<>(usuariosPedidos, HttpStatus.OK);
        } catch (SQLException e) {
            return new ResponseEntity<>(HttpStatus.INTERNAL_SERVER_ERROR);
        }
    }
}
