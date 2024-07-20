package com.example.proyectodblenguajes.Service;

import com.example.proyectodblenguajes.DAOs.MensajeContactoDao;
import com.example.proyectodblenguajes.Models.MensajeContacto;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.sql.SQLException;

@Service
public class MensajeContactoService {

    @Autowired
    private MensajeContactoDao mensajeContactoDao;

    public void crearMensajeContacto(MensajeContacto mensajeContacto) throws SQLException {
        mensajeContactoDao.crearMensajeContacto(mensajeContacto.getIdUsuario(), mensajeContacto.getMensaje());
    }

    public MensajeContacto obtenerMensajeContacto(int idMensaje) throws SQLException {
        return mensajeContactoDao.obtenerMensajeContacto(idMensaje);
    }

    public void actualizarMensajeContacto(MensajeContacto mensajeContacto) throws SQLException {
        mensajeContactoDao.actualizarMensajeContacto(mensajeContacto);
    }

    public void eliminarMensajeContacto(int idMensaje) throws SQLException {
        mensajeContactoDao.eliminarMensajeContacto(idMensaje);
    }
}
