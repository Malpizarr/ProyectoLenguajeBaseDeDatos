package com.example.proyectodblenguajes.Controller;

import com.example.proyectodblenguajes.Models.DetallePedido;
import com.example.proyectodblenguajes.Models.Pedido;
import com.example.proyectodblenguajes.Service.PedidoService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import java.sql.SQLException;
import java.util.HashMap;
import java.util.Map;

@RestController
@RequestMapping("/pedidos")
public class PedidoController {

    @Autowired
    private PedidoService pedidoService;


    @PostMapping
    public ResponseEntity<Map<String, Integer>> crearPedido(@RequestBody Pedido pedido) {
        try {
            int idPedido = pedidoService.crearPedido(pedido.getIdUsuario(), pedido.getIdDireccion(), pedido.getTotal(), pedido.getIdEstado());
            Map<String, Integer> response = new HashMap<>();
            response.put("idPedido", idPedido);
            return new ResponseEntity<>(response, HttpStatus.CREATED);
        } catch (SQLException e) {
            System.out.println("Error creando pedido: " + e.getMessage());
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

    @PostMapping("/{idPedido}/detalle")
    public ResponseEntity<Void> crearDetallePedido(@PathVariable int idPedido, @RequestBody DetallePedido pedido) {
        try {
            pedidoService.crearDetallePedido(idPedido, pedido.getIdProducto(), pedido.getCantidad(), pedido.getPrecio());
            return new ResponseEntity<>(HttpStatus.CREATED);
        } catch (SQLException e) {
            System.out.println("Error creando detalle pedido: {}" + e.getMessage() + e);
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
