package com.example.proyectodblenguajes.Controller.Vistas;

import com.example.proyectodblenguajes.Models.Vistas.VistaTodosEstadosPedidos;
import com.example.proyectodblenguajes.Service.Vistas.VistaTodosEstadosPedidosService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import java.sql.SQLException;
import java.util.List;

@RestController
@RequestMapping("/estados-pedidos")
public class VistaTodosEstadosPedidosController {

    @Autowired
    private VistaTodosEstadosPedidosService vistaTodosEstadosPedidosService;

    @GetMapping
    public ResponseEntity<List<VistaTodosEstadosPedidos>> listarTodosEstadosPedidos() {
        try {
            List<VistaTodosEstadosPedidos> estadosPedidos = vistaTodosEstadosPedidosService.listarTodosEstadosPedidos();
            return new ResponseEntity<>(estadosPedidos, HttpStatus.OK);
        } catch (SQLException e) {
            return new ResponseEntity<>(HttpStatus.INTERNAL_SERVER_ERROR);
        }
    }
}
