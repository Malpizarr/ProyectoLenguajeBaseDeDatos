package com.example.proyectodblenguajes.Service;

import com.example.proyectodblenguajes.DAOs.UsuarioDao;
import com.example.proyectodblenguajes.Models.Usuario;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import java.sql.SQLException;
import java.util.List;

@Service
public class UsuarioService {

    @Autowired
    private UsuarioDao usuarioDAO;

    public void crearUsuario(Usuario usuario) throws SQLException {
        usuarioDAO.crearUsuario(usuario.getNombreUsuario(), usuario.getContrasena(), usuario.getCorreoElectronico(), usuario.getRol());
    }

    public Usuario obtenerUsuario(int id) throws SQLException {
        return usuarioDAO.obtenerUsuario(id);
    }

    public void actualizarUsuario(Usuario usuario) throws SQLException {
        usuarioDAO.actualizarUsuario(usuario);
    }

    public void eliminarUsuario(int id) throws SQLException {
        usuarioDAO.eliminarUsuario(id);
    }
}
