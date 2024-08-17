package com.example.proyectodblenguajes.Controller.Vistas;

import com.example.proyectodblenguajes.Models.Vistas.VistaDetallesPedidosProductos;
import com.example.proyectodblenguajes.Service.Vistas.VistaDetallesPedidosProductosService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import java.util.List;

@RestController
@RequestMapping("/vista-detalles-pedidos-productos")
public class VistaDetallesPedidosProductosController {

    @Autowired
    private VistaDetallesPedidosProductosService vistaDetallesPedidosProductosService;

    @GetMapping
    public ResponseEntity<List<VistaDetallesPedidosProductos>> obtenerVistaDetallesPedidosProductos() {
        try {
            List<VistaDetallesPedidosProductos> vista = vistaDetallesPedidosProductosService.obtenerVistaDetallesPedidosProductos();
            return new ResponseEntity<>(vista, HttpStatus.OK);
        } catch (Exception e) {
            return new ResponseEntity<>(HttpStatus.INTERNAL_SERVER_ERROR);
        }
    }
}
