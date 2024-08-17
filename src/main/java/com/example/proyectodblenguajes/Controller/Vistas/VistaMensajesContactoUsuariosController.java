package com.example.proyectodblenguajes.Controller.Vistas;

import com.example.proyectodblenguajes.Models.Vistas.VistaMensajesContactoUsuarios;
import com.example.proyectodblenguajes.Service.Vistas.VistaMensajesContactoUsuariosService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import java.sql.SQLException;
import java.util.List;

@RestController
@RequestMapping("/mensajes-contacto-usuarios")
public class VistaMensajesContactoUsuariosController {

    @Autowired
    private VistaMensajesContactoUsuariosService vistaMensajesContactoUsuariosService;

    @GetMapping
    public ResponseEntity<List<VistaMensajesContactoUsuarios>> listarMensajesContactoUsuarios() {
        try {
            List<VistaMensajesContactoUsuarios> mensajesContactoUsuarios = vistaMensajesContactoUsuariosService.listarMensajesContactoUsuarios();
            return new ResponseEntity<>(mensajesContactoUsuarios, HttpStatus.OK);
        } catch (SQLException e) {
            return new ResponseEntity<>(HttpStatus.INTERNAL_SERVER_ERROR);
        }
    }
}
