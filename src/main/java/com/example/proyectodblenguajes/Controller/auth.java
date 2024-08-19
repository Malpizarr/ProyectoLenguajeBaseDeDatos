package com.example.proyectodblenguajes.Controller;

import com.example.proyectodblenguajes.Models.Usuario;
import com.example.proyectodblenguajes.Service.UsuarioService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import java.sql.SQLException;
import java.util.HashMap;
import java.util.Map;

@RestController
@RequestMapping("/auth")
public class auth {

    @Autowired
    private UsuarioService usuarioService;

    @PostMapping("/login")
    public ResponseEntity<Map<String, String>> login(@RequestBody Map<String, String> loginData) throws SQLException {
        String username = loginData.get("username");
        String password = loginData.get("password");

        Usuario usuario = usuarioService.autenticarUsuario(username, password);

        if (usuario != null) {
            Map<String, String> response = new HashMap<>();
            response.put("username", usuario.getNombreUsuario());
            response.put("role", usuario.getRol());
            response.put("email", usuario.getCorreoElectronico());
            return new ResponseEntity<>(response, HttpStatus.OK);
        } else {
            return new ResponseEntity<>(HttpStatus.UNAUTHORIZED);
        }
    }

    @PostMapping("/register")
    public ResponseEntity<Void> register(@RequestBody Map<String, String> registerData) {
        String username = registerData.get("username");
        String password = registerData.get("password");
        String email = registerData.get("email");

        Usuario usuario = new Usuario();
        usuario.setNombreUsuario(username);
        usuario.setContrasena(password);
        usuario.setCorreoElectronico(email);
        try {
            usuarioService.crearUsuario(usuario);
            return new ResponseEntity<>(HttpStatus.CREATED);
        } catch (SQLException e) {
            System.out.println("Error creando usuario: {}" + e.getMessage() + e);
            return new ResponseEntity<>(HttpStatus.INTERNAL_SERVER_ERROR);
        }
    }
}

