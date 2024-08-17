package com.example.proyectodblenguajes.Controller.Vistas;

import com.example.proyectodblenguajes.Models.Vistas.VistaPedidosPorEstado;
import com.example.proyectodblenguajes.Service.Vistas.VistaPedidosPorEstadoService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import java.sql.SQLException;
import java.util.List;

@RestController
@RequestMapping("/pedidos-por-estado")
public class VistaPedidosPorEstadoController {

    @Autowired
    private VistaPedidosPorEstadoService vistaPedidosPorEstadoService;

    @GetMapping
    public ResponseEntity<List<VistaPedidosPorEstado>> listarPedidosPorEstado() {
        try {
            List<VistaPedidosPorEstado> pedidosPorEstado = vistaPedidosPorEstadoService.listarPedidosPorEstado();
            return new ResponseEntity<>(pedidosPorEstado, HttpStatus.OK);
        } catch (SQLException e) {
            return new ResponseEntity<>(HttpStatus.INTERNAL_SERVER_ERROR);
        }
    }
}
