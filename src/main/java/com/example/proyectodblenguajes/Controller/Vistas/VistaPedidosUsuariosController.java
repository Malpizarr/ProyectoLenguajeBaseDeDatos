package com.example.proyectodblenguajes.Controller.Vistas;

import com.example.proyectodblenguajes.Models.Vistas.VistaPedidosUsuarios;
import com.example.proyectodblenguajes.Service.Vistas.VistaPedidosUsuariosService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import java.sql.SQLException;
import java.util.List;

@RestController
@RequestMapping("/pedidos-usuarios")
public class VistaPedidosUsuariosController {

    @Autowired
    private VistaPedidosUsuariosService vistaPedidosUsuariosService;

    @GetMapping
    public ResponseEntity<List<VistaPedidosUsuarios>> listarPedidosUsuarios() {
        try {
            List<VistaPedidosUsuarios> pedidosUsuarios = vistaPedidosUsuariosService.listarPedidosUsuarios();
            return new ResponseEntity<>(pedidosUsuarios, HttpStatus.OK);
        } catch (SQLException e) {
            return new ResponseEntity<>(HttpStatus.INTERNAL_SERVER_ERROR);
        }
    }
}
