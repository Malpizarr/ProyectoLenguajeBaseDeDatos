package com.example.proyectodblenguajes.Controller;

import com.example.proyectodblenguajes.Models.Pedido;
import com.example.proyectodblenguajes.Service.PedidoService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import java.sql.SQLException;

@RestController
@RequestMapping("/pedidos")
public class PedidoController {

    @Autowired
    private PedidoService pedidoService;

    @PostMapping
    public ResponseEntity<Void> crearPedido(@RequestBody Pedido pedido) {
        try {
            pedidoService.crearPedido(pedido.getIdUsuario(), pedido.getIdDireccion(), pedido.getTotal(), pedido.getIdEstado());
            return new ResponseEntity<>(HttpStatus.CREATED);
        } catch (SQLException e) {
            System.out.println("Error creando pedido: {}" + e.getMessage() + e);
            return new ResponseEntity<>(HttpStatus.INTERNAL_SERVER_ERROR);
        }
    }

    @GetMapping("/{idPedido}")
    public ResponseEntity<Pedido> obtenerPedido(@PathVariable int idPedido) {
        try {
            Pedido pedido = pedidoService.obtenerPedido(idPedido);
            return new ResponseEntity<>(pedido, HttpStatus.OK);
        } catch (SQLException e) {
            System.out.println("Error obteniendo pedido: {}" + e.getMessage() + e);
            return new ResponseEntity<>(HttpStatus.INTERNAL_SERVER_ERROR);
        }
    }

    @PutMapping("/{id}")
    public ResponseEntity<Void> actualizarPedido(@PathVariable int id, @RequestBody Pedido pedido) {
        try {
            pedido.setId(id);
            pedidoService.actualizarPedido(pedido);
            return new ResponseEntity<>(HttpStatus.OK);
        } catch (SQLException e) {
            System.out.println("Error actualizando pedido: {}" + e.getMessage() + e);
            return new ResponseEntity<>(HttpStatus.INTERNAL_SERVER_ERROR);
        }
    }

    @DeleteMapping("/{idPedido}")
    public ResponseEntity<Void> eliminarPedido(@PathVariable int idPedido) {
        try {
            pedidoService.eliminarPedido(idPedido);
            return new ResponseEntity<>(HttpStatus.NO_CONTENT);
        } catch (SQLException e) {
            System.out.println("Error eliminando pedido: {}" + e.getMessage() + e);
            return new ResponseEntity<>(HttpStatus.INTERNAL_SERVER_ERROR);
        }
    }
}
