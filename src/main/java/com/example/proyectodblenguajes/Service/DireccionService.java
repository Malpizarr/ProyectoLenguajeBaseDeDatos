package com.example.proyectodblenguajes.Service;

import com.example.proyectodblenguajes.DAOs.DireccionDao;
import com.example.proyectodblenguajes.Models.Direccion;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.sql.SQLException;

@Service
public class DireccionService {

    @Autowired
    private DireccionDao direccionDao;

    public void crearDireccion(Direccion direccion) throws SQLException {
        direccionDao.crearDireccion(
                direccion.getIdUsuario(),
                direccion.getDireccionLinea1(),
                direccion.getDireccionLinea2(),
                direccion.getCiudad(),
                direccion.getEstado(),
                direccion.getCodigoPostal(),
                direccion.getPais()
        );
    }

    public Direccion obtenerDireccion(int idDireccion) throws SQLException {
        return direccionDao.obtenerDireccion(idDireccion);
    }

    public void actualizarDireccion(Direccion direccion) throws SQLException {
        direccionDao.actualizarDireccion(direccion);
    }

    public void eliminarDireccion(int idDireccion) throws SQLException {
        direccionDao.eliminarDireccion(idDireccion);
    }
}
