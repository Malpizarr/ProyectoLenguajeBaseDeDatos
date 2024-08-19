package com.example.proyectodblenguajes.Service;

import com.example.proyectodblenguajes.DAOs.UsuarioDao;
import com.example.proyectodblenguajes.Models.DTO.User;
import com.example.proyectodblenguajes.Models.Usuario;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import java.sql.SQLException;
import java.util.List;
import java.util.stream.Collectors;

@Service
public class UsuarioService {

    @Autowired
    private UsuarioDao usuarioDAO;

    public void crearUsuario(Usuario usuario) throws SQLException {
        usuarioDAO.crearUsuario(usuario.getNombreUsuario(), usuario.getContrasena(), usuario.getCorreoElectronico());
    }

    public Usuario obtenerUsuario(String username) throws SQLException {
        return usuarioDAO.obtenerUsuario(username);
    }

    public void actualizarUsuario(Usuario usuario) throws SQLException {
        usuarioDAO.actualizarUsuario(usuario);
    }

    public Usuario autenticarUsuario(String nombreUsuario, String contrasena) throws SQLException {
        Usuario usuario = usuarioDAO.obtenerUsuario(nombreUsuario);

        if (usuario != null && usuario.getContrasena().equals(contrasena)) {
            return usuario;
        } else {
            return null;
        }
    }

    public List<User> obtenerTodosLosUsuarios() throws SQLException {
        List<User> usuarios = usuarioDAO.obtenerTodosLosUsuarios();
        return usuarios.stream()
                .map(usuario -> new User(usuario.getUsername(), usuario.getEmail(), usuario.getRole()))
                .collect(Collectors.toList());
    }

    public void eliminarUsuario(int id) throws SQLException {
        usuarioDAO.eliminarUsuario(id);
    }
}
